//
//  ChartPlotData.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/3/20.
//

import Foundation
import SwiftUI

struct ChartPlotRectData: Identifiable, Hashable {
    let id = UUID()
    
    let seriesIndex: Int
    let categoryIndex: Int
    let value: CGFloat
    let rect: CGRect
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
         height: CGFloat) {
        self.seriesIndex = seriesIndex
        self.categoryIndex = categoryIndex
        self.value = value
        self.rect = CGRect(x: x, y: y, width: width, height: height)
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(rect.origin.x)
        hasher.combine(rect.origin.y)
        hasher.combine(rect.size.width)
        hasher.combine(rect.size.height)
    }
}
