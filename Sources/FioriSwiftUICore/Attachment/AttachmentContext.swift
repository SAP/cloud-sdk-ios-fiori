import PhotosUI
import SwiftUI

@Observable
public class AttachmentContext {
    public var showPhotosPicker: Bool = false
    public var showFilesPicker: Bool = false
    public var showCamera: Bool = false
    
    var photoSelectionFilter: [PHPickerFilter] = []
    var fileSelectionFilter: [UTType] = []
    
    var processor: AttachmentProcessor = BaseAttachmentProcessor()
    var configuration: AttachmentGroupConfiguration?
    
    func upload(contentFrom provider: NSItemProvider) {
        guard let configuration else {
            print("AttachmentConfiguration is not initialized, yet. Please check code/usage.")
            return
        }
        self.processor.upload(contentFrom: provider) { url, error in
            if let error {
                configuration.errorMessage = AttributedString(
                    error is AttachmentError ? error.localizedDescription : "Upload failed due to, \(error.localizedDescription)"
                )
                return
            }
            guard let url else { return }
            configuration.attachments.append(url)
            configuration.errorMessage = nil
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
                    print("Error loading item: \(error.localizedDescription)")
                    return
                }
            }
        }
    }
    
    func delete(attachment: URL) {
        self.processor.delete(url: attachment) { url, error in
            if let error {
                self.configuration?.errorMessage = AttributedString(error.localizedDescription)
                return
            }
            self.configuration?.attachments.removeAll(where: { $0 == url })
        }
    }
}
