import FioriSwiftUICore
import SwiftUI
import UIKit

struct SignatureCaptureViewExample: View {
    var body: some View {
        SignatureCaptureView(
            onSave: { uiImage in
                let imgSaver = ImageSaver()
                imgSaver.writeToPhotoAlbum(image: uiImage)
            })
    }
}

struct SignatureCaptureViewExample2: View {
    let startAction = Action(actionText: "Sign Here", didSelectAction: nil)
    let restartAction = Action(actionText: "Sign Again", didSelectAction: nil)
    let cancelAction = Action(actionText: "Cancel2")
    let tapAction = Action(model: _TapToSignActionDefault())
    var body: some View {
        SignatureCaptureView(title: "Customer Signature",
                             startAction: tapAction,
                             cancelAction: Action(actionText: "Cancel2"),
                             clearAction: Action(actionText: "ClearClear"),
                             saveAction: Action(actionText: "Save Image"),
                             signatureImage: UIImage(systemName: "scribble")!,
                             onSave: { uiImage in
                                 let imgSaver = ImageSaver()
                                 imgSaver.writeToPhotoAlbum(image: uiImage)
                             })
            .titleFont(.callout)
            .titleColor(.red)
            .cropsImage(true)
            .strokeWidth(10)
            .strokeColor(.red)
            .drawingViewBackgroundColor(.yellow)
            .xmarkColor(.green)
            .signatureLineColor(.orange)
            .hidesXmark(false)
            .hidesSignatureLine(true)
            ._drawingViewMaxHeight(300)
            .restartActionModifier {
                $0.font(.callout).foregroundColor(.red)
            }
            .startActionModifier { content in
                content.font(nil).foregroundColor(.green)
            }
    }
}

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.saveError), nil)
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {}
}

public extension View {
    func asUIImage() -> UIImage {
        let hostingController = UIHostingController(rootView: self)
        
        hostingController.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(hostingController.view)
        
        let size = hostingController.sizeThatFits(in: UIScreen.main.bounds.size)
        hostingController.view.bounds = CGRect(origin: .zero, size: size)
        hostingController.view.sizeToFit()

        let resultingImage = hostingController.view.asUIImage()
        hostingController.view.removeFromSuperview()
        return resultingImage
    }
}

public extension UIView {
    func asUIImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}
