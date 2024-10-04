import Foundation
import SwiftUI

/**
 DataTableItem. It contains layout info. Internal usage only.
 */
struct DataTableItem: Identifiable, Hashable {
    let type: DataItemType
    // store the edited value
    var text: String?
    var image: Image?
    var ti: TimeInterval?
    var date: Date?
    
    let textAlignment: TextAlignment
    
    // the row index
    let rowIndex: Int
    
    // the column index
    let columnIndex: Int
    
    var firstBaselineHeight: CGFloat
    
    // relative center position in the cell
    var pos: CGPoint
    
    // the size of title in one line
    var size: CGSize
    
    var id: String {
        "\(self.rowIndex)+\(self.columnIndex)"
    }
    
    var offset: CGPoint
    
    var rowHeight: CGFloat = 0
    
    var font: Font?
    
    var uifont: UIFont?
    
    var foregroundColor: Color?
    
    var isImage: Bool {
        if self.type == .image {
            return true
        }
        
        return false
    }
    
    var lineLimit: Int?
    
    var isValid: Bool = true
    
    // cache the selected index for `DataListItem`
    var selectedIndex: Int?
    
    /// Is the cell read-only or not for the inline editing mode.
    var isReadonly: Bool = false
    
    init(type: DataItemType,
         rowIndex: Int,
         columnIndex: Int,
         text: String? = nil,
         image: Image? = nil,
         firstBaselineHeight: CGFloat = 0,
         pos: CGPoint,
         font: Font?,
         uifont: UIFont? = nil,
         foregroundColor: Color? = nil,
         size: CGSize = .zero,
         offset: CGPoint = .zero,
         textAlignment: TextAlignment = .leading,
         lineLimit: Int? = nil,
         isValid: Bool,
         isReadonly: Bool = false)
    {
        self.type = type
        self.rowIndex = rowIndex
        self.columnIndex = columnIndex
        self.text = text
        self.image = image
        self.firstBaselineHeight = firstBaselineHeight
        self.pos = pos
        self.font = font
        self.uifont = uifont
        self.foregroundColor = foregroundColor
        self.size = size
        self.offset = offset
        self.textAlignment = textAlignment
        self.lineLimit = lineLimit
        self.isValid = isValid
        self.isReadonly = isReadonly
    }
    
    mutating func x(_ x: CGFloat) {
        self.pos.x = x
    }
    
    mutating func y(_ y: CGFloat) {
        self.pos.y = y
    }
    
    mutating func offset(_ offset: CGPoint) {
        self.offset = offset
    }
    
    mutating func rowHeight(_ h: CGFloat) {
        self.rowHeight = h
    }
    
    mutating func size(_ s: CGSize) {
        self.size = s
    }
    
    func string(for columnAttribute: ColumnAttribute) -> String? {
        var result: String?
        
        switch self.type {
        case .date:
            if let tmpDate = self.date {
                let df = columnAttribute.dateFormatter(for: .date)
                result = df.string(from: tmpDate)
            }
        case .time:
            if let tmpDate = self.date {
                let df = columnAttribute.dateFormatter(for: .time)
                result = df.string(from: tmpDate)
            }
        
        case .duration:
            if let value = ti {
                let durationTextFormat = columnAttribute.durationTextFormat
                let hrs = Int(value) / 3600
                let min = (Int(value) - hrs * 3600) / 60
                
                result = String(format: durationTextFormat, locale: Locale.autoupdatingCurrent, hrs, min)
            }
            
        default:
            break
        }
        
        return result
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.type)
        hasher.combine(self.rowIndex)
        hasher.combine(self.columnIndex)
        hasher.combine(self.pos.x)
        hasher.combine(self.pos.y)
        hasher.combine(self.size.width)
        hasher.combine(self.size.height)
        hasher.combine(self.isValid)
        hasher.combine(self.isReadonly)
    }
}
