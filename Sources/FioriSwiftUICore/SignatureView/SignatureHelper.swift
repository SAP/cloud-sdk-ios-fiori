import Foundation
import SwiftUI
import UIKit

/// Result holds an `Image` and a `UIImage` type for the same signature image
public struct Result {
    /// Signature Image
    public let image: Image
    /// SIgnature UIImage
    public let uiImage: UIImage
}

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(self.saveError), nil)
    }

    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {}
}

extension UIView {
    func asImage(rect: CGRect) -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: rect)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

func createUIBezierPath(points: [CGPoint]) -> UIBezierPath {
    let bezierPath = UIBezierPath()
    print(points.count)
    for (index, point) in points.enumerated() {
        if index == 0 {
            bezierPath.move(to: point)
        } else {
            bezierPath.addLine(to: point)
        }
    }
    return bezierPath
}

struct RectGetter: View {
    @Binding var rect: CGRect

    var body: some View {
        GeometryReader { proxy in
            self.createView(proxy: proxy)
        }
    }

    func createView(proxy: GeometryProxy) -> some View {
        DispatchQueue.main.async {
            self.rect = proxy.frame(in: .global)
        }

        return Rectangle().fill(Color.clear)
    }
}
