import CoreBluetooth
import os.log
import SwiftUI
#if canImport(RapidScanCompanion)
    import RapidScanCompanion

    /// A barcode scanner implementation for IPCMobile (RapidScan) hardware scanners using the RapidScanCompanion SDK.
    ///
    /// This class manages the connection via Bluetooth LE advertising (for pairing) and direct communication
    /// with connected IPCMobile HaloRing devices. It conforms to the `BarcodeScanner` protocol.
    @MainActor
    public final class IPCMobileScanner: NSObject, BarcodeScanner {
        /// The type of this scanner, `.ipcMobile`.
        public let type: ScannerType = .ipcMobile
        /// The delegate responsible for receiving status updates and scanned barcode data.
        public weak var delegate: (any BarcodeScannerDelegate)?
        /// The current status of the IPCMobile scanner.
        public private(set) var currentStatus: ScannerStatus = .idle {
            didSet {
                if oldValue != self.currentStatus {
                    Self.logger.info("Status changed from \(oldValue.description) to \(self.currentStatus.description)")
                    self.delegate?.barcodeScannerDidUpdateStatus(self.currentStatus, for: self)
                }
            }
        }

        /// Logger for this class.
        private static let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "cloud.sdk.ios.fiori.barcodescanner", category: "IPCMobileScanner")

        /// The RapidScanCompanion SDK's main interaction object.
        private var companion: RSCompanion?
        /// Manages the list of connected Halo device UUIDs.
        private let haloManager = HaloManager()
        /// A Boolean value indicating whether the `RSCompanion` delegate has reported a "ready" state.
        private var isCompanionReadyForAdvertising: Bool = false
        /// The Bluetooth service UUID used for advertising, if a custom one is specified.
        private let serviceUUID: String?
        /// A Boolean value indicating if there's at least one Halo scanner connected.
        private var hasConnectedHalos: Bool = false

        /// Initializes a new `IPCMobileScanner` instance.
        /// - Parameter serviceUUID: An optional custom Bluetooth service UUID string for the `RSCompanion` to advertise with.
        ///                          If `nil`, the SDK's default service UUID will be used.
        public init(serviceUUID: String? = nil) {
            self.serviceUUID = serviceUUID
            super.init()
            Self.logger.info("Initializing IPCMobileScanner. Custom Service UUID: \(serviceUUID ?? "Default")")
            self.setupCompanion()
        }

        /// Starts monitoring and advertising for IPCMobile Halo scanner connections.
        ///
        /// This method instructs the `RSCompanion` to start Bluetooth LE advertising, making the app discoverable
        /// by Halo scanners for pairing. It updates the internal status accordingly.
        /// - Throws: A `ScannerError` if the `RSCompanion` instance is not available.
        public func startMonitoring() async throws {
            Self.logger.info("Start Monitoring called.")
            guard let companion else {
                Self.logger.error("RSCompanion not initialized. Cannot start monitoring.")
                let error = ScannerError.notAvailable
                self.currentStatus = .error(error)
                throw error
            }
            Self.logger.info("Starting advertising.")
            companion.startAdvertising()
            await self.updateInternalStatus()
        }

        /// Stops monitoring and advertising for IPCMobile Halo scanners.
        ///
        /// Also calls `reset()` to clear connected devices and internal states.
        public func stopMonitoring() {
            Self.logger.info("Stop Monitoring called.")
            self.companion?.stopAdvertising()
            self.reset()
        }

        /// Resets the IPCMobile scanner state.
        ///
        /// This disconnects all Halo devices, stops advertising, and clears internal connection states.
        /// The status is updated to reflect the reset state (typically `.idle`).
        public func reset() {
            Self.logger.info("Reset called.")
            Task {
                await self.haloManager.removeAll()
                self.hasConnectedHalos = false
                self.isCompanionReadyForAdvertising = false
                self.companion?.stopAdvertising()
                Self.logger.info("All HaloRings removed and advertising stopped.")
                await self.updateInternalStatus()
            }
        }

        /// Generates a pairing QR code image for connecting an IPCMobile Halo scanner.
        ///
        /// Uses the `RSCompanion` SDK to generate the QR code. Starts advertising if not already active.
        /// - Returns: A SwiftUI `Image` containing the pairing QR code, or `nil` if generation fails.
        ///            If `nil` is returned, `currentStatus` will be updated to an error state.
        public func getPairingQRCode() -> Image? {
            Self.logger.info("getPairingQRCode called.")
            guard let companion, let uiImage = companion.generatePairingQRCodeImage() else {
                Self.logger.error("Failed to generate pairing QR code. RSCompanion available: \(self.companion != nil).")
                let error = ScannerError(code: "qr_failed", message: "Failed to generate QR code for IPCMobile.")
                self.currentStatus = .error(error)
                return nil
            }
            Self.logger.info("Pairing QR code generated. Ensuring advertising is active.")
            companion.startAdvertising()
        
            // Update status after starting advertising, typically to .idle if no devices connected.
            Task {
                await self.updateInternalStatus()
            }
            return Image(uiImage: uiImage)
        }

        /// Updates the display of connected IPCMobile Halo scanners that support screen features.
        /// - Parameter data: The `ScannerDisplayData` containing IPCMobile-specific screen data (`.ipcMobile(cards: [IPCMobileDisplayCardConfig])`).
        public func updateScannerDisplay(data: ScannerDisplayData) {
            Self.logger.info("updateScannerDisplay called.")
            Task {
                let halos = await haloManager.all()
                guard self.isCompanionReadyForAdvertising, self.hasConnectedHalos, !halos.isEmpty else {
                    Self.logger.warning("Cannot update display: No connected RapidScan scanner or companion not ready. CompanionReady: \(self.isCompanionReadyForAdvertising), HasHalos: \(self.hasConnectedHalos), Halos empty: \(halos.isEmpty)")
                    return
                }
                switch data {
                case .ipcMobile(let cardConfigs):
                    Self.logger.info("Processing \(cardConfigs.count) display card configurations.")
                    let rislCards = cardConfigs.compactMap { config -> RSRislCard? in
                        guard config.width > 0, config.height > 0, !config.message.isEmpty else {
                            Self.logger.warning("Invalid card configuration skipped: \(config.message) (width/height must be >0, message not empty)")
                            return nil
                        }
                        let card = RSRislCard(width: config.width, height: config.height)
                        card.setBackgroundColor(config.backgroundColor)
                        card.setFont(
                            size: config.fontSize,
                            color: config.fontColor,
                            bold: config.isBold,
                            underline: config.isUnderline
                        )
                        card.textCenter(y: config.textYPosition, text: config.message)
                        if config.playGoodSound {
                            card.playGoodSound()
                        }
                        card.showCard()
                        return card
                    }
                    if !rislCards.isEmpty {
                        Self.logger.info("Sending \(rislCards.count) RislCards to \(halos.count) halos.")
                        self.companion?.sendRislCards(rislCards, toHalos: halos)
                    } else {
                        Self.logger.info("No valid RislCards to send.")
                    }
                default:
                    Self.logger.warning("Unsupported display data type for IPCMobileScanner.")
                }
            }
        }

        /// Checks if the IPCMobile scanner functionality is available.
        ///
        /// Availability is determined by the `RSCompanion` being initialized, the companion reporting a ready state,
        /// and at least one Halo scanner being connected.
        /// - Returns: `true` if an IPCMobile scanner is connected and ready for use, `false` otherwise.
        public func isAvailable() -> Bool {
            // For IPCMobile, "available" often means a HaloRing is connected and the companion is ready.
            let available = self.companion != nil && self.isCompanionReadyForAdvertising && self.hasConnectedHalos && self.currentStatus == .ready
            Self.logger.info("isAvailable check: \(available). Companion: \(self.companion != nil), CompanionReady: \(self.isCompanionReadyForAdvertising), HasHalos: \(self.hasConnectedHalos), Status: \(self.currentStatus.description)")
            return available
        }

        /// Sets up the `RSCompanion` instance and its delegate.
        private func setupCompanion() {
            Self.logger.info("Setting up RSCompanion.")
            if let uuidString = serviceUUID, !uuidString.isEmpty {
                self.companion = RSCompanion(serviceUUID: CBUUID(string: uuidString))
                Self.logger.info("RSCompanion initialized with custom service UUID: \(uuidString)")
            } else {
                self.companion = RSCompanion()
                Self.logger.info("RSCompanion initialized with default service UUID.")
            }
            self.companion?.delegate = self
            Task {
                await self.updateInternalStatus()
            }
        }

        /// Updates the `currentStatus` property based on the internal state of the scanner
        /// (e.g., `RSCompanion` state, connected Halos).
        private func updateInternalStatus() async {
            let oldStatus = self.currentStatus
            let isHaloListEmpty = await haloManager.isEmpty()

            if self.companion == nil {
                self.currentStatus = .error(.notAvailable)
            } else if !self.isCompanionReadyForAdvertising || isHaloListEmpty {
                self.currentStatus = .idle
            } else {
                self.currentStatus = .ready
            }
        
            if oldStatus.description != self.currentStatus.description { // Log if description changed
                Self.logger.info("Internal status updated. Old: \(oldStatus.description), New: \(self.currentStatus.description)")
            }
        }
    }

    /// Delegate methods for `RSCompanion` interactions.
    extension IPCMobileScanner: RSCompanionDelegate {
        /// Called when the `RSCompanion`'s state changes.
        public func rsCompanionState(_ state: RSCompanionState, uuid: String) {
            Self.logger.info("RSCompanionState changed: \(state.rawValue), for UUID: \(uuid)")
            Task {
                switch state {
                case .ready:
                    // SDK is ready to start advertising (e.g. Bluetooth is on)
                    self.isCompanionReadyForAdvertising = true
                    Self.logger.info("RSCompanion is ready. Starting advertising.")
                    self.companion?.startAdvertising()
                case .connected:
                    Self.logger.info("Halo device connected: \(uuid)")
                    await self.haloManager.add(uuid)
                    self.hasConnectedHalos = true
                case .disconnected:
                    Self.logger.info("Halo device disconnected: \(uuid)")
                    await self.haloManager.remove(uuid)
                    let isHaloListEmpty = await self.haloManager.isEmpty()
                    self.hasConnectedHalos = !isHaloListEmpty
                    if isHaloListEmpty {
                        Self.logger.info("All Halos disconnected.")
                    }
                case .advertising:
                    Self.logger.info("RSCompanion is advertising.")
                    self.isCompanionReadyForAdvertising = true
                default:
                    Self.logger.warning("RSCompanion entered unhandled state: \(state.rawValue)")
                    self.isCompanionReadyForAdvertising = false
                }
                await self.updateInternalStatus()
            }
        }

        /// Called when a barcode is received from a connected Halo device.
        public func rsCompanionDidReceiveBarcode(_ barcode: String, symbology: String, serial: String, verb: String, uuid: String) {
            let scanResult = barcode
            Self.logger.info("Barcode received from Halo \(uuid): \(scanResult)")
            self.delegate?.barcodeScannerDidReceiveBarcode(scanResult, from: self)
        }

        /// Called when an image is received from a connected Halo device (if applicable).
        public func rsCompanionDidReceiveImage(_ image: UIImage) {
            Self.logger.info("Image received from Halo device.")
            // Handle image data if your application uses this feature.
        }

        // Other RSCompanionDelegate methods (button presses, verb selection) can be implemented if needed.
        // Provide stubs or basic logging for unused mandatory methods.

        /// Called when a button press is received from a Halo device.
        public func rsCompanionDidReceiveButtonPress(_ button: RSButton, serial: String, uuid: String) {
            Self.logger.info("Button press: \(button.description) received from Halo \(uuid).")
        }

        /// Called when a RISL (RapidScan Interactive Scripting Language) button press is received.
        public func rsCompanionDidReceiveRislButtonPress(_ button: String, serial: String, uuid: String) {
            Self.logger.info("RISL button press: '\(button)' received from Halo \(uuid).")
        }

        /// Called when a verb selection is received from a Halo device.
        public func rsCompanionDidReceiveVerbSelection(_ verb: String, serial: String, uuid: String) {
            Self.logger.info("Verb selection: '\(verb)' received from Halo \(uuid).")
        }
    }

    /// An actor to manage a list of connected Halo device UUIDs in a thread-safe manner.
    actor HaloManager {
        private var halos: [String] = []

        /// Adds a Halo UUID to the list if not already present.
        /// - Parameter uuid: The UUID string of the Halo device to add.
        func add(_ uuid: String) {
            if !self.halos.contains(uuid) {
                self.halos.append(uuid)
            }
        }

        /// Removes a Halo UUID from the list.
        /// - Parameter uuid: The UUID string of the Halo device to remove.
        func remove(_ uuid: String) {
            self.halos.removeAll { $0 == uuid }
        }
    
        /// Removes all Halo UUIDs from the list.
        func removeAll() {
            self.halos.removeAll()
        }

        /// Returns an array of all currently connected Halo UUIDs.
        /// - Returns: An array of UUID strings.
        func all() -> [String] {
            self.halos
        }

        /// Checks if the list of connected Halo UUIDs is empty.
        /// - Returns: `true` if no Halos are connected, `false` otherwise.
        func isEmpty() -> Bool {
            self.halos.isEmpty
        }
    }

#else
    /// Fallback implementation for `IPCMobileScanner` when the RapidScanCompanion SDK is not available.
    ///
    /// This version provides a non-functional scanner that always reports an SDK availability error.
    @MainActor
    public final class IPCMobileScanner: NSObject, BarcodeScanner {
        /// The type of this scanner, `.ipcMobile`.
        public let type: ScannerType = .ipcMobile
        /// The delegate, which will receive status updates.
        public weak var delegate: (any BarcodeScannerDelegate)?
        /// The current status, always indicating the SDK is not available.
        public private(set) var currentStatus: ScannerStatus = .error(ScannerError(code: "sdk_not_available", message: "RapidScanCompanion SDK not available")) {
            didSet {
                // Though status is fixed, if it were changeable, this would notify delegate.
                self.delegate?.barcodeScannerDidUpdateStatus(self.currentStatus, for: self)
            }
        }

        /// Initializes the fallback IPCMobile scanner.
        public init(serviceUUID: String? = nil) { // Added serviceUUID to match protocol if necessary, though unused here
            super.init()
            // Consider notifying delegate of initial status if not handled by manager activating it.
            // self.delegate?.barcodeScannerDidUpdateStatus(self.currentStatus, for: self)
        }

        /// Does nothing as the SDK is not available. Reports current error status.
        public func startMonitoring() async throws { /* No specific action if SDK not available */ }
        /// Does nothing as the SDK is not available.
        public func stopMonitoring() {}
        /// Does nothing as the SDK is not available.
        public func triggerScan() async throws { /* Not applicable */ }
        /// Does nothing as the SDK is not available.
        public func reset() {}
        /// Returns `nil` as QR code generation is not possible without the SDK. Reports current error status.
        public func getPairingQRCode() -> Image? { nil }
        /// Does nothing as the SDK is not available.
        public func updateScannerDisplay(data: ScannerDisplayData) { /* Not applicable */ }
        /// Always returns `false` as the SDK is not available.
        public func isAvailable() -> Bool { false }
    }
#endif
