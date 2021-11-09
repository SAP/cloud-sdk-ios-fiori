import Foundation
import SwiftUI
import UIKit

/**
 This `ScribbleView` is to capture user drawings.
 */
public struct ScribbleView: View {
    @Binding var image: UIImage?
    @Binding var currentDrawing: Drawing
    @Binding var drawings: [Drawing]
    @Binding var isSaved: Bool
    @Binding var isEditing: Bool
    @State var drawingAreaSize: CGSize = .zero
    var onSave: ((UIImage) -> Void)?
    var strokeWidth: CGFloat = 3.0
    var strokeColor = Color.preferredColor(.primaryLabel)
    var drawingViewBackgroundColor = Color.preferredColor(.primaryBackground)
    var cropsImage = false
    let signaturePadding = EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

    public var body: some View {
        let v = GeometryReader { geometry in
            Path { path in
                for drawing in self.drawings {
                    self.add(drawing: drawing, toPath: &path)
                }
                self.add(drawing: self.currentDrawing, toPath: &path)
            }
            .stroke(style: StrokeStyle(lineWidth: self.strokeWidth, lineCap: .round, lineJoin: .round))
            .foregroundColor(self.strokeColor)
            .background(self.drawingViewBackgroundColor.cornerRadius(10))
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
                        self.drawingAreaSize = geometry.size
                    }
            )
        }
        if self.isSaved {
            DispatchQueue.main.async {
                if let image = getUIImage() {
                    isSaved = false
                    isEditing = false
                    onSave?(image)
                }
            }
        }
        return v
    }

    func getUIImage() -> UIImage? {
        let path = createUIBezierPath(drawings: drawings, lineWidth: self.strokeWidth)
        if let uiImage = createImage(path, size: self.drawingAreaSize, origin: nil) {
            self.image = uiImage
            if self.cropsImage {
                let size = CGSize(width: path.bounds.size.width + self.signaturePadding.leading + self.signaturePadding.trailing, height: path.bounds.size.height + self.signaturePadding.top + self.signaturePadding.bottom)
                let origin = CGPoint(x: path.bounds.origin.x - self.signaturePadding.leading, y: path.bounds.origin.y - self.signaturePadding.top)
                return createImage(path, size: size, origin: origin)
            } else {
                return uiImage
            }
        }
        return nil
    }
}

extension ScribbleView {
    func createImage(_ path: UIBezierPath, size: CGSize, origin: CGPoint?) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 1)
        if #available(iOS 14.0, *) {
            let color = UIColor(self.drawingViewBackgroundColor)
            color.setFill()
        } else {
            let color = self.drawingViewBackgroundColor.uiColor()
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
}
