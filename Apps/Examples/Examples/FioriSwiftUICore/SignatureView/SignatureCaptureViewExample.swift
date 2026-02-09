import FioriSwiftUICore
import SwiftUI
import UIKit

struct SignatureCaptureViewExample: View {
    var body: some View {
        SignatureCaptureView(watermark: {
            Text("This is a watermark")
        }, drawingViewMaxHeight: 400, addsTimestampInImage: true) { img in
            let imgSaver = ImageSaver()
            imgSaver.writeToPhotoAlbum(image: img)
        }
    }
}

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.saveError), nil)
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {}
}
