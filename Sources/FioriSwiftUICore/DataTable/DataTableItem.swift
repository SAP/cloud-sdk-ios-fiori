import Foundation
import SwiftUI

struct DataTableItem: Identifiable, Hashable {
    let value: ValueType
    
    let textAlignment: TextAlignment
    
    // the row index
    let rowIndex: Int
    // relative postion
    var pos: CGPoint
    
    // the size of title
    var size: CGSize
    
    var id: Int {
        self.rowIndex
    }
    
    var offset: CGPoint
    
    var rowHeight: CGFloat = 0
    
    var font: Font?
    
    var foregroundColor: Color?
    
    var isImage: Bool {
        if case .image = self.value {
            return true
        }
        return false
    }
    
    var lineLimit: Int?
    
    var isLast: Bool
    
    init(index: Int,
         value: ValueType = .text(""),
         pos: CGPoint,
         font: Font?,
         foregroundColor: Color? = nil,
         size: CGSize = .zero,
         offset: CGPoint = .zero,
         textAlignment: TextAlignment = .leading,
         lineLimit: Int? = nil,
         isLast: Bool = false)
    {
        self.rowIndex = index
        self.value = value
        self.pos = pos
        self.font = font
        self.foregroundColor = foregroundColor
        self.size = size
        self.offset = offset
        self.textAlignment = textAlignment
        self.lineLimit = lineLimit
        self.isLast = isLast
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
    static func == (lhs: ValueType, rhs: ValueType) -> Bool {
        switch (lhs, rhs) {
        case (.text(let l), .text(let r)):
            return l == r
        case (.image(let l), .image(let r)):
            return l == r
        case (.picker(let l), .picker(let r)):
            let d1 = l.data as [(String, [String])]
            let d2 = r.data as [(String, [String])]
            if d1.count != d2.count {
                return false
            }
            for i in 0 ..< d1.count {
                if d1[i].0 != d2[i].0 || d1[i].1 != d2[i].1 {
                    return false
                }
            }
            return true
        default:
            return false
        }
    }
    
    case text(String)
    case image(Image)
    case picker(DataPickerItem)
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .text(let value):
            hasher.combine(value)
        default:
            break
        }
    }
}
