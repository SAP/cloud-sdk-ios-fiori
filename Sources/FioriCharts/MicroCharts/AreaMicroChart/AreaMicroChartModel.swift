//
//  AreaMicroChartModel.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/11/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import Foundation
import SwiftUI

public class AreaMicroChartModel: ObservableObject, Identifiable {
    @Published public var firstXLabel: Text?
    @Published public var lastXLabel: Text?
    @Published public var firstYLabel: Text?
    @Published public var lastYLabel: Text?
    @Published public var minLabel: Text?
    @Published public var maxLabel: Text?
    
    @Published var chartPoints: Item?
    @Published var targetPoints: Item?
    @Published var maxThreshold: Item?
    @Published var minThreshold: Item?
    @Published var innerMaxThreshold: Item?
    @Published var innerMinThreshold: Item?
    
    let boundary: CGRect
    public let id = UUID()

    init(firstXLabel: Text? = nil, lastXLabel: Text? = nil, firstYLabel: Text? = nil, lastYLabel: Text? = nil, minLabel: Text? = nil, maxLabel: Text? = nil, chartPoints: Item? = nil, targetPoints: Item? = nil, minThreshold: Item? = nil, maxThreshold: Item? = nil, innerMinThreshold: Item? = nil, innerMaxThreshold: Item? = nil, minXValue: CGFloat? = nil, maxXValue: CGFloat? = nil, minYValue: CGFloat? = nil, maxYValue: CGFloat? = nil) {
        self.firstXLabel = firstXLabel
        self.lastXLabel = lastXLabel
        self.firstYLabel = firstYLabel
        self.lastYLabel = lastYLabel
        self.minLabel = minLabel
        self.maxLabel = maxLabel
        self.chartPoints = chartPoints
        self.targetPoints = targetPoints
        self.minThreshold = minThreshold
        self.maxThreshold = maxThreshold
        self.innerMinThreshold = innerMinThreshold
        self.innerMaxThreshold = innerMaxThreshold
        
        let b = [chartPoints?.points, targetPoints?.points, minThreshold?.points, maxThreshold?.points, innerMinThreshold?.points, innerMaxThreshold?.points]
            .compactMap({ $0 })
            .flatMap ({ $0 })
            .boundingBox()
        
        let originX = minXValue ?? b.minX
        let originY = minYValue ?? b.minY
        let width = maxXValue ?? b.maxX - originX
        let height = maxYValue ?? b.maxY - originY
        
        self.boundary = CGRect(x: originX, y: originY, width: width, height: height)
    }
    
    // MARK: - chart item
    struct Item: View {
        
        let itemType: Path.ChartItemType
        let color: Color
        let title: String?
        var points: [CGPoint]
        
        @Environment(\.chartBoundingBox) private var chartBoundingBox: CGRect
        
        var body: some View {
            GeometryReader { proxy in
                
                if Array<Path.ChartItemType>([.minFill, .maxFill, .innerMaxFill, .innerMinFill]).contains(self.itemType) {
                    self.points.path(in: proxy.size, chartItemType: self.itemType, boundingBox: self.chartBoundingBox)
                        .fill()
                        .foregroundColor(self.color)
                    
                } else {
                    self.points.path(in: proxy.size, chartItemType: self.itemType, boundingBox: self.chartBoundingBox)
                        .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .miter, miterLimit: 0, dash: self.itemType == .actual ? [] : [4, 8], dashPhase: 0))
                        .foregroundColor(self.color)
                }
            }
        }
        
        init(_ itemType: Path.ChartItemType = .actual, color: Color = .primary, title: String? = nil, points: [CGPoint]? = nil, minXValue: CGFloat? = nil, maxXValue: CGFloat? = nil, minYValue: CGFloat? = nil, maxYValue: CGFloat? = nil) {
            self.itemType = itemType
            self.color = color
            self.title = title
            self.points = points ?? []
        }
    }
}
