import SwiftUI

/// Text item for `DataTable`
public class DataTextItem: DataItem {
    /// Type.
    public var type: DataItemType
    /// Mapping rule.
    public var mapping: ObjectViewProperty.Text?
    /// String for text item.
    public var text: String
    /// Font for item.
    public var font: Font
    /// Line limit for item.
    public var lineLimit: Int?
    
    /// Public initializer for `DataTextItem`
    /// - Parameters:
    ///   - text: String for text item.
    ///   - font: Font for item
    ///   - mapping: Mapping rule.
    ///   - lineLimit: Line limit for item.
    public init(_ text: String, _ font: Font = .body, _ mapping: ObjectViewProperty.Text? = nil, lineLimit: Int? = nil) {
        self.text = text
        self.font = font
        self.type = .text
        self.mapping = mapping
        self.lineLimit = lineLimit
    }
    
    func toTextView() -> some View {
        Text(self.text)
            .font(self.font)
    }
}
