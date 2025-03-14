import PhotosUI
import SwiftUI

/// Attachment Context facilites hierarchical components, i.e. AttachmentGroup and Attachment work together
@Observable
public class AttachmentContext {
    /// For toggle PhotosPicker
    public var showPhotosPicker: Bool = false
    
    /// For toggle FileImporter
    public var showFilesPicker: Bool = false
    
    /// For toggle Camera
    public var showCamera: Bool = false
    
    var photoSelectionFilter: [PHPickerFilter] = []
    var fileSelectionFilter: [UTType] = []
    
    weak var delegate: AttachmentDelegate?
    var configuration: AttachmentGroupConfiguration?
    
    func upload(contentFrom provider: NSItemProvider) {
        guard let configuration else {
            print("AttachmentConfiguration is not initialized, yet. Please check code/usage.")
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
            print("identifier: \(item.itemIdentifier ?? "N/A")")
            print(item.supportedContentTypes)
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
                    print("Error loading item: \(error.localizedDescription)")
                    return
                }
            }
        }
    }
    
    func delete(attachment: URL) {
        guard let configuration else {
            print("AttachmentConfiguration is not initialized, yet. Please check code/usage.")
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
