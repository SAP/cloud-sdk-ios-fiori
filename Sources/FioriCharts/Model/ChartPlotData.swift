import Foundation
import SwiftUI

enum ChartPlotData: Hashable, Identifiable {
    case point(point: ChartPlotPointData)
    case rect(rect: ChartPlotRectData)
    case ellipse(ellipse: ChartPlotEllipseData)
    
    var plotRectData: ChartPlotRectData? {
        switch self {
        case .rect(let data):
            return data
        default:
            return nil
        }
    }
    
    var plotPointData: ChartPlotPointData? {
        switch self {
        case .point(let data):
            return data
        default:
            return nil
        }
    }
    
    var plotEclipseData: ChartPlotEllipseData? {
        switch self {
        case .ellipse(let data):
            return data
        default:
            return nil
        }
    }
    
    var seriesIndex: Int {
        switch self {
        case .point(let data):
            return data.seriesIndex
        case .rect(let data):
            return data.seriesIndex
        case .ellipse(let data):
            return data.seriesIndex
        }
    }
    
    var categoryIndex: Int {
        switch self {
        case .point(let data):
            return data.categoryIndex
        case .rect(let data):
            return data.categoryIndex
        case .ellipse(let data):
            return data.categoryIndex
        }
    }
    
    var selected: Bool {
        switch self {
        case .point(let data):
            return data.selected
        case .rect(let data):
            return data.selected
        case .ellipse(let data):
            return data.selected
        }
    }
    
    var rect: CGRect {
        switch self {
        case .point(let data):
            return CGRect(origin: data.point, size: .zero)
        case .rect(let data):
            return data.rect
        case .ellipse(let data):
            return data.rect
        }
    }
    
    var pos: CGPoint {
        switch self {
        case .point(let data):
            return data.point
        case .rect(let data):
            return data.pos
        case .ellipse(let data):
            return data.point
        }
    }
    
    var value: CGFloat {
        switch self {
        case .point(let data):
            return data.value
        case .rect(let data):
            return data.value
        case .ellipse(let data):
            return data.values.first ?? 0
        }
    }
    
    var isPlotRectData: Bool {
        switch self {
        case .rect:
            return true
        default:
            return false
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .point(let data):
            hasher.combine(data)
        case .rect(let data):
            hasher.combine(data)
        case .ellipse(let data):
            hasher.combine(data)
        }
    }
    
    var id: String {
        String("\(self.seriesIndex)+\(self.categoryIndex)")
    }
    
    func changeSelected(selected: Bool) -> ChartPlotData {
        switch self {
        case .point(let data):
            let copy = ChartPlotPointData(seriesIndex: data.seriesIndex,
                                          categoryIndex: data.categoryIndex,
                                          value: data.value,
                                          x: data.point.x,
                                          y: data.point.y,
                                          selected: selected)
            return ChartPlotData.point(point: copy)
            
        case .rect(let data):
            let copy = ChartPlotRectData(seriesIndex: data.seriesIndex,
                                         categoryIndex: data.categoryIndex,
                                         value: data.value,
                                         x: data.rect.origin.x,
                                         y: data.rect.origin.y,
                                         width: data.rect.size.width,
                                         height: data.rect.size.height,
                                         selected: selected)
            
            return ChartPlotData.rect(rect: copy)
        case .ellipse(let data):
            let copy = ChartPlotEllipseData(seriesIndex: data.seriesIndex,
                                            categoryIndex: data.categoryIndex,
                                            values: data.values,
                                            x: data.point.x,
                                            y: data.point.y,
                                            radius: data.radius,
                                            selected: selected)
            
            return ChartPlotData.ellipse(ellipse: copy)
        }
    }
}

struct ChartPlotPointData: Identifiable, Hashable {
    let id = UUID()
    
    let seriesIndex: Int
    let categoryIndex: Int
    let value: CGFloat
    let point: CGPoint
    var selected: Bool = false
    
    init(seriesIndex: Int,
         categoryIndex: Int,
         value: CGFloat,
         x: CGFloat,
         y: CGFloat,
         selected: Bool = false)
    {
        self.seriesIndex = seriesIndex
        self.categoryIndex = categoryIndex
        self.value = value
        self.point = CGPoint(x: x, y: y)
        self.selected = selected
    }
    
    mutating func changeSelected(selected: Bool) {
        self.selected = selected
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.point.x)
        hasher.combine(self.point.y)
    }
}

struct ChartPlotEllipseData: Identifiable, Hashable {
    let id = UUID()
    
    let seriesIndex: Int
    let categoryIndex: Int
    let values: [CGFloat]
    let radius: CGFloat
    let point: CGPoint
    var selected: Bool = false
    
    var rect: CGRect {
        let x = self.point.x - self.radius
        let y = self.point.y - self.radius
        
        return CGRect(x: x, y: y, width: self.radius * 2, height: self.radius * 2)
    }
    
    init(seriesIndex: Int,
         categoryIndex: Int,
         values: [CGFloat],
         x: CGFloat,
         y: CGFloat,
         radius: CGFloat,
         selected: Bool = false)
    {
        self.seriesIndex = seriesIndex
        self.categoryIndex = categoryIndex
        self.values = values
        self.point = CGPoint(x: x, y: y)
        self.radius = radius
        self.selected = selected
    }
    
    mutating func changeSelected(selected: Bool) {
        self.selected = selected
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.point.x)
        hasher.combine(self.point.y)
    }
}

struct ChartPlotRectData: Identifiable, Hashable {
    let id = UUID()
    
    let seriesIndex: Int
    let categoryIndex: Int
    let value: CGFloat
    let rect: CGRect
    var selected: Bool = false
    
    var pos: CGPoint {
        let x = self.rect.origin.x + self.rect.size.width * 0.5
        let y = self.rect.origin.y + self.rect.size.height * 0.5
        return CGPoint(x: x, y: y)
    }
    
    init(seriesIndex: Int,
         categoryIndex: Int,
         value: CGFloat,
         x: CGFloat,
         y: CGFloat,
         width: CGFloat,
         height: CGFloat,
         selected: Bool = false)
    {
        self.seriesIndex = seriesIndex
        self.categoryIndex = categoryIndex
        self.value = value
        self.rect = CGRect(x: x, y: y, width: width, height: height)
        self.selected = selected
    }
    
    mutating func changeSelected(selected: Bool) {
        self.selected = selected
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.rect.origin.x)
        hasher.combine(self.rect.origin.y)
        hasher.combine(self.rect.size.width)
        hasher.combine(self.rect.size.height)
    }
}
