//
//  PointsShape.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/30/20.
//

import SwiftUI

struct PointsShape: Shape {
    let model: ChartModel
    let seriesIndex: Int
    let categoryIndexRange: ClosedRange<Int>
    
    // min and max value for the display range
    let displayRange: ClosedRange<CGFloat>
    let layoutDirection: LayoutDirection
    let radius: CGFloat
    /// Allowed gap between dots before they run into eachother and are hidden.
    let gap: CGFloat
    let startOffset: CGFloat
    let endOffset: CGFloat
    
    public init(model: ChartModel, seriesIndex: Int, categoryIndexRange: ClosedRange<Int>, displayRange: ClosedRange<CGFloat>, layoutDirection: LayoutDirection = .leftToRight, radius: CGFloat = 2, gap: CGFloat = 2, startOffset: CGFloat = 0, endOffset: CGFloat = 0) {
        self.model = model
        self.seriesIndex = seriesIndex
        self.categoryIndexRange = categoryIndexRange
        
        self.layoutDirection = layoutDirection
        self.radius = radius
        self.gap = gap
        self.startOffset = startOffset
        self.endOffset = endOffset
        self.displayRange = displayRange
    }
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        
        if seriesIndex < 0 || seriesIndex >= model.numOfSeries() || categoryIndexRange.upperBound < 0 {
            return path
        }
        
        let stepWidth = (rect.size.width - startOffset + endOffset) / CGFloat(max(categoryIndexRange.count - 1, 1))
        var lastPoint = CGPoint(x: -2 * radius - gap, y: 0)
        let range: CGFloat = abs(displayRange.upperBound - displayRange.lowerBound) <= 0.000001 ? 1 : displayRange.upperBound - displayRange.lowerBound
        
        for i in 0 ..< categoryIndexRange.count {
            let dataVal = ChartUtility.dimensionValue(model, seriesIndex: seriesIndex, categoryIndex: i + categoryIndexRange.lowerBound, dimensionIndex: 0)
            
            if let tmpVal = dataVal { // cur point is not nil
                let val = rect.size.height - (CGFloat(tmpVal) - displayRange.lowerBound) * rect.size.height / range
                let p = CGPoint(x: ChartUtility.xPos(startOffset + stepWidth * CGFloat(i), layoutDirection: layoutDirection, width: rect.size.width),
                                y: val)
                
                if p.x >= 0 && p.x <= rect.size.width && distance(p1: lastPoint, p2: p) >= (2 * radius + gap) {
                    path.move(to: p)
                    path.addRelativeArc(center: p, radius: radius, startAngle: Angle(degrees: 0), delta: Angle(degrees: 360))
                    lastPoint = p
                }
            }
        }
        
        return path
    }
    
    func distance(p1: CGPoint, p2: CGPoint) -> CGFloat {
        return CGFloat(sqrt((p1.x - p2.x) * (p1.x - p2.x) + (p1.y - p2.y) * (p1.y - p2.y)))
    }
}
