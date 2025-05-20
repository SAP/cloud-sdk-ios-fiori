import OSLog
import SwiftUI
#if canImport(ConnectSDK)
    import ConnectSDK

    /// A barcode scanner implementation for ProGlove hardware scanners using the ConnectSDK.
    ///
    /// This class manages the connection, state, and data interaction with ProGlove devices.
    /// It conforms to the `BarcodeScanner` protocol providing a unified interface for scanning operations.
    ///
    /// It handles Bluetooth LE communication via `PGCentralManager` and receives barcode data
    /// through `PGPeripheralDelegate`.
    @MainActor
    public final class ProGloveScanner: NSObject, BarcodeScanner, PGCentralManagerDelegate, PGPeripheralDelegate {
        /// The type of this scanner, `.proGlove`.
        public let type: ScannerType = .proGlove
        /// The delegate responsible for receiving status updates and scanned barcode data.
        public weak var delegate: BarcodeScannerDelegate?

        /// Logger for this class.
        private let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "cloud.sdk.ios.fiori.barcodescanner", category: "ProGloveScanner")

        /// The current status of the ProGlove scanner.
        ///
        /// Changes to this property are logged and reported to the `delegate`.
        public private(set) var currentStatus: ScannerStatus = .idle {
            didSet {
                if oldValue != self.currentStatus {
                    self.logger.info("Status changed from \(oldValue.description) to \(self.currentStatus.description)")
                    self.delegate?.barcodeScannerDidUpdateStatus(self.currentStatus, for: self)
                }
            }
        }

        /// The ProGlove SDK's central manager for handling Bluetooth LE connections.
        private var central: PGCentralManager?
        /// The currently connected or last connected ProGlove peripheral.
        private var displayedScanner: PGPeripheral?
        /// The current state of the ProGlove SDK's manager (e.g., poweredOn, poweredOff).
        private var sdkState: PGManagerState = .unknown
        /// A Boolean value indicating whether a ProGlove scanner is currently connected and ready.
        private var isScannerConnected: Bool = false
        /// Stores the last encountered error.
        private var lastError: ScannerError?
        /// A Boolean value indicating whether the scanner is currently attempting to reconnect.
        private var isReconnecting: Bool = false

        /// Initializes a new `ProGloveScanner` instance.
        ///
        /// Sets up the `PGCentralManager` and initializes the scanner's state.
        override public init() {
            super.init()
            self.logger.info("Initializing ProGloveScanner.")
            self.central = PGCentralManager(delegate: self, enableRestoration: false)
            self.sdkState = self.central?.state ?? .unknown
            self.logger.info("Initial SDK State: \(self.sdkState.rawValue)")
            self.updateInternalStatus()
        }
    
        /// Starts monitoring for ProGlove scanners and Bluetooth state changes.
        ///
        /// This method prepares the scanner for potential connections. It updates the internal state based on the
        /// current Bluetooth conditions. If Bluetooth is off or permissions are denied, it will throw an appropriate error.
        ///
        /// - Throws: A `ScannerError` if monitoring cannot be started (e.g., initialization failure, Bluetooth off, permission denied).
        public func startMonitoring() async throws {
            self.logger.info("Start Monitoring called.")
            if central == nil {
                self.logger.warning("PGCentralManager was nil. Re-initializing.")
                central = PGCentralManager(delegate: self, enableRestoration: false)
            }
            guard let central else {
                self.logger.error("PGCentralManager is still nil after attempted initialization.")
                let error = ScannerError.initializationFailed
                self.currentStatus = .error(error)
                throw error
            }

            self.sdkState = central.state
            self.logger.info("SDK State at startMonitoring: \(self.sdkState.rawValue)")
            self.updateInternalStatus()

            if case .error(let currentError) = currentStatus {
                self.logger.error("Start monitoring resulted in error status: \(currentError.localizedDescription)")
                throw currentError
            }
            self.logger.info("Start Monitoring completed. Current status: \(self.currentStatus.description)")
        }

        /// Stops monitoring for ProGlove scanners and disconnects any active scanner.
        ///
        /// Resets connection-related states and sets the status, typically to `.idle` if Bluetooth is still powered on.
        public func stopMonitoring() {
            self.logger.info("Stop Monitoring called.")
            if let scanner = displayedScanner, central?.state == .poweredOn {
                self.logger.info("Cancelling connection to scanner: \(scanner.identifier).")
                self.central?.cancelScannerConnection(scanner)
            }
            self.displayedScanner = nil
            self.isScannerConnected = false
            self.isReconnecting = false
            self.lastError = nil
        
            if self.sdkState == .poweredOn {
                self.currentStatus = .idle
            } else {
                self.updateInternalStatus()
            }
            self.logger.info("Stop Monitoring finished. Current status: \(self.currentStatus.description)")
        }
    
        /// Attempts to trigger a scan on the ProGlove device.
        ///
        /// ProGlove scanners are typically hardware-triggered. This method currently throws a `not_supported` error
        /// as software-triggering is not a standard feature or might require specific device configurations.
        /// It will throw a `not_ready` error if the scanner is not in a `ready` or `scanning` state.
        ///
        /// - Throws: A `ScannerError` if the scanner is not ready or if the operation is not supported.
        public func triggerScan() async throws {
            self.logger.info("TriggerScan called, but ProGlove is typically hardware-triggered.")
            guard self.currentStatus == .ready || self.currentStatus == .scanning else {
                throw ScannerError(code: "not_ready", message: "ProGlove scanner not ready to be triggered.")
            }
        }

        /// Generates a pairing QR code image for connecting a ProGlove scanner.
        ///
        /// This method uses the ProGlove SDK to generate a `UIImage` which is then converted to a SwiftUI `Image`.
        /// - Returns: A SwiftUI `Image` containing the pairing QR code, or `nil` if generation fails (e.g., Bluetooth not powered on).
        ///            If `nil` is returned, `currentStatus` will be updated to an error state.
        public func getPairingQRCode() -> Image? {
            self.logger.info("getPairingQRCode called. Current sdkState: \(self.sdkState.rawValue), central exists: \(self.central != nil)")
            guard let central, sdkState == .poweredOn else {
                let errorDetail = "SDK State: \(sdkState.rawValue), PGCentralManager valid: \(self.central != nil)"
                self.logger.error("Cannot generate pairing QR code: Bluetooth not ready. Details: \(errorDetail)")
                self.lastError = ScannerError(code: "bluetooth_not_ready", message: "Cannot pair: Bluetooth not ready.")
                self.updateInternalStatus()
                return nil
            }
        
            self.lastError = nil
            if !self.isScannerConnected { self.currentStatus = .idle }

            self.logger.info("Attempting to initiate scanner connection with QR code image.")
            let uiImage = central.initiateScannerConnection(withImageSize: CGSize(width: 200, height: 200))
        
            self.logger.info("QR code image obtained from SDK.")
            return Image(uiImage: uiImage)
        }

        /// Updates the display of a connected ProGlove scanner that supports screen features.
        /// - Parameter data: The `ScannerDisplayData` containing ProGlove-specific screen data (`.proGlove(PGScreenData)`).
        public func updateScannerDisplay(data: ScannerDisplayData) {
            self.logger.info("updateScannerDisplay called.")
            guard self.displayedScanner != nil, self.isScannerConnected, self.currentStatus == .ready || self.currentStatus == .scanning else {
                self.logger.warning("Cannot update display: No scanner connected or not in ready/scanning state. Current status: \(self.currentStatus.description)")
                return
            }
            switch data {
            case .proGlove(let screenData):
                let command = PGCommand(screenDataRequest: screenData)
                self.logger.info("Setting screen with templateId: \(screenData.templateId)")
                self.central?.displayManager?.setScreen(command, completionHandler: { error in
                    if let error {
                        self.logger.error("Failed to set screen: \(error.localizedDescription)")
                    } else {
                        self.logger.info("Screen update command sent successfully.")
                    }
                })
            default:
                self.logger.warning("Unsupported display data type for ProGloveScanner.")
            }
        }
    
        /// Resets the ProGlove scanner state.
        ///
        /// This involves stopping any current monitoring or connection and resetting internal states
        /// to allow for a fresh connection attempt. The `PGCentralManager` instance is kept alive.
        public func reset() {
            self.logger.info("Reset requested.")
            self.stopMonitoring()
        
            if self.sdkState == .poweredOn {
                self.currentStatus = .idle
            } else {
                self.updateInternalStatus()
            }
            self.logger.info("Reset finished. Current status: \(self.currentStatus.description)")
        }

        /// Checks if the ProGlove scanner functionality is available.
        ///
        /// Availability is determined by whether the SDK's `PGCentralManager` is initialized and the
        /// Bluetooth state is one that allows for operation (e.g., powered on, or even powered off if it can be turned on).
        /// It does not necessarily mean a scanner is currently connected.
        /// - Returns: `true` if ProGlove scanning can be attempted, `false` otherwise.
        public func isAvailable() -> Bool {
            let available = (sdkState == .poweredOn || self.sdkState == .poweredOff || self.sdkState == .unknown || self.sdkState == .resetting) && self.central != nil
            self.logger.info("isAvailable check: \(available). SDK State: \(self.sdkState.rawValue)")
            return available
        }

        // MARK: - PGCentralManagerDelegate Callbacks

        /// Called when the ProGlove SDK's manager state changes (e.g., Bluetooth powered on/off).
        public func managerDidUpdateState(_ manager: PGManager) {
            self.logger.info("PGCentralManager didUpdateState: \(manager.state.rawValue)")
            self.sdkState = manager.state
            if self.sdkState != .poweredOn {
                self.isScannerConnected = false
                if self.displayedScanner != nil {
                    self.displayedScanner?.delegate = nil
                    self.displayedScanner = nil
                    self.logger.info("Cleared displayedScanner due to SDK state change to not poweredOn.")
                }
                self.isReconnecting = false
            }
            self.lastError = nil
            self.updateInternalStatus()
        }

        /// Called when a ProGlove scanner has successfully connected and is ready for operations.
        public func centralManager(_ centralManager: PGCentralManager, scannerDidBecomeReady scanner: PGPeripheral) {
            self.logger.info("Scanner Ready: \(scanner.identifier)")
            self.displayedScanner = scanner
            scanner.delegate = self
            self.isScannerConnected = true
            self.isReconnecting = false
            self.lastError = nil
            self.updateInternalStatus()
        }

        /// Called when a connection attempt to a ProGlove scanner fails.
        public func centralManager(_ centralManager: PGCentralManager, didFailToConnectToScanner scanner: PGPeripheral, error: Error?) {
            let errorDescription = error?.localizedDescription ?? "Unknown error"
            self.logger.error("Failed to connect to scanner \(scanner.identifier): \(errorDescription)")
            if self.displayedScanner?.identifier == scanner.identifier {
                self.displayedScanner = nil
            }
            self.isScannerConnected = false
            self.isReconnecting = false
            self.lastError = ScannerError(code: "connection_failed", message: "Connection failed: \(errorDescription)")
            self.updateInternalStatus()
        }

        /// Called when a connected ProGlove scanner disconnects.
        public func centralManager(_ centralManager: PGCentralManager, didDisconnectFromScanner scanner: PGPeripheral, error: Error?) {
            let errorDescription = error?.localizedDescription ?? "Graceful disconnect"
            self.logger.info("Disconnected from scanner \(scanner.identifier): \(errorDescription)")
            if self.displayedScanner?.identifier == scanner.identifier {
                self.isScannerConnected = false
                scanner.delegate = nil
                self.displayedScanner = nil
            
                // Check if the disconnection was due to a timeout, which might imply a reconnect attempt
                if let nsError = error as NSError? {
                    self.logger.info("Connection lost (timeout), SDK might attempt reconnect for scanner \(scanner.identifier).")
                    self.isReconnecting = true
                    self.lastError = ScannerError(code: "reconnecting", message: "Connection lost, reconnecting...")
                } else if error != nil {
                    self.lastError = ScannerError(code: "disconnected_with_error", message: "Disconnected: \(errorDescription)")
                    self.isReconnecting = false
                } else {
                    self.lastError = nil
                    self.isReconnecting = false
                }
                self.updateInternalStatus()
            }
        }
    
        /// Called when the connection to a scanner is lost and the SDK is attempting to reconnect.
        public func centralManager(_ centralManager: PGCentralManager, didLostConnectionAndReconnectingToScanner scanner: PGPeripheral) {
            self.logger.info("Lost connection, SDK is attempting to reconnect to scanner \(scanner.identifier).")
            if self.displayedScanner?.identifier == scanner.identifier || self.displayedScanner == nil {
                self.isScannerConnected = false
                self.isReconnecting = true
                self.lastError = ScannerError(code: "reconnecting", message: "Connection lost, attempting to reconnect...")
                self.updateInternalStatus()
            }
        }
    
        /// Called when the SDK starts searching for a scanner based on an indicator (e.g., from a pairing QR code).
        public func centralManager(_ centralManager: PGCentralManager, didStartSearchingForIndicator indicator: String?) {
            self.logger.info("Started searching for indicator: \(indicator ?? "nil")")
            self.currentStatus = .idle
        }

        /// Called when the SDK is in the process of connecting to a specific scanner.
        public func centralManager(_ centralManager: PGCentralManager, connectingToScanner scanner: PGPeripheral) {
            self.logger.info("Connecting to scanner \(scanner.identifier)...")
            self.displayedScanner = scanner
        }

        /// Called when a scanner has physically connected (BLE connection established), but may not yet be ready for full operation.
        public func centralManager(_ centralManager: PGCentralManager, scannerDidConnect scanner: PGPeripheral) {
            self.logger.info("Scanner \(scanner.identifier) PHYSICALLY connected (BLE), waiting for services to become ready...")
        }

        /// Called if the SDK fails to initiate a connection (e.g., during the pairing QR code process).
        public func centralManager(_ centralManager: PGCentralManager, didFailToInitiateConnection error: Error?) {
            let errorDescription = error?.localizedDescription ?? "Unknown error"
            self.logger.error("Failed to initiate connection (e.g. pairing process): \(errorDescription)")
            self.lastError = ScannerError(code: "pairing_init_failed", message: "Pairing initiation failed: \(errorDescription)")
            self.updateInternalStatus()
        }

        // MARK: - PGPeripheralDelegate Callbacks

        /// Called when the connected ProGlove peripheral successfully scans a barcode.
        public func peripheral(_ peripheral: PGPeripheral, didScanBarcodeWith data: PGScannedBarcodeResult) {
            self.logger.info("Barcode received from \(peripheral.identifier): \(data.barcodeContent)")
            self.delegate?.barcodeScannerDidReceiveBarcode(data.barcodeContent, from: self)
        }
    
        // MARK: - Private Helper Methods

        /// Updates the `currentStatus` property based on the internal state of the scanner
        private func updateInternalStatus() {
            let oldStatus = self.currentStatus

            if let error = lastError {
                self.currentStatus = .error(error)
            } else if self.isReconnecting {
                if case .error(let currentError) = currentStatus, currentError.code == "reconnecting" {
                    // Already reflecting reconnecting state.
                } else {
                    self.currentStatus = .error(ScannerError(code: "reconnecting", message: "Reconnecting to scanner..."))
                }
            } else {
                switch self.sdkState {
                case .unsupported:
                    self.currentStatus = .error(ScannerError(code: "bluetooth_unsupported", message: "Bluetooth LE not supported on this device."))
                case .unauthorized:
                    self.currentStatus = .error(.permissionDenied)
                case .poweredOff:
                    self.currentStatus = .error(ScannerError(code: "bluetooth_off", message: "Bluetooth is powered off."))
                case .poweredOn:
                    self.currentStatus = self.isScannerConnected ? .ready : .idle
                case .resetting:
                    self.currentStatus = .idle
                case .unknown:
                    self.currentStatus = .idle
                @unknown default:
                    self.logger.warning("Unknown SDK State encountered: \(self.sdkState.rawValue)")
                    self.currentStatus = .idle
                }
            }
            if oldStatus.description != self.currentStatus.description {
                self.logger.info("Internal status updated. Old: \(oldStatus.description), New: \(self.currentStatus.description)")
            }
        }
    }

#else
    /// Fallback implementation for `ProGloveScanner` when the ConnectSDK is not available.
    ///
    /// This version provides a non-functional scanner that always reports an SDK availability error.
    @MainActor
    public final class ProGloveScanner: NSObject, BarcodeScanner {
        /// The type of this scanner, `.proGlove`.
        public let type: ScannerType = .proGlove
        /// The delegate, which will receive status updates.
        public weak var delegate: BarcodeScannerDelegate?
        /// The current status, always indicating the SDK is not available.
        public private(set) var currentStatus: ScannerStatus = .error(ScannerError(code: "sdk_not_available", message: "ProGlove SDK not available")) {
            didSet {
                // Though status is fixed, if it were changeable, this would notify delegate.
                self.delegate?.barcodeScannerDidUpdateStatus(self.currentStatus, for: self)
            }
        }
    
        /// Initializes the fallback ProGlove scanner.
        override public init() {
            super.init()
            // Consider notifying delegate of initial status if not handled by manager activating it.
            // self.delegate?.barcodeScannerDidUpdateStatus(self.currentStatus, for: self)
        }

        /// Does nothing as the SDK is not available. Reports current error status.
        public func startMonitoring() async throws { /* No specific action if SDK not available */ }
        /// Does nothing as the SDK is not available.
        public func stopMonitoring() { /* No specific action if SDK not available */ }
        /// Does nothing as the SDK is not available.
        public func triggerScan() async throws { /* Not applicable */ }
        /// Returns `nil` as QR code generation is not possible without the SDK. Reports current error status.
        public func getPairingQRCode() -> Image? { nil }
        /// Does nothing as the SDK is not available.
        public func updateScannerDisplay(data: ScannerDisplayData) { /* Not applicable */ }
        /// Does nothing as the SDK is not available. Reports current error status.
        public func reset() {}
        /// Always returns `false` as the SDK is not available.
        public func isAvailable() -> Bool { false }
    }
#endif
