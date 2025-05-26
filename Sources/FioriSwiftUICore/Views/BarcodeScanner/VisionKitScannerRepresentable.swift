import SwiftUI
import VisionKit

/// A SwiftUI view representable for displaying a VisionKit barcode scanner.
public struct VisionKitScannerRepresentable: UIViewControllerRepresentable {
    let scanner: VisionKitScanner
    let onCancelTapped: () -> Void
    @Binding var isTorchOn: Bool

    /// Initializes the representable with a VisionKit scanner.
    /// - Parameters:
    ///   - scanner: The `VisionKitScanner` instance to use for scanning.
    ///   - onCancelTapped: Closure called when the Cancel button is tapped.
    ///   - isTorchOn: Binding to track the torch state.
    public init(scanner: VisionKitScanner, onCancelTapped: @escaping () -> Void, isTorchOn: Binding<Bool>) {
        self.scanner = scanner
        self.onCancelTapped = onCancelTapped
        self._isTorchOn = isTorchOn
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
        
        // Add SwiftUI buttons as an overlay
        let buttonsView = self.scanner.makeControlButtonsView(isTorchOn: self.$isTorchOn, onCancelTapped: self.onCancelTapped)
        let hostingController = UIHostingController(rootView: buttonsView)
        hostingController.view.backgroundColor = .clear
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        vc.addChild(hostingController)
        vc.view.addSubview(hostingController.view)
        hostingController.didMove(toParent: vc)
        
        // Constrain the hosted view to fill the dataScanner's view
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: vc.view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: vc.view.bottomAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: vc.view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: vc.view.trailingAnchor)
        ])
        
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
        
        if self.isTorchOn != self.scanner.isTorchOn {
            _ = self.scanner.toggleTorch()
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
