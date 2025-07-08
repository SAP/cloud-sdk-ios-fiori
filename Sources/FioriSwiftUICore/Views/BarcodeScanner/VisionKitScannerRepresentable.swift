import OSLog
import SwiftUI
#if canImport(VisionKit) && os(iOS) && !targetEnvironment(macCatalyst)
    import VisionKit
#endif

/// A SwiftUI `UIViewControllerRepresentable` that wraps a `VisionKitScanner` to display a VisionKit barcode scanner.
///
/// `VisionKitScannerRepresentable` integrates with `BarcodeScannerManager` to present a `DataScannerViewController` for barcode scanning on iOS devices (excluding Mac Catalyst). It handles the scanner's lifecycle, including permission checks, torch state synchronization, and control button visibility (cancel and flash buttons). If the scanner is unavailable (e.g., on Mac Catalyst or due to permission issues), it displays a placeholder view with a "Scanner Unavailable" message.
///
/// - Note: This view requires `VisionKit` and is only functional on iOS (not Mac Catalyst or visionOS). The `scannerManager` must have an active `VisionKitScanner` instance, typically activated via `scannerManager.setActiveScanner(.visionKit)`.
///
/// ## Usage
///
/// Initialize with a `BarcodeScannerManager` instance, a binding for torch state, and a cancel callback:
/// ```swift
/// @State private var isTorchOn = false
/// @StateObject private var scannerManager = BarcodeScannerManager(
///     recognizedDataTypes: [.barcode(symbologies: [.qr, .ean13])],
///     recognizesMultipleItems: false
/// )
///
/// var body: some View {
///     VisionKitScannerRepresentable(
///         scannerManager: scannerManager,
///         isTorchOn: $isTorchOn,
///         onCancelTapped: {
///             scannerManager.stopMonitoring()
///         },
///         showCancelButton: true,
///         showFlashButton: true
///     )
///     .ignoresSafeArea()
/// }
/// ```
///
/// - Ensure `scannerManager` is configured with `BarcodeDataType` for barcode types.
/// - The `isTorchOn` binding syncs with the scanner's torch state.
/// - The `onCancelTapped` closure is called when the cancel button (if shown) is tapped.
///
/// ## Requirements
/// - iOS 15.0+.
/// - `Vision` framework for `VNBarcodeSymbology` if specifying barcode symbologies.
/// - `BarcodeScannerManager` and `VisionKitScanner`.
/// - Camera permissions must be granted for scanning to work.
public struct VisionKitScannerRepresentable: UIViewControllerRepresentable {
    private let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "cloud.sdk.ios.fiori.barcodescanner", category: "VisionKitScannerRepresentable")

    /// The `BarcodeScannerManager` instance managing the active `VisionKitScanner`.
    @ObservedObject public var scannerManager: BarcodeScannerManager
    /// A binding to control and reflect the scanner's torch state.
    @Binding public var isTorchOn: Bool
    /// A closure called when the cancel button (if shown) is tapped.
    public var onCancelTapped: () -> Void
    /// A Boolean indicating whether to show the cancel button in the scanner UI.
    public var showCancelButton: Bool
    /// A Boolean indicating whether to show the flash (torch) button in the scanner UI.
    public var showFlashButton: Bool

    /// Initializes the `VisionKitScannerRepresentable` with a `BarcodeScannerManager` and configuration.
    ///
    /// - Parameters:
    ///   - scannerManager: The `BarcodeScannerManager` instance managing the `VisionKitScanner`.
    ///   - isTorchOn: A binding to control and observe the torch state.
    ///   - onCancelTapped: A closure called when the cancel button is tapped.
    ///   - showCancelButton: Whether to display the cancel button. Defaults to `true`.
    ///   - showFlashButton: Whether to display the flash button (if torch is available). Defaults to `true`.
    public init(
        scannerManager: BarcodeScannerManager,
        isTorchOn: Binding<Bool>,
        onCancelTapped: @escaping () -> Void,
        showCancelButton: Bool = true,
        showFlashButton: Bool = true
    ) {
        self.scannerManager = scannerManager
        self._isTorchOn = isTorchOn
        self.onCancelTapped = onCancelTapped
        self.showCancelButton = showCancelButton
        self.showFlashButton = showFlashButton
        self.logger.info("Initialized VisionKitScannerRepresentable.")
    }

    /// The type of `UIViewController` managed by this representable.
    public typealias UIViewControllerType = UIViewController

    /// Creates the `UIViewController` for the scanner or a placeholder if unavailable.
    ///
    /// This method retrieves the `VisionKitScanner` from the `scannerManager`, checks permissions,
    /// and returns the scanner's `UIViewController` (typically a `DataScannerViewController`).
    /// If the scanner is unavailable (e.g., on Mac Catalyst or due to missing permissions),
    /// it returns a placeholder `UIViewController` with a "Scanner Unavailable" message.
    ///
    /// - Parameter context: The context provided by SwiftUI.
    /// - Returns: A `UIViewController` containing the scanner UI or a placeholder.
    public func makeUIViewController(context: Context) -> UIViewController {
        self.logger.info("makeUIViewController called.")
        
        // Ensure VisionKit scanner is active
        Task {
            let result = await scannerManager.getVisionKitScanner()?.checkPermissionsAndPrepareForPresentation(manager: self.scannerManager)
            if case .failure(let error) = result {
                self.logger.error("Failed to prepare VisionKit scanner: \(error.localizedDescription)")
            }
        }

        // Get the scanner view from VisionKitScanner
        guard let visionKitScanner = scannerManager.getVisionKitScanner(),
              let scannerView = visionKitScanner.getScannerView()
        else {
            self.logger.warning("VisionKit scanner or view unavailable. Returning placeholder UIViewController.")
            let placeholderVC = UIViewController()
            let label = UILabel()
            label.text = "Scanner Unavailable"
            label.textAlignment = .center
            label.textColor = .black
            placeholderVC.view.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                label.centerXAnchor.constraint(equalTo: placeholderVC.view.centerXAnchor),
                label.centerYAnchor.constraint(equalTo: placeholderVC.view.centerYAnchor)
            ])
            placeholderVC.view.backgroundColor = .white
            return placeholderVC
        }

        // Configure scanner properties
        visionKitScanner.showCancelButton = self.showCancelButton
        visionKitScanner.showFlashButton = self.showFlashButton
        visionKitScanner.onCancelTapped = self.onCancelTapped
        visionKitScanner.isTorchOn = self.isTorchOn

        self.logger.info("Returning VisionKit scanner view controller.")
        return scannerView
    }

    /// Updates the `UIViewController` with the latest configuration.
    ///
    /// This method syncs the scanner's properties (`showCancelButton`, `showFlashButton`, `onCancelTapped`, and `isTorchOn`)
    /// with the representable's state. If the scanner is not active or unavailable, it attempts to activate it.
    /// If the torch state changes, it calls `toggleTorch()` to update the hardware state and syncs the binding.
    ///
    /// - Parameters:
    ///   - uiViewController: The `UIViewController` to update.
    ///   - context: The context provided by SwiftUI.
    public func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        self.logger.info("updateUIViewController called. Torch state: \(self.isTorchOn), ShowCancel: \(self.showCancelButton), ShowFlash: \(self.showFlashButton)")

        guard let visionKitScanner = scannerManager.getVisionKitScanner() else {
            self.logger.warning("VisionKit scanner unavailable in updateUIViewController. No updates applied.")
            return
        }

        // Update scanner properties
        visionKitScanner.showCancelButton = self.showCancelButton
        visionKitScanner.showFlashButton = self.showFlashButton
        visionKitScanner.onCancelTapped = self.onCancelTapped

        // Sync torch state
        if visionKitScanner.isTorchAvailable, visionKitScanner.isTorchOn != self.isTorchOn {
            self.logger.info("Updating torch state to: \(self.isTorchOn)")
            if visionKitScanner.toggleTorch() {
                visionKitScanner.isTorchOn = self.isTorchOn
            } else {
                self.logger.warning("Failed to toggle torch. Reverting isTorchOn binding.")
                self.isTorchOn = visionKitScanner.isTorchOn
            }
        }

        // Ensure the scanner is in the correct state
        if self.scannerManager.activeScannerType != .visionKit {
            self.logger.info("VisionKit is not the active scanner. Attempting to activate.")
            Task {
                do {
                    try await self.scannerManager.setActiveScanner(.visionKit)
                } catch {
                    self.logger.error("Failed to activate VisionKit scanner: \(error.localizedDescription)")
                }
            }
        }
    }
}
