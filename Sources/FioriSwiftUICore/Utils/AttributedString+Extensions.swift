import Foundation

extension AttributedString {
    /// Create an attributed string from a localized format string with arguments.
    /// - Parameters:
    ///   - formatKey: The key for a format string in the translation table.
    ///   - args: The arguments in the format string.
    ///   - attributes: The attributes of the attributed string.
    init(_ formatKey: String, args: any CVarArg..., attributes: AttributeContainer = .init()) {
        let format = NSLocalizedString(formatKey, comment: "")
        let str = String(format: format, args)
        self.init(str, attributes: attributes)
    }
}
