import OSLog
import PDFKit
import PhotosUI
import SwiftUI

/// Attachment Context facilites hierarchical components, i.e. AttachmentGroup and Attachment work together
@Observable
public class AttachmentContext {
    /// For toggle PhotosPicker
    public var showPhotosPicker: Bool = false
    
    /// For toggle FileImporter
    public var showFilesPicker: Bool = false
    
    /// For toggle camera
    public var showCamera: Bool = false
    
    /// For toggle Camera for PDF scanning
    public var showPdfScanner: Bool = false

    /// For toggle Camera for Images scanning
    public var showImageScanner: Bool = false
    
    var photoSelectionFilter: [PHPickerFilter] = []
    var fileSelectionFilter: [UTType] = []
    
    weak var delegate: AttachmentDelegate?
    var configuration: AttachmentGroupConfiguration?
    
    func upload(contentFrom provider: NSItemProvider) {
        guard let configuration else {
            os_log("AttachmentConfiguration is not initialized, yet. Please check code/usage.", log: OSLog.coreLogger, type: .debug)
            return
        }
        self.delegate?.upload(contentFrom: provider) { url, error in
            if let error {
                if let attachmentError = error as? AttachmentError {
                    switch attachmentError {
                    case .failedToUploadAttachment(let errorMessage):
                        configuration.errorMessage = AttributedString(errorMessage)
                    default:
                        break
                    }
                } else {
                    configuration.errorMessage = AttributedString("Upload failed due to, \(error.localizedDescription)")
                }
            } else {
                guard let url else { return }
                configuration.attachments.append(url)
                configuration.errorMessage = nil
            }
        }
    }
    
    func upload(photoPickerItems: [PhotosPickerItem]) {
        for item in photoPickerItems {
            os_log("Upload item identifier: %@", log: OSLog.coreLogger, type: .debug, "\(item.itemIdentifier ?? "N/A")")
            os_log("Item content types: %@", log: OSLog.coreLogger, type: .debug, "\(item.supportedContentTypes)")
            item.loadTransferable(type: Data.self) { result in
                switch result {
                case .success(let data):
                    if let data {
                        let provider = NSItemProvider()
                        // first supported uttype identifier
                        provider.registerDataRepresentation(forTypeIdentifier: item.supportedContentTypes[0].identifier, visibility: .ownProcess) { completionHandler in
                            completionHandler(data, nil)
                            return Foundation.Progress()
                        }
                        self.upload(contentFrom: provider)
                    }
                case .failure(let error):
                    self.configuration?.errorMessage = AttributedString(error.localizedDescription)
                    os_log("Error loading item: %@", log: OSLog.coreLogger, type: .error, "\(error)")
                    return
                }
            }
        }
    }
    
    func upload(images: [UIImage?]) {
        for item in images {
            guard let item else {
                self.configuration?.errorMessage = AttributedString("No image data available.")
                return
            }
            
            if let data = item.jpegData(compressionQuality: 1.0) {
                let provider = NSItemProvider()
                // first supported uttype identifier
                provider.registerDataRepresentation(forTypeIdentifier: UTType.jpeg.identifier, visibility: .ownProcess) { completionHandler in
                    completionHandler(data, nil)
                    return Foundation.Progress()
                }
                self.upload(contentFrom: provider)
            }
        }
    }
    
    func upload(pdfDocument: PDFDocument) {
        if let data = pdfDocument.dataRepresentation() {
            let provider = NSItemProvider()
            // first supported uttype identifier
            provider.registerDataRepresentation(forTypeIdentifier: UTType.pdf.identifier, visibility: .ownProcess) { completionHandler in
                completionHandler(data, nil)
                return Foundation.Progress()
            }
            self.upload(contentFrom: provider)
        }
    }

    func upload(movieUrl: URL?) {
        guard let movieUrl else {
            self.configuration?.errorMessage = AttributedString("Video file not available.")
            return
        }
        do {
            let data = try Data(contentsOf: movieUrl)
            let provider = NSItemProvider()
            provider.registerDataRepresentation(forTypeIdentifier: UTType.mpeg4Movie.identifier, visibility: .ownProcess) { completionHandler in
                completionHandler(data, nil)
                return Foundation.Progress()
            }
            self.upload(contentFrom: provider)
        } catch {
            self.configuration?.errorMessage = AttributedString(error.localizedDescription)
        }
    }
    
    func delete(attachment: URL) {
        guard let configuration else {
            os_log("AttachmentConfiguration is not initialized, yet. Please check code/usage.", log: OSLog.coreLogger, type: .debug)
            return
        }
        
        self.delegate?.delete(url: attachment) { url, error in
            if let error {
                if let attachmentError = error as? AttachmentError {
                    switch attachmentError {
                    case .failedToDeleteAttachment(let errorMessage):
                        configuration.errorMessage = AttributedString(errorMessage)
                    default:
                        break
                    }
                } else {
                    configuration.errorMessage = AttributedString(error.localizedDescription)
                    return
                }
            }
            self.configuration?.attachments.removeAll(where: { $0 == url })
        }
    }
}
