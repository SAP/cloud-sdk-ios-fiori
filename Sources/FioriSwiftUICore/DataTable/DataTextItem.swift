import SwiftUI

/// Text item for `DataTable`
public struct DataTextItem: DataItem, CheckBinding {
    /// Type.
    public var type: DataItemType
    /// Binding rule.
    public var binding: ObjectViewProperty.Text?
    /// String for text item.
    public var text: String
    /// font, if both font and uifont are provided, uifont is used.
    public var font: Font?
    /// uifont
    public var uifont: UIFont?
    /// Line limit for item.
    public var lineLimit: Int?
    /// Foreground color for text item.
    public var textColor: Color?
    
    var hasBinding: Bool {
        self.binding != nil
    }
    
    /// Public initializer for `DataTextItem`
    /// - Parameters:
    ///   - text: String for text item.
    ///   - font: Font for item
    ///   - textColor: Foreground color for text Item.
    ///   - binding: Binding rule.
    ///   - lineLimit: Line limit for item.
    public init(_ text: String, _ font: Font? = nil, _ textColor: Color? = nil, _ binding: ObjectViewProperty.Text? = nil, lineLimit: Int? = nil) {
        self.text = text
        self.font = font
        self.textColor = textColor
        self.type = .text
        self.binding = binding
        self.lineLimit = lineLimit
    }
    
    /// Public initializer for `DataTextItem`
    /// - Parameters:
    ///   - text: String for text item.
    ///   - uifont: UIFont for item
    ///   - textColor: Foreground color for text Item.
    ///   - binding: Binding rule.
    ///   - lineLimit: Line limit for item.
    public init(text: String, uifont: UIFont? = nil, textColor: Color? = nil, binding: ObjectViewProperty.Text? = nil, lineLimit: Int? = nil) {
        self.text = text
        self.uifont = uifont
        self.textColor = textColor
        self.type = .text
        self.binding = binding
        self.lineLimit = lineLimit
    }
    
    func toTextView() -> some View {
        Text(self.text)
            .font(self.font)
            .foregroundColor(self.textColor)
    }
}
