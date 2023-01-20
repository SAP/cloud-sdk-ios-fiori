import SwiftUI

/// An enum representing the different item styles that a `DataTable` can have.
public enum DataItemType: Int, CaseIterable {
    /// Indicating this row item represents a text.
    case text
    
    /// Indicating this row item represents a image.
    case image
    
    /// date, the data type is a `Date` and displayed as a `String` with a `DateFormatter`
    case date
    
    /// time, the data type is a `Date` and displayed as a `String` with a `DateFormatter`
    case time
    
    /// duration, the data type is a `TimeInterval` and displayed as a `String` with a formatter
    case duration
    
    /// a `String` type and the value is one of a set of predefined `String`
    case listitem
}

///  A protocol defines style of a `DataItem`.
public protocol DataItem {
    /// Returns the `DataItemType` enum value for the item.
    var type: DataItemType { get }
    
    /// conver itself to a SwiftUI View
    func toView() -> AnyView
}

// swiftlint:disable function_parameter_count
protocol DataTableItemConvertion {
    func convertToDataTableItem(rowIndex: Int, columnIndex: Int, contentWidth: CGFloat, textAlignment: TextAlignment, isHeader: Bool, isValid: Bool) -> DataTableItem?
}

extension DataTableItemConvertion {
    func convertToDataTableItem(rowIndex: Int, columnIndex: Int, contentWidth: CGFloat, textAlignment: TextAlignment, isHeader: Bool, isValid: Bool) -> DataTableItem? {
        nil
    }
}

protocol DataItemTextComponent: DataItem, DataTableItemConvertion {
    /// String for text item.
    var text: String { get set }
    
    /// font, if both font and uifont are provided, uifont is used.
    var font: Font? { get set }
    
    /// uifont
    var uifont: UIFont? { get set }
    
    /// Line limit for item.
    var lineLimit: Int? { get set }
    
    /// Foreground color for text item.
    var textColor: Color? { get set }
    
    /// Binding rule.
    var binding: ObjectViewProperty.Text? { get set }
    
    func finalUIFont(_ isHeader: Bool) -> UIFont
    
    /// the text to display after applying the formatter
    func string(for columnAttribute: ColumnAttribute) -> String
}

extension DataItemTextComponent {
    func convertToDataTableItem(rowIndex: Int, columnIndex: Int, contentWidth: CGFloat, textAlignment: TextAlignment = .leading, isHeader: Bool = false, isValid: Bool = true) -> DataTableItem? {
        let title = self.text
        let uifont = self.finalUIFont(isHeader)
        let firstBaselineHeight = uifont.lineHeight + uifont.descender
        let textColor = self.textColor ?? TableViewLayout.defaultFontColor(isHeader)
        var size: CGSize = .zero
        if contentWidth > 0 {
            size = title.boundingBoxSize(with: uifont, width: contentWidth, height: CGFloat(MAXFLOAT))
        }
        if type == .listitem { // add a spacing and chevron's size
            size.width += 15
            size.height = max(size.height, 22)
        }
        let font = self.font ?? TableViewLayout.defaultFont(isHeader)
        
        var dataItem = DataTableItem(type: self.type,
                                     rowIndex: rowIndex,
                                     columnIndex: columnIndex,
                                     text: title,
                                     firstBaselineHeight: firstBaselineHeight,
                                     pos: .zero,
                                     font: font,
                                     uifont: uifont,
                                     foregroundColor: textColor,
                                     size: size,
                                     textAlignment: textAlignment,
                                     lineLimit: self.lineLimit,
                                     isValid: isValid)
        
        if let item = self as? DataDateItem {
            dataItem.date = item.date
        } else if let item = self as? DataTimeItem {
            dataItem.date = item.date
        } else if let item = self as? DataDurationItem {
            dataItem.ti = item.duration
        }
        
        return dataItem
    }
    
    func finalUIFont(_ isHeader: Bool = false) -> UIFont {
        var uifont: UIFont
        if let tmpUIFont = self.uifont {
            // `item.uifont` is passed by developer, although is a preferred font but can't resize according to system in SwiftUI. So need to redefine the UIFont instance.
            if let styleName = tmpUIFont.fontDescriptor.fontAttributes[.textStyle] as? String {
                let textStyle = UIFont.TextStyle(rawValue: styleName)
                uifont = UIFont.preferredFont(forTextStyle: textStyle)
            } else {
                uifont = tmpUIFont
            }
        } else if let _font = self.font {
            uifont = UIFont.preferredFont(from: _font)
        } else {
            uifont = TableViewLayout.defaultUIFont(isHeader) // isHeader ? UIFont.preferredFont(from: .subheadline) : UIFont.preferredFont(from: .body) //
        }
        
        return uifont
    }
    
    /// conver itself to a SwiftUI View
    public func toView() -> AnyView {
        AnyView(Text(self.text)
            .font(self.font)
            .foregroundColor(self.textColor))
    }
}

protocol DataItemImageComponent: DataItem, DataTableItemConvertion {
    /// Image for item.
    var image: Image { get set }
    
    /// Tint color for image.
    var tintColor: Color? { get set }
    
    /// Mapping rule.
    var binding: ObjectViewProperty.Image? { get set }
}

extension DataItemImageComponent {
    func convertToDataTableItem(rowIndex: Int, columnIndex: Int, contentWidth: CGFloat, textAlignment: TextAlignment = .leading, isHeader: Bool = false, isValid: Bool = true) -> DataTableItem? {
        guard let item = (self as? DataImageItem) else {
            return nil
        }
        
        return DataTableItem(type: self.type,
                             rowIndex: rowIndex,
                             columnIndex: columnIndex,
                             image: item.image,
                             pos: .zero,
                             font: nil,
                             foregroundColor: item.tintColor,
                             size: CGSize(width: TableViewLayout.imageSize, height: TableViewLayout.imageSize),
                             textAlignment: textAlignment,
                             isValid: isValid)
    }
    
    /// conver itself to a SwiftUI View
    public func toView() -> AnyView {
        AnyView(image)
    }
}

/// Property for object view.
public enum ObjectViewProperty {
    /// Binding definitions for text in object view layout
    public enum Text {
        /// Object view headline area
        case title
        /// Object view subheadline area
        case subtitle
        /// Object view footnote area
        case footnote
        /// Object view status area
        case status
        /// Object view substatus area
        case substatus
    }

    /// Binding definitions for images in object view layout
    public enum Image {
        /// Object view detailImage area
        case detailImage
        /// Object view statusImage area
        case statusImage
        /// Object view substatusImage area
        case substatusImage
    }
}

protocol CheckBinding {
    var hasBinding: Bool { get }
}
