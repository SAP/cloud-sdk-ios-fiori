import OSLog
import QuickLook
import SwiftUI

@available(watchOS, unavailable)
@available(visionOS, unavailable)
public struct AttachmentPreview: UIViewControllerRepresentable {
    @Binding var attachmentInfo: [AttachmentInfo]
    @Binding var previewURL: URL
    @Binding var controlState: ControlState
    
    let onDelete: ((URL) -> Void)?
    let onDismiss: (() -> Void)?
    
    public init(attachmentInfo: Binding<[AttachmentInfo]>, previewURL: Binding<URL>, controlState: Binding<ControlState>, onDelete: ((URL) -> Void)? = nil, onDismiss: (() -> Void)? = nil) {
        self._attachmentInfo = attachmentInfo
        self._previewURL = previewURL
        self.onDelete = onDelete
        self.onDismiss = onDismiss
        self._controlState = controlState
    }
    
    public func makeUIViewController(context: Context) -> UINavigationController {
        let controller = QLPreviewController()

        let coordinator = context.coordinator
        controller.dataSource = coordinator
        
        if self.controlState == .normal {
            controller.navigationItem.rightBarButtonItems = [
                UIBarButtonItem(barButtonSystemItem: .done, target: context.coordinator, action: #selector(coordinator.dismiss)),
                UIBarButtonItem(barButtonSystemItem: .trash, target: context.coordinator, action: #selector(coordinator.delete(sender:)))
            ]
        } else {
            controller.navigationItem.rightBarButtonItems = [
                UIBarButtonItem(barButtonSystemItem: .done, target: context.coordinator, action: #selector(coordinator.dismiss))
            ]
        }

        context.coordinator.viewController = controller

        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.delegate = coordinator
        
        controller.currentPreviewItemIndex = self.attachmentInfo.first { $0.primaryURL == self.previewURL }.flatMap { self.attachmentInfo.firstIndex(of: $0) } ?? 0

        return navigationController
    }

    public func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {}
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public class Coordinator: NSObject, QLPreviewControllerDataSource, UINavigationControllerDelegate {
        weak var viewController: QLPreviewController?
        let parent: AttachmentPreview

        init(_ parent: AttachmentPreview) {
            self.parent = parent
        }

        public func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            self.parent.attachmentInfo.count
        }
        
        public func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            AttachmentQLPreviewItem(url: self.parent.attachmentInfo[index].primaryURL)
        }
                
        @objc func dismiss() {
            self.parent.onDismiss?()
        }
        
        @objc func delete(sender: Any) {
            let alertController = UIAlertController(title: nil, message: NSLocalizedString("Delete Attachment?", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Delete Attachment?"), preferredStyle: .alert)
            alertController.addAction(
                UIAlertAction(title: NSLocalizedString("Delete", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Delete"), style: .destructive, handler: { _ in
                    os_log("Delete %@ in progress...", log: OSLog.coreLogger, type: .debug, self.parent.previewURL.absoluteString)
                    DispatchQueue.main.async {
                        if let index = self.parent.attachmentInfo.firstIndexOfUploaded(destinationURL: self.parent.previewURL) {
                            self.parent.onDelete?(self.parent.attachmentInfo[index].primaryURL)
                            if self.parent.attachmentInfo.isEmpty {
                                self.parent.onDismiss?()
                            } else {
                                self.parent.previewURL = self.parent.attachmentInfo[index > 0 ? index - 1 : 0].primaryURL
                                self.viewController?.reloadData()
                            }
                        }
                    }
                })
            )
            alertController.addAction(
                UIAlertAction(title: NSLocalizedString("Cancel", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "Cancel"), style: .cancel, handler: { _ in
                    os_log("Canceled delete %@...", log: OSLog.coreLogger, type: .debug, self.parent.previewURL.absoluteString)
                })
            )

            if let controller = viewController {
                controller.present(alertController, animated: true, completion: nil)
            }
        }
    }
}

class AttachmentQLPreviewItem: NSObject, QLPreviewItem {
    let previewItemURL: URL?
    init(url: URL) {
        self.previewItemURL = url
    }
}
