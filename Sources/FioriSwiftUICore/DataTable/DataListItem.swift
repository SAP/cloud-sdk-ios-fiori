import SwiftUI

/// List item for `DataTable`
public struct DataListItem: DataItemTextComponent, CheckBinding, Equatable {
    public let type: DataItemType = .listitem

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

    /// Binding rule.
    public var binding: ObjectViewProperty.Text?

    /**
     Determines whether the cell is read-only or not for inline editing mode. `nil` means it is `false`.
     A cell's `isReadonly` is determined by the value of itself, the row, and the column.
     If only one of these three values, is set then that value is used.
     If two or three values are set, then the higher priority of value is used.
     The order of priority from high to low is: cell, row, and column.
     */
    public var isReadonly: Bool?
    
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
    ///   - isReadonly: Whether the cell is read-only or not in inline editing mode.
    public init(_ text: String, _ font: Font? = nil, _ textColor: Color? = nil, _ binding: ObjectViewProperty.Text? = nil, lineLimit: Int? = nil, isReadonly: Bool? = nil) {
        self.text = text
        self.font = font
        self.textColor = textColor
        self.binding = binding
        self.lineLimit = lineLimit
        self.isReadonly = isReadonly
    }
    
    /// Public initializer for `DataTextItem`
    /// - Parameters:
    ///   - text: String for text item.
    ///   - uifont: UIFont for item
    ///   - textColor: Foreground color for text Item.
    ///   - binding: Binding rule.
    ///   - lineLimit: Line limit for item.
    ///   - isReadonly: Whether the cell is read-only or not in inline editing mode.
    public init(text: String, uifont: UIFont? = nil, textColor: Color? = nil, binding: ObjectViewProperty.Text? = nil, lineLimit: Int? = nil, isReadonly: Bool? = nil) {
        self.text = text
        self.uifont = uifont
        self.textColor = textColor
        self.binding = binding
        self.lineLimit = lineLimit
        self.isReadonly = isReadonly
    }
    
    func string(for columnAttribute: ColumnAttribute) -> String {
        self.text
    }
    
    /// check equality
    public static func == (lhs: DataListItem, rhs: DataListItem) -> Bool {
        if lhs.text != rhs.text {
            return false
        }
        
        if lhs.font != rhs.font {
            return false
        }
        
        if lhs.uifont != rhs.uifont {
            return false
        }
        
        if lhs.lineLimit != rhs.lineLimit {
            return false
        }
        
        if lhs.textColor != rhs.textColor {
            return false
        }
        
        if lhs.isReadonly != rhs.isReadonly {
            return false
        }
        
        return true
    }
}
