import SwiftUI

/// Duration item for `DataTable`
public struct DataDurationItem: DataItemTextComponent, CheckBinding, Equatable {
    /// Type.
    public var type: DataItemType = .duration
    
    /// value
    public var duration: TimeInterval
    
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
    
    /**
     Determines whether the cell is read-only or not for inline editing mode. `nil` means it is `false`.
     A cell's `isReadonly` is determined by the value of itself, the row, and the column.
     If only one of these three values, is set then that value is used.
     If two or three values are set, then the higher priority of value is used.
     The order of priority from high to low is: cell, row, and column.
     */
    public var isReadonly: Bool?
    
    /// Public initializer for `DataTextItem`
    /// - Parameters:
    ///   - duration: duration for the item.
    ///   - font: Font for item
    ///   - textColor: Foreground color for text Item.
    ///   - binding: Binding rule.
    ///   - lineLimit: Line limit for item.
    ///   - isReadonly: Whether the cell is read-only or not in inline editing mode.
    public init(_ duration: TimeInterval, _ font: Font? = nil, _ textColor: Color? = nil, _ binding: ObjectViewProperty.Text? = nil, lineLimit: Int? = nil, isReadonly: Bool? = nil) {
        self.duration = duration
        self.font = font
        self.textColor = textColor
        self.binding = binding
        self.lineLimit = lineLimit
        self.isReadonly = isReadonly
    }
    
    /// Public initializer for `DataTextItem`
    /// - Parameters:
    ///   - duration: duration for the item.
    ///   - uifont: UIFont for item
    ///   - textColor: Foreground color for text Item.
    ///   - binding: Binding rule.
    ///   - lineLimit: Line limit for item.
    ///   - isReadonly: Whether the cell is read-only or not in inline editing mode.
    public init(duration: TimeInterval, uifont: UIFont? = nil, textColor: Color? = nil, binding: ObjectViewProperty.Text? = nil, lineLimit: Int? = nil, isReadonly: Bool? = nil) {
        self.duration = duration
        self.uifont = uifont
        self.textColor = textColor
        self.binding = binding
        self.lineLimit = lineLimit
        self.isReadonly = isReadonly
    }
    
    func string(for columnAttribute: ColumnAttribute) -> String {
        let durationTextFormat = columnAttribute.durationTextFormat
        let hrs = Int(duration) / 3600
        let min = (Int(duration) - hrs * 3600) / 60
        
        return String(format: durationTextFormat, locale: Locale.autoupdatingCurrent, hrs, min)
    }
    
    /// check equality
    public static func == (lhs: DataDurationItem, rhs: DataDurationItem) -> Bool {
        if lhs.duration != rhs.duration {
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
