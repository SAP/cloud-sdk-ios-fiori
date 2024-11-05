import PDFKit
import SwiftUI
import VisionKit

/// Define the possible output formats for the scanned document
public enum ScanOutputFormat {
    case images
    case pdf
}

/// Define the possible output types: either an array of images or a PDF document
public enum ScanOutput {
    case images([UIImage])
    case pdf(PDFDocument)
}

/// A SwiftUI view that presents the VisionKit document scanner
/// Note that VisionKit doesn't currently provide a public API to customize the scan view's appearance or behavior.
public struct DocumentScannerView: UIViewControllerRepresentable {
    /// A type alias for a completion handler that takes a Result object containing either a ScanOutput or an Error as its argument
    public typealias ScanCompletion = (Result<ScanOutput, Error>) -> Void
    /// Callback to be executed when the scan is complete, with a Result object indicating success or failure
    public var onCompletion: ScanCompletion
    /// Desired output format for the scanned document
    public var outputFormat: ScanOutputFormat
    
    /// Initialize the view with the completion callback and output format
    public init(onCompletion: @escaping ScanCompletion, outputFormat: ScanOutputFormat) {
        self.onCompletion = onCompletion
        self.outputFormat = outputFormat
    }
    
    /// Create a VNDocumentCameraViewController and set its delegate
    public func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let vc = VNDocumentCameraViewController()
        vc.delegate = context.coordinator
        return vc
    }
    
    /// No need to update the UIViewController after it's created
    public func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {}
    
    /// Create a coordinator object to handle the delegate methods of the VNDocumentCameraViewController
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    /// Check if the device supports the document scanner
    public static var isSupported: Bool {
        VNDocumentCameraViewController.isSupported
    }
}

/// Coordinator class to handle the delegate methods of the VNDocumentCameraViewController
public extension DocumentScannerView {
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        var parent: DocumentScannerView
        
        init(_ parent: DocumentScannerView) {
            self.parent = parent
        }
        
        /// Handle the completion of the scan
        public func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            let images = (0 ..< scan.pageCount).compactMap { scan.imageOfPage(at: $0) }
            
            /// Process the images based on the desired output format
            switch self.parent.outputFormat {
            case .images:
                self.parent.onCompletion(.success(.images(images)))
            case .pdf:
                createPDF(from: images) { result in
                    switch result {
                    case .success(let pdfDocument):
                        self.parent.onCompletion(.success(.pdf(pdfDocument)))
                    case .failure(let error):
                        self.parent.onCompletion(.failure(error))
                    }
                }
            }
            /// Dismiss the document camera view controller
            controller.dismiss(animated: true)
        }
        
        /// Handle the cancellation of the scan
        public func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            self.parent.onCompletion(.failure(NSError(domain: "DocumentScannerView", code: 1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("User cancelled the scan", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")])))
            controller.dismiss(animated: true)
        }
        
        /// Handle errors during the scan process
        public func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            self.parent.onCompletion(.failure(error))
            controller.dismiss(animated: true)
        }
    }
}

/// Create a PDF document from an array of images
extension DocumentScannerView.Coordinator {
    private func createPDF(from images: [UIImage], completion: @escaping (Result<PDFDocument, Error>) -> Void) {
        DispatchQueue.global(qos: .userInitiated).async {
            do {
                /// Create a new PDF document
                let document = PDFDocument()
                for image in images {
                    /// Create a PDF page from the image
                    guard let pdfPage = PDFPage(image: image) else {
                        throw NSError(domain: "DocumentScannerView", code: 1, userInfo: [NSLocalizedDescriptionKey: NSLocalizedString("Failed to create PDF page from images", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")])
                    }
                    /// Add the PDF page to the document
                    document.insert(pdfPage, at: document.pageCount)
                }
                DispatchQueue.main.async {
                    /// Pass the created PDF document to the completion callback
                    completion(.success(document))
                }
            } catch {
                DispatchQueue.main.async {
                    /// Pass the error to the completion callback
                    completion(.failure(error))
                }
            }
        }
    }
}
