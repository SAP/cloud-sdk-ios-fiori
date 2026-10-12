import CoreLocation
import Photos

/// Captures device location for attachment geo-tagging.
final class AttachmentLocationService: NSObject {
    private let locationManager: LocationManaging

    private var locationContinuation: CheckedContinuation<CLLocation?, Never>?
    private var authorizationContinuation: CheckedContinuation<CLAuthorizationStatus, Never>?

    private let locationCaptureMode: LocationCaptureMode
    private let infoDictionaryProvider: InfoDictionaryProviding

    init(
        locationCaptureMode: LocationCaptureMode,
        infoDictionaryProvider: InfoDictionaryProviding = Bundle.main,
        locationManager: LocationManaging = CLLocationManager()
    ) {
        self.locationCaptureMode = locationCaptureMode
        self.infoDictionaryProvider = infoDictionaryProvider
        self.locationManager = locationManager
        super.init()
        self.locationManager.delegate = self
    }

    private var isEnabled: Bool {
        if case .enabled = self.locationCaptureMode {
            return true
        }
        return false
    }

    private var accuracy: CLLocationAccuracy {
        if case .enabled(let accuracy) = locationCaptureMode {
            return accuracy.clLocationAccuracy
        }
        return kCLLocationAccuracyHundredMeters
    }

    private var hasLocationUsageDescription: Bool {
        guard let description = self.infoDictionaryProvider.object(forInfoDictionaryKey: "NSLocationWhenInUseUsageDescription") as? String else {
            return false
        }
        return !description.isEmpty
    }

    @MainActor
    func getCurrentLocation() async -> CLLocation? {
        guard self.isEnabled, self.hasLocationUsageDescription else {
            return nil
        }

        let status = self.locationManager.authorizationStatus

        switch status {
        case .authorizedWhenInUse:
            return await requestLocation()
        #if !os(visionOS)
            case .authorizedAlways:
                return await requestLocation()
        #endif
        case .notDetermined:
            let newStatus = await requestAuthorizationAndWait()
            #if os(visionOS)
                if newStatus == .authorizedWhenInUse {
                    return await requestLocation()
                }
            #else
                if newStatus == .authorizedWhenInUse || newStatus == .authorizedAlways {
                    return await requestLocation()
                }
            #endif
            return nil
        case .denied, .restricted:
            return nil
        @unknown default:
            return nil
        }
    }

    func extractLocation(fromAssetIdentifier assetIdentifier: String?) async -> CLLocation? {
        guard self.isEnabled else {
            return nil
        }

        let authorized = await ensurePhotoLibraryAccess()
        guard authorized, let assetIdentifier else {
            return nil
        }

        let fetchResult = PHAsset.fetchAssets(withLocalIdentifiers: [assetIdentifier], options: nil)
        return fetchResult.firstObject?.location
    }
}

// MARK: - CLLocationManagerDelegate

extension AttachmentLocationService: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        Task { @MainActor in
            let status = manager.authorizationStatus
            if status != .notDetermined {
                self.completeAuthorizationRequest(with: status)
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        Task { @MainActor in
            self.completeLocationRequest(with: locations.last)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Task { @MainActor in
            self.completeLocationRequest(with: nil)
        }
    }
}

// MARK: - Private Helpers

private extension AttachmentLocationService {
    @MainActor
    func requestAuthorizationAndWait() async -> CLAuthorizationStatus {
        if self.authorizationContinuation != nil {
            return self.locationManager.authorizationStatus
        }

        return await withCheckedContinuation { continuation in
            self.authorizationContinuation = continuation
            self.locationManager.requestWhenInUseAuthorization()
        }
    }

    @MainActor
    func completeAuthorizationRequest(with status: CLAuthorizationStatus) {
        guard let continuation = authorizationContinuation else { return }
        self.authorizationContinuation = nil
        continuation.resume(returning: status)
    }

    @MainActor
    func requestLocation() async -> CLLocation? {
        guard self.locationContinuation == nil else {
            return nil
        }

        return await withCheckedContinuation { continuation in
            self.locationContinuation = continuation

            self.locationManager.desiredAccuracy = self.accuracy
            self.locationManager.requestLocation()
        }
    }

    @MainActor
    func completeLocationRequest(with location: CLLocation?) {
        guard let continuation = locationContinuation else { return }
        self.locationContinuation = nil

        continuation.resume(returning: location)
    }

    @MainActor
    func ensurePhotoLibraryAccess() async -> Bool {
        let status = PHPhotoLibrary.authorizationStatus(for: .readWrite)

        switch status {
        case .authorized, .limited:
            return true
        case .notDetermined:
            let newStatus = await PHPhotoLibrary.requestAuthorization(for: .readWrite)
            return newStatus == .authorized || newStatus == .limited
        case .denied, .restricted:
            return false
        @unknown default:
            return false
        }
    }
}

/// Defines the location capture behavior for media uploads.
public enum LocationCaptureMode: Equatable {
    /// Location capture is disabled.
    case disabled
    /// Location capture is enabled with the specified accuracy.
    /// Higher accuracy consumes more battery.
    case enabled(accuracy: LocationAccuracy)
}

public extension LocationCaptureMode {
    /// Defines the location accuracy levels for attachment geotagging. Higher accuracy levels consume more battery.
    enum LocationAccuracy: Equatable {
        /// The highest possible accuracy that uses additional sensor data.
        case bestForNavigation
        /// The best level of accuracy available.
        case best
        /// Accurate to within 10 meters.
        case nearestTenMeters
        /// Accurate to within 100 meters.
        case hundredMeters
        /// Accurate to the nearest kilometer.
        case kilometer
        /// Accurate to the nearest three kilometers.
        case threeKilometers

        var clLocationAccuracy: CLLocationAccuracy {
            switch self {
            case .bestForNavigation:
                return kCLLocationAccuracyBestForNavigation
            case .best:
                return kCLLocationAccuracyBest
            case .nearestTenMeters:
                return kCLLocationAccuracyNearestTenMeters
            case .hundredMeters:
                return kCLLocationAccuracyHundredMeters
            case .kilometer:
                return kCLLocationAccuracyKilometer
            case .threeKilometers:
                return kCLLocationAccuracyThreeKilometers
            }
        }
    }
}

protocol InfoDictionaryProviding {
    func object(forInfoDictionaryKey key: String) -> Any?
}

extension Bundle: InfoDictionaryProviding {}

protocol LocationManaging: AnyObject {
    var delegate: CLLocationManagerDelegate? { get set }
    var desiredAccuracy: CLLocationAccuracy { get set }
    var authorizationStatus: CLAuthorizationStatus { get }
    func requestWhenInUseAuthorization()
    func requestLocation()
}

extension CLLocationManager: LocationManaging {}
