import SwiftUI

/// Text item for `DataTable`
public struct DataTextItem: DataItem, CheckBinding {
    /// Type.
    public var type: DataItemType
    /// Binding rule.
    public var binding: ObjectViewProperty.Text?
    /// String for text item.
    public var text: String
    /// Font for item.
    public var font: Font?
    /// Line limit for item.
    public var lineLimit: Int?
    /// Foreground color for text item.
    public var fontColor: Color?
    
    var hasBinding: Bool {
        self.binding != nil
    }
    
    /// Public initializer for `DataTextItem`
    /// - Parameters:
    ///   - text: String for text item.
    ///   - font: Font for item
    ///   - fontColor: Foreground color for text Item.
    ///   - binding: Binding rule.
    ///   - lineLimit: Line limit for item.
    public init(_ text: String, _ font: Font? = nil, _ fontColor: Color? = nil, _ binding: ObjectViewProperty.Text? = nil, lineLimit: Int? = nil) {
        self.text = text
        self.font = font
        self.fontColor = fontColor
        self.type = .text
        self.binding = binding
        self.lineLimit = lineLimit
    }
    
    func toTextView() -> some View {
        Text(self.text)
            .font(self.font)
            .foregroundColor(self.fontColor)
    }
}
