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

    var watermarkText: String?
    var watermarkTextColor: Color = .preferredColor(.tertiaryLabel)
    var watermarkTextFont: UIFont = .preferredFont(forTextStyle: .caption1)
    var watermarkTextAlignment: NSTextAlignment = .natural
    var addsTimestampInImage: Bool = false
    var timestampFormatter: DateFormatter?

    let signaturePadding = EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16)
    let watermarkTopToViewBottom: CGFloat = 48
    let watermarkBottomToViewBottom: CGFloat = 16
    let watermarkHorizontalPadding: CGFloat = 24

    static let defatultDateFormatString = "MM/dd/YYYY hh:mma zzz"

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
        let watermarkAttributedString = getWatermarkAttributedString()

        if let uiImage = createImage(path, watermarkAttributedString: watermarkAttributedString, size: self.drawingAreaSize, origin: nil) {
            self.image = uiImage
            if self.cropsImage {
                var size = CGSize(width: path.bounds.size.width + self.signaturePadding.leading + self.signaturePadding.trailing, height: path.bounds.size.height + self.signaturePadding.top + self.signaturePadding.bottom)
                var origin = CGPoint(x: path.bounds.origin.x - self.signaturePadding.leading, y: path.bounds.origin.y - self.signaturePadding.top)
                if watermarkAttributedString != nil {
                    size.height += self.watermarkTopToViewBottom
                    size.width = self.drawingAreaSize.width
                    origin.x = 0
                }
                return createImage(path, watermarkAttributedString: watermarkAttributedString, size: size, origin: origin)
            } else {
                return uiImage
            }
        }
        return nil
    }
}

extension ScribbleView {
    func createImage(_ path: UIBezierPath, watermarkAttributedString: NSAttributedString?, size: CGSize, origin: CGPoint?) -> UIImage? {
        var imageSize = size
        var extraHeight: CGFloat = 0
        let watermarkWidth = size.width - (self.watermarkHorizontalPadding * 2.0)
        let watermarkHeight = self.calculateWatermarkSize(watermarkText: watermarkAttributedString, preferredMaxLayoutWidth: watermarkWidth).height
        if self.watermarkTopToViewBottom - watermarkHeight < self.watermarkBottomToViewBottom {
            extraHeight = self.watermarkBottomToViewBottom - (self.watermarkTopToViewBottom - watermarkHeight)
            imageSize.height += extraHeight
            path.apply(CGAffineTransform(translationX: 0, y: -extraHeight))
        }

        UIGraphicsBeginImageContextWithOptions(imageSize, false, 1)
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

        if extraHeight > 0 {
            path.apply(CGAffineTransform(translationX: 0, y: extraHeight))
        }

        UIRectFill(CGRect(origin: .zero, size: imageSize))
        if #available(iOS 14.0, *) {
            let color = UIColor(self.strokeColor)
            color.setStroke()
        } else {
            let color = self.strokeColor.uiColor()
            color.setStroke()
        }
        path.stroke()

        if let attributedString = watermarkAttributedString {
            let x = self.watermarkHorizontalPadding
            let y = imageSize.height - self.watermarkTopToViewBottom - extraHeight
            attributedString.draw(in: CGRect(x: x, y: y, width: watermarkWidth, height: watermarkHeight))
        }

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

    func getTimestampFormatter() -> DateFormatter {
        if let formatter = timestampFormatter {
            return formatter
        }
        let defaultFormatter = DateFormatter()
        defaultFormatter.dateFormat = ScribbleView.defatultDateFormatString
        return defaultFormatter
    }

    func getWatermarkAttributedString() -> NSAttributedString? {
        var watermarkString: String = self.watermarkText ?? ""
        if self.addsTimestampInImage {
            let timestampText = self.getTimestampFormatter().string(from: Date())
            if !watermarkString.isEmpty {
                watermarkString += "\n"
            }
            watermarkString += timestampText
        }

        guard !watermarkString.isEmpty else {
            return nil
        }

        var attributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor(self.watermarkTextColor), NSAttributedString.Key.font: self.watermarkTextFont]
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = self.watermarkTextAlignment
        attributes[.paragraphStyle] = paragraphStyle
        return NSAttributedString(string: watermarkString, attributes: attributes)
    }

    func calculateWatermarkSize(watermarkText: NSAttributedString?, preferredMaxLayoutWidth: CGFloat) -> CGSize {
        if let line = watermarkText, !line.string.isEmpty {
            return line.boundingRect(with: CGSize(width: preferredMaxLayoutWidth, height: 0), options: [.usesFontLeading, .usesLineFragmentOrigin], context: nil).size
        } else {
            return CGSize.zero
        }
    }
}
