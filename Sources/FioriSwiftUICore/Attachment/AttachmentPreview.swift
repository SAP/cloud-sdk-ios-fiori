import QuickLook
import SwiftUI

public struct AttachmentPreview: UIViewControllerRepresentable {
    @Binding var urls: [URL]
    @Binding var previewURL: URL
    let onDelete: ((URL) -> Void)?
    let onDismiss: (() -> Void)?
    
    public init(urls: Binding<[URL]>, previewURL: Binding<URL>, onDelete: ((URL) -> Void)? = nil, onDismiss: (() -> Void)? = nil) {
        self._urls = urls
        self._previewURL = previewURL
        self.onDelete = onDelete
        self.onDismiss = onDismiss
    }
    
    public func makeUIViewController(context: Context) -> UINavigationController {
        let controller = QLPreviewController()

        let coordinator = context.coordinator
        controller.dataSource = coordinator
        
        controller.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(barButtonSystemItem: .done, target: context.coordinator, action: #selector(coordinator.dismiss)),
            UIBarButtonItem(barButtonSystemItem: .trash, target: context.coordinator, action: #selector(coordinator.delete(sender:)))
        ]
        context.coordinator.viewController = controller

        let navigationController = UINavigationController(rootViewController: controller)
        navigationController.delegate = coordinator
        
        controller.currentPreviewItemIndex = self.urls.firstIndex(of: self.previewURL) ?? 0

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
            self.parent.urls.count
        }
        
        public func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            AttachmentQLPreviewItem(url: self.parent.urls[index])
        }
                
        @objc func dismiss() {
            self.parent.onDismiss?()
        }
        
        @objc func delete(sender: Any) {
            let alertController = UIAlertController(title: nil, message: "Are your sure you want to delete this attachment?", preferredStyle: .alert)
            alertController.addAction(
                UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
                    print("Delete \(self.parent.previewURL) in progress...")
                    DispatchQueue.main.async {
                        if let index = self.parent.urls.firstIndex(of: self.parent.previewURL) {
                            print("index: \(index) ")
                            self.parent.onDelete?(self.parent.urls[index])
                            if self.parent.urls.count > 0 {
                                self.parent.previewURL = self.parent.urls[index > 0 ? index - 1 : 0]
                                self.viewController?.reloadData()
                            } else {
                                self.parent.onDismiss?()
                            }
                        }
                    }
                })
            )
            alertController.addAction(
                UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                    print("Canceled delete")
                })
            )

            if let controller = viewController { // topMostViewController()
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

// struct AttachmentPreviewModifier: ViewModifier {
//    @Binding var previewUrl: URL?
//    var urls: [URL]
//    func body(content: Content) -> some View {
//        content
//            .quickLookPreview($previewUrl, in: urls)
//    }
// }
//
// extension View {
//    public func preview(_ previewUrl: Binding<URL?>, in urls: [URL]) -> some View {
//        modifier(AttachmentPreviewModifier(previewUrl: previewUrl, urls: urls))
//    }
//
//    public func preview(with modifier: any ViewModifier) -> some View {
//        modifier(modifier)
//    }
// }
