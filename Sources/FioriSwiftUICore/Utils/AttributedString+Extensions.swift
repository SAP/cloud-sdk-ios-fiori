import Foundation

extension AttributedString {
    /// Create an attributed string from a localized format string with arguments.
    /// - Parameters:
    ///   - formatKey: The key for a format string in the translation table.
    ///   - args: The arguments in the format string.
    ///   - attributes: The attributes of the attributed string.
    init(_ formatKey: String, args: any CVarArg..., attributes: AttributeContainer = .init()) {
        let format = NSLocalizedString(formatKey, tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        let str = String(format: format, args)
        self.init(str, attributes: attributes)
    }
    
    /// Create an attributed string from a localized format string with arguments based on the locale.
    /// - Parameters:
    ///   - formatKey: The key for a format string in the translation table.
    ///   - args: The arguments in the format string.
    ///   - attributes: The attributes of the attributed string.
    ///   - locale: The locale of the attributed string.
    init(_ formatKey: String, args: any CVarArg..., attributes: AttributeContainer = .init(), locale: Locale) {
        let format = locale.text(formatKey)
        let str = String(format: format, args)
        self.init(str, attributes: attributes)
    }
}
