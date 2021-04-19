import FioriSwiftUICore
import SwiftUI
import UIKit

struct SignatureCaptureView_Example: View {
//    @State var newImage: Image? = nil
    var body: some View {
        SignatureCaptureView(strokeWidth: 3.0, imageStrokeColor: .black, backgroundColor: .white, onSave: { result in
            let imgSaver = ImageSaver()
            imgSaver.writeToPhotoAlbum(image: result.uiImage)
        })
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
