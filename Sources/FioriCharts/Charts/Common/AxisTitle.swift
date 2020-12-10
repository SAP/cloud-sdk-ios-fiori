import Foundation
import SwiftUI

struct AxisTitle: Identifiable, Hashable {
    // the index in model.data for x & y axis
    let index: Int
    let value: CGFloat
    let title: String
    
    // relative postion
    var pos: CGPoint
    
    // the size of title
    let size: CGSize
    
    var id: Int {
        self.index
    }
    
    init(index: Int, value: CGFloat = 0, title: String, pos: CGPoint, size: CGSize = .zero) {
        self.index = index
        self.value = value
        self.title = title
        self.pos = pos
        self.size = size
    }
    
    mutating func x(_ x: CGFloat) {
        self.pos.x = x
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.pos.x)
        hasher.combine(self.pos.y)
        hasher.combine(self.size.width)
        hasher.combine(self.size.height)
    }
}
