import CoreLocation
@testable import FioriSwiftUICore
import XCTest

// MARK: - Tests

final class AttachmentLocationServiceTests: XCTestCase {
    // MARK: - LocationAccuracy Tests

    func testLocationAccuracyMapping() {
        let testCases: [(LocationCaptureMode.LocationAccuracy, CLLocationAccuracy)] = [
            (.bestForNavigation, kCLLocationAccuracyBestForNavigation),
            (.best, kCLLocationAccuracyBest),
            (.nearestTenMeters, kCLLocationAccuracyNearestTenMeters),
            (.hundredMeters, kCLLocationAccuracyHundredMeters),
            (.kilometer, kCLLocationAccuracyKilometer),
            (.threeKilometers, kCLLocationAccuracyThreeKilometers)
        ]

        for (accuracy, expected) in testCases {
            XCTAssertEqual(accuracy.clLocationAccuracy, expected, "Failed for \(accuracy)")
        }
    }

    // MARK: - GetCurrentLocation Tests

    @MainActor
    func testGetCurrentLocationWithDisabledModeReturnsNil() async {
        let mockLocationManager = MockLocationManager()
        let service = AttachmentLocationService(
            locationCaptureMode: .disabled,
            locationManager: mockLocationManager
        )
        let location = await service.getCurrentLocation()
        XCTAssertNil(location)
        XCTAssertFalse(mockLocationManager.requestLocationCalled)
    }

    @MainActor
    func testGetCurrentLocationWithoutUsageDescriptionReturnsNil() async {
        let mockInfoProvider = MockInfoDictionaryProvider()
        // No NSLocationWhenInUseUsageDescription in mockInfoDictionary
        let mockLocationManager = MockLocationManager()

        let service = AttachmentLocationService(
            locationCaptureMode: .enabled(accuracy: .best),
            infoDictionaryProvider: mockInfoProvider,
            locationManager: mockLocationManager
        )
        let location = await service.getCurrentLocation()
        XCTAssertNil(location)
        XCTAssertFalse(mockLocationManager.requestLocationCalled)
    }

    @MainActor
    func testGetCurrentLocationWithDeniedAuthorizationReturnsNil() async {
        let mockInfoProvider = MockInfoDictionaryProvider()
        mockInfoProvider.mockInfoDictionary = ["NSLocationWhenInUseUsageDescription": "Test"]
        let mockLocationManager = MockLocationManager()
        mockLocationManager.authorizationStatus = .denied

        let service = AttachmentLocationService(
            locationCaptureMode: .enabled(accuracy: .best),
            infoDictionaryProvider: mockInfoProvider,
            locationManager: mockLocationManager
        )
        let location = await service.getCurrentLocation()
        XCTAssertNil(location)
        XCTAssertFalse(mockLocationManager.requestLocationCalled)
    }

    @MainActor
    func testGetCurrentLocationWithAuthorizedStatusRequestsLocation() async {
        let mockInfoProvider = MockInfoDictionaryProvider()
        mockInfoProvider.mockInfoDictionary = ["NSLocationWhenInUseUsageDescription": "Test"]
        let mockLocationManager = MockLocationManager()
        mockLocationManager.authorizationStatus = .authorizedWhenInUse

        let service = AttachmentLocationService(
            locationCaptureMode: .enabled(accuracy: .hundredMeters),
            infoDictionaryProvider: mockInfoProvider,
            locationManager: mockLocationManager
        )

        // Start the location request (will timeout since mock doesn't deliver location)
        let task = Task {
            await service.getCurrentLocation()
        }

        // Give time for requestLocation to be called
        try? await Task.sleep(nanoseconds: 100000000)

        XCTAssertTrue(mockLocationManager.requestLocationCalled)
        XCTAssertEqual(mockLocationManager.desiredAccuracy, kCLLocationAccuracyHundredMeters)

        task.cancel()
    }

    // MARK: - ExtractLocation Tests

    func testExtractLocationWithDisabledModeReturnsNil() async {
        let service = AttachmentLocationService(locationCaptureMode: .disabled)
        let location = await service.extractLocation(fromAssetIdentifier: "test-identifier")
        XCTAssertNil(location)
    }

    func testExtractLocationWithNilIdentifierReturnsNil() async {
        let service = AttachmentLocationService(locationCaptureMode: .enabled(accuracy: .best))
        let location = await service.extractLocation(fromAssetIdentifier: nil)
        XCTAssertNil(location)
    }
}

// MARK: - AttachmentContext Location Tests

final class AttachmentContextLocationTests: XCTestCase {
    func testLocationCaptureModeDefault() {
        let context = AttachmentContext()
        XCTAssertEqual(context.locationCaptureMode, .disabled)
    }
}

// MARK: - Mocks

private class MockInfoDictionaryProvider: InfoDictionaryProviding {
    var mockInfoDictionary: [String: Any] = [:]

    func object(forInfoDictionaryKey key: String) -> Any? {
        self.mockInfoDictionary[key]
    }
}

private class MockLocationManager: LocationManaging {
    var delegate: CLLocationManagerDelegate?
    var desiredAccuracy: CLLocationAccuracy = kCLLocationAccuracyBest
    var authorizationStatus: CLAuthorizationStatus = .notDetermined

    var requestWhenInUseAuthorizationCalled = false
    var requestLocationCalled = false

    func requestWhenInUseAuthorization() {
        self.requestWhenInUseAuthorizationCalled = true
    }

    func requestLocation() {
        self.requestLocationCalled = true
    }
}
