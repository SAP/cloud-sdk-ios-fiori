import Foundation
import SwiftUI

struct DataTableItem: Identifiable, Hashable {
    let value: ValueType
    
    let textAlignment: TextAlignment
    
    // the row index
    let rowIndex: Int
    
    let columnIndex: Int
    
    var firstBaselineHeight: CGFloat
    
    // relative center postion in the cell
    var pos: CGPoint
    
    // the size of title in one line
    var size: CGSize
    
    var id: Int {
        self.rowIndex
    }
    
    var offset: CGPoint
    
    var rowHeight: CGFloat = 0
    
    var font: Font?
    
    var uifont: UIFont?
    
    var foregroundColor: Color?
    
    var isImage: Bool {
        if case .image = self.value {
            return true
        }
        return false
    }
    
    var lineLimit: Int?
    
    init(index: Int,
         columnIndex: Int,
         value: ValueType = .text(""),
         firstBaselineHeight: CGFloat = 0,
         pos: CGPoint,
         font: Font?,
         uifont: UIFont? = nil,
         foregroundColor: Color? = nil,
         size: CGSize = .zero,
         offset: CGPoint = .zero,
         textAlignment: TextAlignment = .leading,
         lineLimit: Int? = nil)
    {
        self.rowIndex = index
        self.columnIndex = columnIndex
        self.value = value
        self.firstBaselineHeight = firstBaselineHeight
        self.pos = pos
        self.font = font
        self.uifont = uifont
        self.foregroundColor = foregroundColor
        self.size = size
        self.offset = offset
        self.textAlignment = textAlignment
        self.lineLimit = lineLimit
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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.value)
        hasher.combine(self.pos.x)
        hasher.combine(self.pos.y)
        hasher.combine(self.size.width)
        hasher.combine(self.size.height)
    }
}

enum ValueType: Hashable {
    case text(String)
    case image(Image)
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .text(let value):
            hasher.combine(value)
        default:
            break
        }
    }
}
