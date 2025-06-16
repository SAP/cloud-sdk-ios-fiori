/// A core module defining shared types, protocols, and enums for the barcode scanning framework.
///  - Important: Ensure that the appropriate SDKs (ConnectSDK for ProGlove, RapidScanCompanion for IPCMobile) are imported and available in your project when using those scanner types.
import SwiftUI
import VisionKit
#if canImport(ConnectSDK)
    import ConnectSDK
#endif
#if canImport(RapidScanCompanion)
    import RapidScanCompanion
#endif

/// Represents the various states a barcode scanner can be in.
public enum ScannerStatus: Equatable {
    /// The scanner is not active or has been reset. This is the initial state or the state after `stopMonitoring()` or `reset()`.
    case idle
    /// The scanner is initialized, connected (if applicable for hardware scanners), and ready to start scanning or be triggered.
    /// For VisionKit, this means camera permissions are granted and the scanner is ready to be presented.
    /// For hardware scanners, this typically means a connection is established.
    case ready
    /// The scanner is actively trying to detect and decode barcodes.
    /// For VisionKit, the camera view is active and processing frames.
    /// For hardware scanners, they are typically listening for trigger events or actively emitting scan beams.
    case scanning
    /// An error has occurred. The associated `ScannerError` provides more details about the nature of the failure.
    case error(ScannerError)

    /// A readable description of the status.
    public var description: String {
        switch self {
        case .idle:
            return "Idle"
        case .ready:
            return "Ready"
        case .scanning:
            return "Scanning"
        case .error(let error):
            return "Error: \(error.localizedDescription)"
        }
    }
}

/// Represents errors that can occur during scanner operations.
public struct ScannerError: Error, Equatable {
    /// A unique code identifying the type of error (e.g., "permission_denied", "bluetooth_off").
    public let code: String
    /// A readable message describing the error and potentially offering troubleshooting advice.
    public let message: String

    /// Initializes a new scanner error.
    /// - Parameters:
    ///   - code: The unique error code.
    ///   - message: The descriptive error message.
    public init(code: String, message: String) {
        self.code = code
        self.message = message
    }

    /// A localized description of the error, formatted as "[code] message".
    public var localizedDescription: String { "[\(self.code)] \(self.message)" }

    // Common predefined scanner errors.
    /// Error indicating the scanner is not available on the current device or under current conditions (e.g., SDK not imported, hardware not present).
    public static let notAvailable = ScannerError(code: "not_available", message: "Scanner not available")
    /// Error indicating that necessary permissions (e.g., camera for VisionKit, Bluetooth for hardware scanners) were denied by the user or are restricted by system policy.
    public static let permissionDenied = ScannerError(code: "permission_denied", message: "Permission denied")
    /// Error indicating that the scanner failed to initialize, possibly due to an SDK issue or hardware malfunction.
    public static let initializationFailed = ScannerError(code: "init_failed", message: "Failed to initialize scanner")
    /// Error indicating the operation is not supported on the current device.
    public static let notSupported = ScannerError(code: "not_supported", message: "Operation not supported")
}

/// Enumerates the types of barcode scanners supported.
public enum ScannerType: Equatable, CaseIterable {
    /// Uses the built-in iOS camera via Apple's VisionKit framework for scanning barcodes and QR codes.
    case visionKit
    /// Represents a ProGlove wearable hardware scanner, connected via Bluetooth.
    case proGlove
    /// Represents an IPCMobile HaloRing hardware scanner, connected via Bluetooth.
    case ipcMobile
    
    /// A readable description of the scanner type, suitable for display in UI.
    public var description: String {
        switch self {
        case .visionKit:
            return "Camera (VisionKit)"
        case .proGlove:
            return "ProGlove"
        case .ipcMobile:
            return "IPCMobile (RapidScan)"
        }
    }
}

/// Configuration structure for displaying a "card" or message on an IPCMobile scanner's screen.
public struct IPCMobileDisplayCardConfig: Equatable {
    /// The primary message text to be displayed on the card. Defaults to "Message" if an empty string is provided.
    public let message: String
    /// The width of the display card in device-specific units. Must be greater than 0. Default is 1.
    public let width: Int
    /// The height of the display card in device-specific units. Must be greater than 0. Default is 1.
    public let height: Int
    /// The background color of the card, specified as a hex string (e.g., "#004F94" for blue, "#FFFFFF" for white).
    /// Defaults to "#004F94" if an empty string is provided.
    public let backgroundColor: String
    /// The font size for the message text. Must be greater than 0. Default is 1.
    public let fontSize: Int
    /// The font color for the message text, specified as a hex string (e.g., "#FFFFFF" for white, "#000000" for black).
    /// Default is "#FFFFFF" if an empty string is provided.
    public let fontColor: String
    /// A Boolean value indicating whether the message text should be rendered in a bold font style.
    public let isBold: Bool
    /// A Boolean value indicating whether the message text should be underlined.
    public let isUnderline: Bool
    /// The Y-axis position (vertical offset) for the text on the card. Must be 0 or greater. Default is 0.
    public let textYPosition: Int
    /// A Boolean value indicating whether the device should play a "good scan" sound when this card is displayed.
    public let playGoodSound: Bool

    /// Initializes a new display card configuration for an IPCMobile device.
    ///
    /// Provides default values for empty or invalid inputs to ensure basic usability.
    /// - Parameters:
    ///   - message: The text message.
    ///   - width: Card width.
    ///   - height: Card height.
    ///   - backgroundColor: Background color hex string.
    ///   - fontSize: Font size.
    ///   - fontColor: Font color hex string.
    ///   - isBold: Text bold state.
    ///   - isUnderline: Text underline state.
    ///   - textYPosition: Vertical position of the text.
    ///   - playGoodSound: Whether to play a success sound.
    public init(message: String, width: Int, height: Int, backgroundColor: String, fontSize: Int, fontColor: String, isBold: Bool, isUnderline: Bool, textYPosition: Int, playGoodSound: Bool) {
        self.message = message.isEmpty ? "Message" : message
        self.width = max(1, width)
        self.height = max(1, height)
        self.backgroundColor = backgroundColor.isEmpty ? "#004F94" : backgroundColor // Default blue
        self.fontSize = max(1, fontSize)
        self.fontColor = fontColor.isEmpty ? "#FFFFFF" : fontColor // Default white
        self.isBold = isBold
        self.isUnderline = isUnderline
        self.textYPosition = max(0, textYPosition)
        self.playGoodSound = playGoodSound
    }
}

/// Represents data to be displayed on a scanner's screen, if supported.
public enum ScannerDisplayData {
    #if canImport(ConnectSDK)
        /// Data for a ProGlove scanner's display, using the `PGScreenData` type from ConnectSDK.
        case proGlove(PGScreenData)
    #endif
    #if canImport(RapidScanCompanion)
        /// Data for an IPCMobile scanner's display, consisting of an array of `IPCMobileDisplayCardConfig` objects.
        case ipcMobile(cards: [IPCMobileDisplayCardConfig])
    #endif
}

/// A delegate protocol for receiving updates from a `BarcodeScanner` instance.
@MainActor
public protocol BarcodeScannerDelegate: AnyObject {
    /// Called when the status of the barcode scanner changes.
    /// - Parameters:
    ///   - status: The new `ScannerStatus`.
    ///   - sender: The `BarcodeScanner` instance that reported the status change.
    func barcodeScannerDidUpdateStatus(_ status: ScannerStatus, for sender: any BarcodeScanner)
    
    /// Called when a barcode is successfully scanned and decoded.
    /// - Parameters:
    ///   - barcode: The string representation of the scanned barcode data.
    ///   - sender: The `BarcodeScanner` instance that scanned the barcode.
    func barcodeScannerDidReceiveBarcode(_ barcode: String, from sender: any BarcodeScanner)
}

/// Defines the common interface for all barcode scanner implementations within the framework.
///
/// This protocol ensures that different types of scanners (e.g., camera-based, Bluetooth hardware)
/// can be managed and interacted with in a consistent manner by the `BarcodeScannerManager`.
/// All methods are expected to be called or operate on the main actor.
@MainActor
public protocol BarcodeScanner: AnyObject {
    /// The specific type of the scanner (e.g., `.visionKit`, `.proGlove`).
    var type: ScannerType { get }
    /// The current operational status of the scanner.
    var currentStatus: ScannerStatus { get }
    /// The delegate object that receives callbacks for status changes and scanned barcodes.
    var delegate: (any BarcodeScannerDelegate)? { get set }

    /// Prepares the scanner for operation.
    /// For camera scanner, this might involve checking permissions and initializing the camera session.
    /// For hardware scanner, this might involve powering on Bluetooth or connecting to a previously paired device.
    /// This method should bring the scanner to a `.ready` state if successful.
    /// - Throws: A `ScannerError` if monitoring cannot be started (e.g., permissions denied, Bluetooth off).
    func startMonitoring() async throws
    
    /// Stops the scanner's operation.
    /// For camera scanner, this releases the camera.
    /// For hardware scanner, this may disconnect the device or put it into a low-power state.
    /// The scanner should ideally transition to an `.idle` or appropriate error state.
    func stopMonitoring()
    
    /// Initiates a scan attempt.
    /// For camera scanner using VisionKit, this typically means starting the `DataScannerViewController`'s scan.
    /// For hardware scanner that requires a software trigger (if any), this would send the trigger command.
    /// For hardware scanner that is trigger-based (e.g., ProGlove button press), this method might do nothing or throw `not_supported`.
    /// - Throws: A `ScannerError` if the scan cannot be triggered (e.g., not ready, not supported).
    func triggerScan() async throws
    
    /// Resets the scanner to its initial or a clean state.
    /// This may involve disconnecting from a hardware scanner, clearing any cached data or error states,
    /// and preparing it for a completely new session (including pairing, if applicable).
    func reset()
    
    /// For scanners requiring pairing (e.g., ProGlove, IPCMobile), this method generates a pairing QR code.
    /// The application can then display this `Image` for the user to scan with the hardware scanner.
    /// - Returns: A SwiftUI `Image` containing the pairing QR code, or `nil` if not applicable or if generation fails.
    ///            If `nil` is returned due to an error, the scanner should update its `currentStatus`.
    func getPairingQRCode() -> Image?
    
    /// Sends data to be displayed on the scanner's screen, if the hardware supports it (e.g., ProGlove display, IPCMobile display).
    /// - Parameter data: A `ScannerDisplayData` enum case containing the specific data for the active scanner type.
    func updateScannerDisplay(data: ScannerDisplayData)
    
    /// Indicates whether the scanner type is available and generally usable on the current device.
    /// This might check for SDK availability, required hardware (like Bluetooth), or basic permissions if known synchronously.
    /// It doesn't necessarily mean a specific device is connected and ready, but rather that the *type* of scanner can function.
    /// - Returns: `true` if the scanner type is available, `false` otherwise.
    func isAvailable() -> Bool
    
    /// For scanners that provide their own UI (primarily VisionKit's `DataScannerViewController`), this method returns the view controller.
    /// The application can then present this view controller to show the camera feed for scanning.
    /// - Returns: A `UIViewController` instance for the scanner's UI, or `nil` if the scanner does not provide one.
    func getScannerView() -> UIViewController?
}

/// Provides default implementations for optional `BarcodeScanner` protocol methods.
/// This allows concrete scanner types to implement only the methods relevant to them.
public extension BarcodeScanner {
    /// Default implementation for `triggerScan`. Many hardware scanners are self-triggered.
    /// Does nothing by default. Can be overridden by scanners that support software triggering.
    func triggerScan() async throws {
        // Default: Do nothing or throw ScannerError(code: "not_supported", message: "Software trigger not supported by this scanner.")
    }
    
    /// Default implementation for `updateScannerDisplay`. Not all scanners have displays.
    /// Does nothing by default.
    func updateScannerDisplay(data: ScannerDisplayData) {
        // Default: Do nothing.
    }
    
    /// Default implementation for `getPairingQRCode`. Only relevant for pairable hardware scanners.
    /// Returns `nil` by default.
    func getPairingQRCode() -> Image? {
        nil
    }
    
    /// Default implementation for `getScannerView`. Only VisionKit provides a view controller.
    /// Returns `nil` by default.
    func getScannerView() -> UIViewController? {
        nil
    }
}
