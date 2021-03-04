import Foundation

extension NumberFormatter {
    /// init with a style
    convenience init(style: NumberFormatter.Style) {
        self.init()
        self.numberStyle = style
    }
}
