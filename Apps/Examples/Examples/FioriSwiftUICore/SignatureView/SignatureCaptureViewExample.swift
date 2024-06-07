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
            ._drawingViewMaxHeight(400)
            .addsTimestampInImage(true)
            .watermarkText("A bird in the hand is worth two in the bush. Behind every great man there's a great woman. A bird in the hand is worth two in the bush.")
    }
}

struct SignatureCaptureViewExample2: View {
    let startAction = _Action(actionText: "Sign Here", didSelectAction: nil)
    let restartAction = _Action(actionText: "Sign Again", didSelectAction: nil)
    let cancelAction = _Action(actionText: "Cancel2")
    let tapAction = _Action(model: _TapToSignActionDefault())
    var body: some View {
        SignatureCaptureView(title: "Long Long Long Long Long Long Long Signature",
                             startAction: self.startAction,
                             restartAction: self.restartAction,
                             cancelAction: _Action(actionText: "Cancel2"),
                             clearAction: _Action(actionText: "ClearClear"),
                             saveAction: _Action(actionText: "Save Image"),
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
                             .addsTimestampInImage(true)
                             .isRequired(true)
                             .timestampFormatter(self.customFormatter())
                             .watermarkText("A bird in the hand is worth two in the bush. Behind every great man there's a great woman.")
                             .watermarkTextAlignment(.right)
                             .watermarkTextFont(.preferredFont(forTextStyle: .body))
                             .watermarkTextColor(.green)
                             ._drawingViewMaxHeight(300)
                             .restartActionModifier {
                                 $0.font(.callout).foregroundColor(.red)
                             }
                             .startActionModifier { content in
                                 content.font(nil).foregroundColor(.green)
                             }
    }

    func customFormatter() -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
}

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.saveError), nil)
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {}
}

#if !os(visionOS)
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
#endif
