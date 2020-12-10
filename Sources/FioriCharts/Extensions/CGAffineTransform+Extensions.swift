import CoreGraphics

extension CGAffineTransform {
    static func inverted(in height: CGFloat) -> CGAffineTransform {
        CGAffineTransform(scaleX: 1, y: -1).translatedBy(x: 0, y: -height)
    }
}
