import SwiftUI
import VisionKit

/// A SwiftUI view representable for displaying a VisionKit barcode scanner.
public struct VisionKitScannerRepresentable: UIViewControllerRepresentable {
    let scanner: VisionKitScanner

    /// Initializes the representable with a VisionKit scanner.
    /// - Parameter scanner: The `VisionKitScanner` instance to use for scanning.
    public init(scanner: VisionKitScanner) {
        self.scanner = scanner
    }

    /// Creates and configures the `DataScannerViewController` for display.
    /// - Parameter context: The context provided by SwiftUI.
    /// - Returns: The `DataScannerViewController` to display the camera feed.
    public func makeUIViewController(context: Context) -> DataScannerViewController {
        guard let vc = scanner.getScannerView() as? DataScannerViewController else {
            let dummyVC = DataScannerViewController(recognizedDataTypes: [], recognizesMultipleItems: false)
            dummyVC.view.backgroundColor = .red
            return dummyVC
        }
        return vc
    }

    /// Updates the `DataScannerViewController` when the SwiftUI view updates.
    /// - Parameters:
    ///   - uiViewController: The `DataScannerViewController` to update.
    ///   - context: The context provided by SwiftUI.
    public func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        if uiViewController.delegate == nil, self.scanner.visionScannerVC === uiViewController {
            uiViewController.delegate = self.scanner
        }
    }
    
    /// Cleans up the `DataScannerViewController` when the SwiftUI view is dismantled.
    /// - Parameters:
    ///   - uiViewController: The `DataScannerViewController` to clean up.
    ///   - coordinator: The coordinator (not used in this implementation).
    public static func dismantleUIViewController(_ uiViewController: DataScannerViewController, coordinator: ()) {
        if uiViewController.isScanning {
            uiViewController.stopScanning()
        }
        uiViewController.delegate = nil
    }
}
