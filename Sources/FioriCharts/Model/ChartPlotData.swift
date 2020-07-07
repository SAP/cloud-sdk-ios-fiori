//
//  ChartPlotData.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/3/20.
//

import Foundation
import SwiftUI

enum ChartPlotData: Hashable {
    case point(point: ChartPlotPointData)
    case rect(rect: ChartPlotRectData)
    
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
    
    var seriesIndex: Int {
        switch self {
        case .point(let data):
            return data.seriesIndex
        case .rect(let data):
            return data.seriesIndex
        }
    }
    
    var categoryIndex: Int {
        switch self {
        case .point(let data):
            return data.categoryIndex
        case .rect(let data):
            return data.categoryIndex
        }
    }
    
    var selected: Bool {
        switch self {
        case .point(let data):
            return data.selected
        case .rect(let data):
            return data.selected
        }
    }
    
    var rect: CGRect {
        switch self {
        case .point(let data):
            return CGRect(origin: data.point, size: .zero)
        case .rect(let data):
            return data.rect
        }
    }
    
    var pos: CGPoint {
        switch self {
        case .point(let data):
            return data.point
        case .rect(let data):
            return data.pos
        }
    }
    
    var value: CGFloat {
        switch self {
        case .point(let data):
            return data.value
        case .rect(let data):
            return data.value
        }
    }
    
    var isPlotRectData: Bool {
        switch self {
        case .rect(_ ):
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
        }
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
         selected: Bool = false) {
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
        hasher.combine(point.x)
        hasher.combine(point.y)
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
        let x = rect.origin.x + rect.size.width * 0.5
        let y = rect.origin.y + rect.size.height * 0.5
        return CGPoint(x: x, y: y)
    }
    
    init(seriesIndex: Int,
         categoryIndex: Int,
         value: CGFloat,
         x: CGFloat,
         y: CGFloat,
         width: CGFloat,
         height: CGFloat,
         selected: Bool = false) {
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
        hasher.combine(rect.origin.x)
        hasher.combine(rect.origin.y)
        hasher.combine(rect.size.width)
        hasher.combine(rect.size.height)
    }
}

