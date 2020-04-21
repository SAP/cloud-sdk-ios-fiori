//
//  PointsShape.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/30/20.
//

import SwiftUI

struct PointsShape: Shape {
    let points: [CGFloat?]
    
    // min and max value for the display range
    let displayRange: ClosedRange<CGFloat>
    let layoutDirection: LayoutDirection
    let radius: CGFloat
    /// Allowed gap between dots before they run into eachother and are hidden.
    let gap: CGFloat
    let startOffset: CGFloat
    let endOffset: CGFloat
    
    public init(points: [CGFloat?], displayRange: ClosedRange<CGFloat>? = nil, layoutDirection: LayoutDirection = .leftToRight, radius: CGFloat = 2, gap: CGFloat = 2, startOffset: CGFloat = 0, endOffset: CGFloat = 0) {
        self.points = points
        
        self.layoutDirection = layoutDirection
        self.radius = radius
        self.gap = gap
        self.startOffset = startOffset
        self.endOffset = endOffset
        
        if let range = displayRange {
            self.displayRange = range
        } else {
            let compactPoints = points.compactMap { $0 }
            let minValue = CGFloat(compactPoints.min() ?? 0)
            let maxValue = CGFloat(compactPoints.max() ?? CGFloat((minValue + 1)))
            self.displayRange = minValue ... maxValue
        }
    }
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        
        if points.count == 0 {
            return path
        }
        
        let data: [CGFloat?] = points.map {
            if let val = $0 {
                return rect.size.height - (CGFloat(val) - displayRange.lowerBound) * rect.size.height / (displayRange.upperBound - displayRange.lowerBound)
            }
            else {
                return nil
            }
        }
        
        let stepWidth = (rect.size.width - startOffset + endOffset) / CGFloat(data.count - 1)
        var lastPoint = CGPoint(x: -gap, y: 0)
        
        for i in 0 ..< data.count {
            if let val = data[i] {
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

struct PointsShape_Previews: PreviewProvider {
    static var previews: some View {
        PointsShape(points: [600, 700, 650, 750, 720])
        .fill(Color.blue)
        .frame(width: 400, height: 200)
        .previewLayout(.sizeThatFits)
    }
}
