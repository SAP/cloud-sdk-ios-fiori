import AVFoundation
import OSLog
import SwiftUI
#if canImport(VisionKit) && os(iOS) && !targetEnvironment(macCatalyst)
    import VisionKit
#endif

/// A barcode scanner implementation using Apple's VisionKit framework.
///
/// This class utilizes the `DataScannerViewController` to scan barcodes and text
/// using the device's camera. It conforms to the `BarcodeScanner` protocol.
///
/// ## Usage
/// The `BarcodeScannerManager` typically manages instances of this scanner.
/// 1.  `startMonitoring()`: Checks camera permissions and prepares the `DataScannerViewController`.
///     Sets status to `.ready` if successful.
/// 2.  `getScannerView()`: Returns the `DataScannerViewController` instance, which should be
///     presented by the application (e.g., via a `UIViewControllerRepresentable`).
/// 3.  `triggerScan()`: Called (usually after the view is presented) to start the
///     `DataScannerViewController`'s actual scanning process. Status becomes `.scanning`.
/// 4.  Barcode data is reported via the `BarcodeScannerDelegate`.
/// 5.  `stopMonitoring()`: Stops the scan and releases the camera resources.
///
/// Ensure the `NSCameraUsageDescription` key is included in your app's `Info.plist`.
@MainActor
public final class VisionKitScanner: NSObject, BarcodeScanner {
    /// The type of this scanner, `.visionKit`.
    public let type: ScannerType = .visionKit
    /// The delegate responsible for receiving status updates and scanned barcode data.
    public weak var delegate: (any BarcodeScannerDelegate)?

    /// Logger for this class.
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "cloud.sdk.ios.fiori.barcodescanner", category: "VisionKitScanner")

    /// The current status of the VisionKit scanner.
    /// Changes to this property are logged and reported to the `delegate`.
    public private(set) var currentStatus: ScannerStatus = .idle {
        didSet {
            if oldValue != self.currentStatus {
                self.logger.info("Status changed from \(oldValue.description) to \(self.currentStatus.description)")
                self.delegate?.barcodeScannerDidUpdateStatus(self.currentStatus, for: self)
            }
        }
    }

    /// This is the view that shows the camera feed and performs the scanning.
    #if canImport(VisionKit) && os(iOS) && !targetEnvironment(macCatalyst)
        public var visionScannerVC: DataScannerViewController?
    #else
        public var visionScannerVC: UIViewController?
    #endif
    /// A flag to prevent race conditions when `triggerScan` is called multiple times rapidly.
    private var isAttemptingScanStart: Bool = false
    /// The data types (e.g., barcodes, text) that the scanner should recognize.
    #if canImport(VisionKit) && os(iOS) && !targetEnvironment(macCatalyst)
        private let recognizedDataTypes: Set<DataScannerViewController.RecognizedDataType>
    #else
        private let recognizedDataTypes: Set<BarcodeDataType>
    #endif
    /// A Boolean value indicating whether the scanner should continue scanning after finding an item,
    /// or stop after the first successful scan. This is passed to the `DataScannerViewController`.
    public let recognizesMultipleItems: Bool
    /// A Boolean indicating if `DataScannerViewController` is supported on the current device and OS version.
    #if canImport(VisionKit) && os(iOS) && !targetEnvironment(macCatalyst)
        private var isSupportedOnDevice: Bool { DataScannerViewController.isSupported }
    #else
        private var isSupportedOnDevice: Bool { false }
    #endif
    /// A cached value for camera permission status. Updated by `checkPermissionsAndUpdateStatus`.
    private var hasCameraPermission: Bool = false
    /// Whether to show the Cancel button in the scanning view. Defaults to true.
    public var showCancelButton: Bool = true
    /// Whether to show the flash button in the scanning view. Defaults to true.
    public var showFlashButton: Bool = true
    /// Closure called when the Cancel button is tapped.
    public var onCancelTapped: (() -> Void)?
    /// Tracks the torch state internally.
    public var isTorchOn: Bool = false

    /// Initializes a new `VisionKitScanner`.
    /// - Parameters:
    ///   - recognizedDataTypes: The types of data the scanner should look for (e.g., `[.barcode()]`).
    ///                          Defaults to `[.barcode()]`.
    ///   - recognizesMultipleItems: Whether the scanner should detect multiple items in a single session
    ///                              or stop after the first. Defaults to `false`.
    public init(
        recognizedDataTypes: Set<BarcodeDataType> = [.barcode()],
        recognizesMultipleItems: Bool = false
    ) {
        #if canImport(VisionKit) && os(iOS) && !targetEnvironment(macCatalyst)
            self.recognizedDataTypes = Set(recognizedDataTypes.map { $0.toVisionKitType() })
        #else
            self.recognizedDataTypes = recognizedDataTypes
        #endif
        self.recognizesMultipleItems = recognizesMultipleItems
        super.init()
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        self.hasCameraPermission = status == .authorized
        self.logger.info("Initialized. Camera supported: \(self.isSupportedOnDevice). Initial permission: \(self.hasCameraPermission). Recognized types: \(recognizedDataTypes)")
        self.updateInternalStatus()
    }

    /// Prepares the VisionKit scanner for operation.
    ///
    /// This method checks for camera support and permissions. If granted, it initializes the
    /// `DataScannerViewController` (if not already done) and sets the status to `.ready`.
    /// The actual camera view is not started by this method; `triggerScan()` does that.
    /// - Throws: A `ScannerError` if camera is not supported or permissions are denied.
    public func startMonitoring() async throws {
        self.logger.info("Start monitoring requested.")
        guard await self.checkPermissionsAndUpdateStatus() else {
            self.logger.warning("Start monitoring aborted due to permissions.")
            // Status already set by checkPermissionsAndUpdateStatus
            throw self.currentStatus == .error(.permissionDenied) ? ScannerError.permissionDenied : ScannerError(code: "perm_check_failed", message: "Permission check failed before monitoring.")
        }

        guard self.isSupportedOnDevice else {
            self.logger.error("Camera not supported on this device.")
            self.currentStatus = .error(ScannerError(code: "camera_unsupported", message: "Camera features are not supported on this device."))
            throw ScannerError(code: "camera_unsupported", message: "Camera features are not supported on this device.")
        }
        
        self.initializeScannerVCIfNeeded()
        self.currentStatus = .ready
        self.logger.info("Monitoring started, status set to Ready.")
    }

    /// Stops the VisionKit scanner and releases associated resources.
    ///
    /// This involves stopping any active scan on the `DataScannerViewController` and de-initializing it.
    /// The status is typically set to `.ready` if permissions are still valid, allowing for a restart,
    /// or an appropriate error state if permissions were revoked or the camera became unsupported.
    public func stopMonitoring() {
        self.logger.info("Stop monitoring requested.")
        self.stopScanningInternal() // Stops the DataScannerViewController's scanning
        
        // De-initialize the VC to free resources and ensure a fresh start next time
        #if canImport(VisionKit) && os(iOS) && !targetEnvironment(macCatalyst)
            self.visionScannerVC?.delegate = nil
        #endif
        self.visionScannerVC?.removeFromParent() // Though SwiftUI Representable handles hierarchy, good practice if we nil it.
        self.visionScannerVC = nil
        self.logger.info("VisionScannerVC de-initialized.")

        if self.isSupportedOnDevice, self.hasCameraPermission {
            self.currentStatus = .ready
        } else {
            self.updateInternalStatus()
        }
        self.logger.info("Monitoring stopped, status set to \(self.currentStatus.description).")
        self.isTorchOn = false
    }

    /// Starts the actual scanning process using the `DataScannerViewController`.
    ///
    /// This method should be called when the scanner's view (obtained via `getScannerView()`) is visible.
    /// It checks permissions and support again, ensures the `DataScannerViewController` is initialized,
    /// and then calls `startScanning()` on it. Status transitions to `.scanning` on success.
    /// - Throws: A `ScannerError` if permissions are denied, camera is unsupported,
    ///           initialization fails, or `DataScannerViewController.startScanning()` fails.
    public func triggerScan() async throws {
        self.logger.info("Trigger scan requested.")
        guard self.currentStatus != .scanning else {
            self.logger.info("Already scanning, triggerScan is a no-op.")
            return
        }
        guard await self.checkPermissionsAndUpdateStatus() else {
            self.logger.warning("Trigger scan aborted due to permissions.")
            throw self.currentStatus == .error(.permissionDenied) ? ScannerError.permissionDenied : ScannerError(code: "perm_check_failed", message: "Permission check failed before trigger.")
        }
        guard self.isSupportedOnDevice else {
            self.logger.error("Camera not supported, cannot trigger scan.")
            self.currentStatus = .error(ScannerError(code: "camera_unsupported", message: "Camera not supported."))
            throw ScannerError(code: "camera_unsupported", message: "Camera not supported.")
        }

        self.initializeScannerVCIfNeeded()
        
        #if canImport(VisionKit) && os(iOS) && !targetEnvironment(macCatalyst)
            guard let vc = visionScannerVC else {
                self.logger.error("VisionScannerVC is nil, cannot start scanning.")
                self.currentStatus = .error(.initializationFailed)
                throw ScannerError.initializationFailed
            }

            if vc.isScanning {
                self.logger.info("DataScannerViewController is already scanning. Ensuring internal state matches.")
                self.currentStatus = .scanning
                return
            }

            self.logger.info("Attempting to call DataScannerViewController.startScanning().")
            self.isAttemptingScanStart = true
            do {
                try vc.startScanning()
                self.currentStatus = .scanning
                self.logger.info("DataScannerViewController.startScanning() succeeded. Status: Scanning.")
            } catch {
                self.logger.error("DataScannerViewController.startScanning() failed: \(error.localizedDescription)")
                let scannerError = ScannerError(code: "vk_start_failed", message: "VisionKit failed to start scanning: \(error.localizedDescription)")
                self.currentStatus = .error(scannerError)
                throw scannerError
            }
        #else
            self.logger.error("Scanning not supported on Mac Catalyst.")
            self.currentStatus = .error(ScannerError(code: "camera_unsupported", message: "Scanning not supported on Mac Catalyst."))
            throw ScannerError(code: "camera_unsupported", message: "Scanning not supported on Mac Catalyst.")
        #endif
    }

    /// Resets the VisionKit scanner to its initial state.
    public func reset() {
        self.logger.info("Reset requested.")
        self.stopScanningInternal()
        #if canImport(VisionKit) && os(iOS) && !targetEnvironment(macCatalyst)
            self.visionScannerVC?.delegate = nil
        #endif
        self.visionScannerVC?.removeFromParent()
        self.visionScannerVC = nil
        self.hasCameraPermission = AVCaptureDevice.authorizationStatus(for: .video) == .authorized // Re-check
        self.updateInternalStatus() // Will likely go to .idle or .error
        if case .error = self.currentStatus {} else { self.currentStatus = .idle } // Ensure idle if no error
        self.logger.info("Scanner reset. Status: \(self.currentStatus.description)")
    }

    /// Returns the `DataScannerViewController` instance to be presented for camera scanning.
    public func getScannerView() -> UIViewController? {
        self.logger.info("getScannerView called.")
        if !self.isSupportedOnDevice || !self.hasCameraPermission {
            self.logger.warning("Scanner view requested but device not supported or no permission. Returning nil.")
            // Update status to reflect this attempt if it's not already an error
            if self.currentStatus != .error(.permissionDenied), self.currentStatus != .error(ScannerError(code: "camera_unsupported", message: "")) {
                self.updateInternalStatus() // Let updateInternalStatus set the correct error
            }
            return nil
        }
        self.initializeScannerVCIfNeeded()
        return self.visionScannerVC
    }

    /// Checks if the VisionKit scanner is available on this device.
    public func isAvailable() -> Bool {
        let available = self.isSupportedOnDevice && self.hasCameraPermission
        self.logger.info("isAvailable check: \(available) (Supported: \(self.isSupportedOnDevice), Permission: \(self.hasCameraPermission))")
        return available
    }
    
    // Torch Control
    public func toggleTorch() -> Bool {
        guard self.isTorchAvailable else {
            self.logger.warning("Torch is not available on this device.")
            return false
        }
        do {
            let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back)
            guard let device else {
                self.logger.warning("No back camera available.")
                return false
            }
            try device.lockForConfiguration()
            self.isTorchOn = !self.isTorchOn
            device.torchMode = self.isTorchOn ? .on : .off
            device.unlockForConfiguration()
            self.logger.info("Torch toggled to: \(self.isTorchOn ? "On" : "Off")")
            return true
        } catch {
            self.logger.error("Failed to toggle torch: \(error.localizedDescription)")
            return false
        }
    }
    
    public var isTorchAvailable: Bool {
        guard let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back) else {
            return false
        }
        return device.hasTorch && device.isTorchAvailable
    }
    
    // Provide SwiftUI button view
    public func makeControlButtonsView(isTorchOn: Binding<Bool>, onCancelTapped: @escaping () -> Void) -> some View {
        ScannerControlButtons(scanner: self, isTorchOn: isTorchOn, onCancelTapped: onCancelTapped)
    }

    // MARK: - DataScannerViewControllerDelegate Callbacks

    /// Called by `DataScannerViewController` when new items (barcodes, text) are recognized.
    #if canImport(VisionKit) && os(iOS) && !targetEnvironment(macCatalyst)
        public func dataScanner(_ dataScanner: DataScannerViewController, didAdd addedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            self.logger.info("DataScanner didAddItems. Count: \(addedItems.count). Recognizes multiple: \(self.recognizesMultipleItems)")
            var receivedDataThisCall = false
            for item in addedItems {
                switch item {
                case .barcode(let barcode):
                    let payload = barcode.payloadStringValue
                    self.logger.info("Detected barcode. Payload: \(payload ?? "NIL"). Observation: \(barcode.observation)")
                    if let payload, !payload.isEmpty {
                        self.delegate?.barcodeScannerDidReceiveBarcode(payload, from: self)
                        receivedDataThisCall = true
                    } else {
                        self.logger.warning("Barcode payloadStringValue is nil or empty.")
                    }
                case .text(let text):
                    self.logger.info("Detected text: \(text.transcript)")
                    if self.recognizedDataTypes.contains(.text()) { // Only process if text was an expected type
                        self.delegate?.barcodeScannerDidReceiveBarcode(text.transcript, from: self)
                        receivedDataThisCall = true
                    }
                default:
                    self.logger.warning("Unknown item type detected.")
                }
                if receivedDataThisCall, !self.recognizesMultipleItems {
                    break
                }
            }

            if receivedDataThisCall, !self.recognizesMultipleItems {
                self.logger.info("Single item received and processed. Stopping scan as recognizesMultipleItems is false.")
                self.stopScanningInternal()
            }
        }

        /// Called by `DataScannerViewController` when items are removed from recognition (e.g., moved out of view).
        public func dataScanner(_ dataScanner: DataScannerViewController, didRemove removedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            // logger.info("DataScanner didRemoveItems. Count: \(removedItems.count)")
            // Usually not critical for simple barcode scanning unless you need to track items leaving the frame.
        }

        /// Called by `DataScannerViewController` when recognized items are updated (e.g., refined position).
        public func dataScanner(_ dataScanner: DataScannerViewController, didUpdate updatedItems: [RecognizedItem], allItems: [RecognizedItem]) {
            // logger.info("DataScanner didUpdateItems. Count: \(updatedItems.count)")
        }

        /// Called by `DataScannerViewController` if it becomes unavailable due to an error (e.g., system interruption).
        public func dataScanner(_ dataScanner: DataScannerViewController, becameUnavailableWithError error: Error) {
            self.logger.error("DataScanner became unavailable with error: \(error.localizedDescription)")
            self.isAttemptingScanStart = false // Reset flag
            self.currentStatus = .error(ScannerError(code: "scanner_unavailable", message: error.localizedDescription))
        }
    
        /// Called when the `DataScannerViewController`'s view becomes active (e.g., after `startScanning()` is successful).
        public func dataScannerDidBecomeActive(_ dataScanner: DataScannerViewController) {
            self.logger.info("DataScannerDidBecomeActive.")
            if !self.isAttemptingScanStart, self.currentStatus != .scanning {
                self.logger.info("Scanner became active, ensuring status is .scanning.")
                self.currentStatus = .scanning
            }
        }

        /// Called when the `DataScannerViewController`'s view disappears or becomes inactive.
        public func dataScannerViewDidDisappear(_ dataScanner: DataScannerViewController) {
            self.logger.info("DataScannerViewDidDisappear.")
            if self.currentStatus == .scanning {
                self.logger.info("View disappeared while scanning, updating status. Consider calling stopScanningInternal.")
                self.updateInternalStatus() // Re-evaluate status
            }
        }
    #endif

    // MARK: - Private Helper Methods

    /// Initializes the `visionScannerVC` instance if it's `nil` and prerequisites (support, permissions) are met.
    private func initializeScannerVCIfNeeded() {
        guard self.visionScannerVC == nil else { return }

        guard self.isSupportedOnDevice else {
            self.logger.warning("Cannot initialize ScannerVC: Camera not supported.")
            self.currentStatus = .error(ScannerError(code: "camera_unsupported", message: "Camera not supported."))
            return
        }
        guard self.hasCameraPermission else {
            self.logger.warning("Cannot initialize ScannerVC: Camera permission not granted.")
            self.currentStatus = .error(.permissionDenied)
            return
        }

        #if canImport(VisionKit) && os(iOS) && !targetEnvironment(macCatalyst)
            self.logger.info("Initializing DataScannerViewController. Recognized types: \(self.recognizedDataTypes), MultipleItems: \(self.recognizesMultipleItems)")
            let vc = DataScannerViewController(
                recognizedDataTypes: recognizedDataTypes,
                qualityLevel: .balanced, // .accurate can be slower but better for small/dense codes
                recognizesMultipleItems: recognizesMultipleItems,
                isHighFrameRateTrackingEnabled: false, // Set to true if needed, can consume more power
                isGuidanceEnabled: true,
                isHighlightingEnabled: true
            )
            vc.delegate = self
            self.visionScannerVC = vc
            self.logger.info("DataScannerViewController initialized and delegate set.")
        #else
            self.logger.info("Skipping DataScannerViewController initialization on Mac Catalyst.")
            self.currentStatus = .error(ScannerError(code: "camera_unsupported", message: "Scanning not supported on Mac Catalyst."))
        #endif
    }

    /// Stops the `DataScannerViewController`'s scanning process and updates internal state.
    private func stopScanningInternal() {
        self.logger.info("stopScanningInternal called. Current VC scan state: \(self.visionScannerVC?.isScanning ?? false), Our isAttemptingScanStart: \(self.isAttemptingScanStart)")
        #if canImport(VisionKit) && os(iOS) && !targetEnvironment(macCatalyst)
            self.logger.info("stopScanningInternal called. Current VC scan state: \(self.visionScannerVC?.isScanning ?? false), Our isAttemptingScanStart: \(self.isAttemptingScanStart)")
            guard let vc = visionScannerVC, vc.isScanning || isAttemptingScanStart else {
                if self.isAttemptingScanStart {
                    self.isAttemptingScanStart = false
                    self.logger.info("Was attempting scan start, but VC not scanning or nil. Resetting flag.")
                } else {
                    self.logger.info("Not currently scanning or attempting to scan, or VC is nil. stopScanningInternal is a no-op for VC.")
                }
                // Ensure status is not .scanning if we are here.
                if self.currentStatus == .scanning {
                    self.updateInternalStatus()
                }
                return
            }

            if vc.isScanning {
                self.logger.info("Calling DataScannerViewController.stopScanning().")
                vc.stopScanning()
            }
        #else
            self.logger.info("No scanning to stop on Mac Catalyst.")
        #endif
        self.isAttemptingScanStart = false
        self.updateInternalStatus()
        self.logger.info("Internal scan stopped. Status after updateInternalStatus: \(self.currentStatus.description)")
    }

    /// Asynchronously checks for camera permissions and updates `hasCameraPermission` and `currentStatus`.
    /// - Returns: `true` if permission is granted, `false` otherwise.
    @discardableResult
    private func checkPermissionsAndUpdateStatus() async -> Bool {
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        self.logger.info("Checking permissions. Current AVStatus: \(status.rawValue)")
        switch status {
        case .authorized:
            self.hasCameraPermission = true
            self.logger.info("Permission already authorized.")
            if self.currentStatus == .error(.permissionDenied) { self.updateInternalStatus() }
            return true
        case .notDetermined:
            self.logger.info("Permission not determined. Requesting access.")
            let granted = await AVCaptureDevice.requestAccess(for: .video)
            self.logger.info("Permission request result: \(granted)")
            self.hasCameraPermission = granted
            self.updateInternalStatus()
            return granted
        case .denied, .restricted:
            self.hasCameraPermission = false
            self.logger.warning("Permission denied or restricted.")
            self.currentStatus = .error(.permissionDenied)
            return false
        @unknown default:
            self.hasCameraPermission = false
            self.logger.error("Unknown camera permission status: \(status.rawValue)")
            self.currentStatus = .error(ScannerError(code: "perm_unknown", message: "Unknown permission status."))
            return false
        }
    }
    
    /// Checks camera permissions and prepares the scanner for presentation.
    /// - Parameter manager: The `BarcodeScannerManager` managing this scanner.
    /// - Returns: A `Result` indicating success (scanner is ready to present) or failure (with a `ScannerError`).
    public func checkPermissionsAndPrepareForPresentation(manager: BarcodeScannerManager) async -> Result<Void, ScannerError> {
        self.logger.info("Checking camera permissions and preparing for presentation.")

        // Ensure this scanner is active in the manager
        if manager.activeScannerType != .visionKit || manager.status == .error(.notAvailable) {
            self.logger.info("Scanner not active or not available. Activating VisionKit scanner.")
            do {
                try await manager.setActiveScanner(.visionKit)
                if case .error(let error) = manager.status {
                    self.logger.error("Failed to activate scanner: \(error.localizedDescription)")
                    return .failure(error)
                }
            } catch let error as ScannerError {
                logger.error("Failed to activate scanner: \(error.localizedDescription)")
                return .failure(error)
            } catch {
                let unknownError = ScannerError(code: "setup_failed", message: "Unexpected error: \(error.localizedDescription)")
                self.logger.error("Unexpected error during scanner activation: \(error.localizedDescription)")
                return .failure(unknownError)
            }
        }

        // Check camera permissions
        let hasPermission = await checkPermissionsAndUpdateStatus()
        if hasPermission {
            self.logger.info("Camera permissions granted. Scanner is ready for presentation.")
            // Ensure scanner is in a ready state
            if self.currentStatus != .ready, self.currentStatus != .scanning {
                do {
                    try await self.startMonitoring()
                    if case .error(let error) = currentStatus {
                        self.logger.error("Failed to start monitoring: \(error.localizedDescription)")
                        return .failure(error)
                    }
                } catch let error as ScannerError {
                    logger.error("Failed to start monitoring: \(error.localizedDescription)")
                    return .failure(error)
                } catch {
                    let unknownError = ScannerError(code: "start_monitoring_failed", message: "Unexpected error: \(error.localizedDescription)")
                    self.logger.error("Unexpected error during startMonitoring: \(error.localizedDescription)")
                    return .failure(unknownError)
                }
            }
            return .success(())
        } else {
            self.logger.error("Camera permissions denied or restricted.")
            let error = ScannerError.permissionDenied
            if self.currentStatus != .error(.permissionDenied) {
                self.currentStatus = .error(error)
            }
            return .failure(error)
        }
    }
    
    /// Updates the `currentStatus` property based on the internal state of the scanner
    private func updateInternalStatus() {
        if case .error(let currentError) = currentStatus,
           currentError.code != ScannerError.permissionDenied.code,
           currentError.code != "camera_unsupported",
           currentError.code != "perm_unknown"
        {
            if !self.isSupportedOnDevice {
                self.currentStatus = .error(ScannerError(code: "camera_unsupported", message: "Camera not supported."))
            } else if !self.hasCameraPermission {
                self.currentStatus = .error(.permissionDenied)
            }
            self.logger.info("updateInternalStatus: Preserving existing error \(currentError.code) or updating if support/permission changed. New status: \(self.currentStatus.description)")
            return
        }

        if !self.isSupportedOnDevice {
            self.currentStatus = .error(ScannerError(code: "camera_unsupported", message: "Camera not supported."))
        } else if !self.hasCameraPermission {
            self.currentStatus = .error(.permissionDenied)
        } else {
            #if canImport(VisionKit) && os(iOS) && !targetEnvironment(macCatalyst)
                if (self.visionScannerVC as? DataScannerViewController)?.isScanning ?? false {
                    self.currentStatus = .scanning
                } else {
                    self.currentStatus = (self.visionScannerVC != nil) ? .ready : .idle
                }
            #else
                self.currentStatus = .error(ScannerError(code: "camera_unsupported", message: "Camera not supported."))
            #endif
        }
        self.logger.info("updateInternalStatus: Final status: \(self.currentStatus.description)")
    }
}

#if canImport(VisionKit) && os(iOS) && !targetEnvironment(macCatalyst)
    extension VisionKitScanner: DataScannerViewControllerDelegate {}
#endif
