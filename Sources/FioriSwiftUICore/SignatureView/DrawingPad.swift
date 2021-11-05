import Foundation
import SwiftUI
import UIKit

/// Drawing struct used to capture user signature
struct Drawing {
    /// array of points used to track signature
    public var points = [CGPoint]()
    
    /// maximum X value of signature
    public var maxX: CGFloat {
        guard let max = points.max(by: { $0.x < $1.x }) else { return CGFloat.nan }
        return max.x
    }
    
    /// maximum Y value of signature
    public var maxY: CGFloat {
        guard let max = points.max(by: { $0.y < $1.y }) else { return CGFloat.nan }
        return max.y
    }
    
    /// minimum X value of signature
    public var minX: CGFloat {
        guard let min = points.min(by: { $0.x < $1.x }) else { return CGFloat.nan }
        return min.x
    }
    
    /// minimum Y value of signature
    public var minY: CGFloat {
        guard let min = points.min(by: { $0.y < $1.y }) else { return CGFloat.nan }
        return min.y
    }
}

struct DrawingPad: View {
    @Binding var currentDrawing: Drawing
    @Binding var drawings: [Drawing]
    @Binding var isSave: Bool
    @Binding var drawingPadSize: CGSize

    var onSave: ((SignatureView.Result) -> Void)?
    var strokeColor: Color
    var lineWidth: CGFloat
    var backgroundColor: Color
    let signaturePadding = EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
    var cropsImage: Bool
    
    var body: some View {
        let v = GeometryReader { geometry in
            Path { path in
                for drawing in self.drawings {
                    self.add(drawing: drawing, toPath: &path)
                }
                self.add(drawing: self.currentDrawing, toPath: &path)
            }
            .stroke(self.strokeColor, lineWidth: self.lineWidth)
            .background(self.backgroundColor.cornerRadius(10))
            .gesture(
                DragGesture(minimumDistance: 0.1)
                    .onChanged { value in
                        let currentPoint = value.location
                        if currentPoint.y >= 0,
                           currentPoint.y < geometry.size.height,
                           currentPoint.x >= 0,
                           currentPoint.x <= geometry.size.width
                        {
                            self.currentDrawing.points.append(currentPoint)
                        }
                    }
                    .onEnded { _ in
                        self.drawings.append(self.currentDrawing)
                        self.currentDrawing = Drawing()
                        self.drawingPadSize = geometry.size
                    }
            )
        }
        if self.isSave {
            let path = createUIBezierPath(drawings: drawings, lineWidth: self.lineWidth)
            guard let originalImage = createImage(path, size: self.drawingPadSize, origin: nil) else {
                return v
            }
            var signature = originalImage
            if self.cropsImage {
                let size = CGSize(width: path.bounds.size.width + signaturePadding.leading + signaturePadding.trailing, height: path.bounds.size.height + signaturePadding.top + signaturePadding.bottom)
                let origin = CGPoint(x: path.bounds.origin.x - signaturePadding.leading, y: path.bounds.origin.y - signaturePadding.top)
                if let cropedImage = createImage(path, size: size, origin: origin) {
                    signature = cropedImage
                }
            }

            let image = Image(uiImage: signature)
            self.onSave?(SignatureView.Result(image: image, uiImage: signature, originalUIImage: originalImage))
        }
        return v
    }
    
    private func add(drawing: Drawing, toPath path: inout Path) {
        let points = drawing.points
        if points.count > 1 {
            for i in 0 ..< points.count - 1 {
                let current = points[i]
                let next = points[i + 1]
                path.move(to: current)
                path.addLine(to: next)
            }
        }
    }

    func createImage(_ path: UIBezierPath, size: CGSize, origin: CGPoint?) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        if #available(iOS 14.0, *) {
            let color = UIColor(self.backgroundColor)
            color.setFill()
        } else {
            let color = self.backgroundColor.uiColor()
            color.setFill()
        }

        if let origin = origin {
            path.apply(CGAffineTransform(translationX: -1 * origin.x, y: -1 * origin.y))
        }

        UIRectFill(CGRect(origin: .zero, size: size))
        if #available(iOS 14.0, *) {
            let color = UIColor(self.strokeColor)
            color.setStroke()
        } else {
            let color = self.strokeColor.uiColor()
            color.setStroke()
        }
        path.stroke()

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
