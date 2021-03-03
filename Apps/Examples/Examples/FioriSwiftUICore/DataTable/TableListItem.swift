import Foundation
import SwiftUI

// struct ItemTitle: Identifiable, Hashable {
//    // the index in model.data for x & y axis
//    let index: Int
//    let value: CGFloat
//    let title: String
//
//    // relative postion
//    var pos: CGPoint
//
//    // the size of title
//    let size: CGSize
//
//    var id: Int {
//        self.index
//    }
//
//    init(index: Int, value: CGFloat = 0, title: String, pos: CGPoint, size: CGSize = .zero) {
//        self.index = index
//        self.value = value
//        self.title = title
//        self.pos = pos
//        self.size = size
//    }
//
//    mutating func x(_ x: CGFloat) {
//        self.pos.x = x
//    }
//
//    mutating func y(_ y: CGFloat) {
//        self.pos.y = y
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(self.pos.x)
//        hasher.combine(self.pos.y)
//        hasher.combine(self.size.width)
//        hasher.combine(self.size.height)
//    }
// }

struct TableListItem: Identifiable, Hashable {
    var id: Int {
        self.index
    }
    
    let index: Int
    let image: Image?
    let titles: [String]
    
    init(index: Int, image: Image? = nil, titles: [String]) {
        self.index = index
        self.image = image
        self.titles = titles
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.titles)
    }
}

struct TableDataItem: Identifiable, Hashable {
    let value: ValueType
    // the index in model.data for x & y axis
    let index: Int
    // relative postion
    var pos: CGPoint
    
    // the size of title
    var size: CGSize
    
    var id: Int {
        self.index
    }
    
    var offset: CGPoint
    
    var rowHeight: CGFloat = 0
    
    init(index: Int, value: ValueType = .text(""), pos: CGPoint, size: CGSize = .zero, offset: CGPoint = .zero) {
        self.index = index
        self.value = value
        self.pos = pos
        self.size = size
        self.offset = offset
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
