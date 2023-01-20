import SwiftUI

/// Time item for `DataTable`
public struct DataTimeItem: DataItemTextComponent, CheckBinding {
    /// Type.
    public var type: DataItemType = .time
    
    /// date
    public var date: Date
    
    /// String for text item.
    public var text: String = ""
    
    /// font, if both font and uifont are provided, uifont is used.
    public var font: Font?
    
    /// uifont
    public var uifont: UIFont?
    
    /// Line limit for item.
    public var lineLimit: Int?
    
    /// Foreground color for text item.
    public var textColor: Color?

    /// Binding rule.
    public var binding: ObjectViewProperty.Text?
    
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
    public init(_ date: Date, _ font: Font? = nil, _ textColor: Color? = nil, _ binding: ObjectViewProperty.Text? = nil, lineLimit: Int? = nil) {
        self.date = date
        self.font = font
        self.textColor = textColor
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
    public init(date: Date, uifont: UIFont? = nil, textColor: Color? = nil, binding: ObjectViewProperty.Text? = nil, lineLimit: Int? = nil) {
        self.date = date
        self.uifont = uifont
        self.textColor = textColor
        self.binding = binding
        self.lineLimit = lineLimit
    }
    
    func string(for columnAttribute: ColumnAttribute) -> String {
        let df = columnAttribute.dateFormatter(for: .time)
        return df.string(from: self.date)
    }
}
