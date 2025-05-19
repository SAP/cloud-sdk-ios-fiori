import os.log
import SwiftUI
import VisionKit

/// A SwiftUI view representable for displaying a VisionKit barcode scanner.
public struct VisionKitScannerRepresentable: UIViewControllerRepresentable {
    let scanner: VisionKitScanner
    private static let logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "com.unknown", category: "VisionKitScannerRepresentable")

    /// Initializes the representable with a VisionKit scanner.
    /// - Parameter scanner: The `VisionKitScanner` instance to use for scanning.
    public init(scanner: VisionKitScanner) {
        self.scanner = scanner
        Self.logger.info("Initialized with scanner.")
    }

    /// Creates and configures the `DataScannerViewController` for display.
    /// - Parameter context: The context provided by SwiftUI.
    /// - Returns: The `DataScannerViewController` to display the camera feed.
    public func makeUIViewController(context: Context) -> DataScannerViewController {
        Self.logger.info("makeUIViewController called.")
        guard let vc = scanner.getScannerView() as? DataScannerViewController else {
            Self.logger.fault("Failed to get DataScannerViewController from scanner.getScannerView(). This should not happen if presented correctly.")
            let dummyVC = DataScannerViewController(recognizedDataTypes: [], recognizesMultipleItems: false)
            dummyVC.view.backgroundColor = .red
            return dummyVC
        }
        Self.logger.info("DataScannerViewController obtained for makeUIViewController.")
        return vc
    }

    /// Updates the `DataScannerViewController` when the SwiftUI view updates.
    /// - Parameters:
    ///   - uiViewController: The `DataScannerViewController` to update.
    ///   - context: The context provided by SwiftUI.
    public func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        if uiViewController.delegate == nil, self.scanner.visionScannerVC === uiViewController {
            Self.logger.warning("updateUIViewController: Delegate was nil, re-assigning.")
            uiViewController.delegate = self.scanner
        }
    }
    
    /// Cleans up the `DataScannerViewController` when the SwiftUI view is dismantled.
    /// - Parameters:
    ///   - uiViewController: The `DataScannerViewController` to clean up.
    ///   - coordinator: The coordinator (not used in this implementation).
    public static func dismantleUIViewController(_ uiViewController: DataScannerViewController, coordinator: ()) {
        self.logger.info("dismantleUIViewController called. Stopping scan if active.")
        if uiViewController.isScanning {
            uiViewController.stopScanning()
        }
        uiViewController.delegate = nil
    }
}
