//
//  LinesShapeView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 2/26/20.
//

import SwiftUI

public struct LinesShape: Shape {
    let points: [CGFloat?]
    
    // min and max value for the display range
    let displayRange: ClosedRange<CGFloat>
    let layoutDirection: LayoutDirection
    let fill: Bool
    let curve: Bool
    let startOffset: CGFloat
    let endOffset: CGFloat
    let baselinePosition: CGFloat
    
    public init(points: [CGFloat?], displayRange: ClosedRange<CGFloat>? = nil, layoutDirection: LayoutDirection = .leftToRight, fill: Bool = false, baselinePosition: CGFloat = 0, curve: Bool = false, startOffset: CGFloat = 0, endOffset: CGFloat = 0) {
        self.points = points
        
        self.layoutDirection = layoutDirection
        self.fill = fill
        self.curve = curve
        self.startOffset = startOffset
        self.endOffset = endOffset
        self.baselinePosition = baselinePosition
        
        if let range = displayRange {
            self.displayRange = range
        } else {
            let compactPoints = points.compactMap { $0 }
            let minValue = CGFloat(compactPoints.min() ?? 0)
            let maxValue = CGFloat(compactPoints.max() ?? CGFloat((minValue + 1)))
            self.displayRange = minValue ... maxValue
        }
    }
    
    // swiftlint:disable cyclomatic_complexity
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        
        if points.isEmpty {
            return path
        }
        
        let data: [CGFloat?] = points.map {
            if let val = $0 {
                return yPosition(from: val, in: rect)
            } else {
                return nil
            }
        }

        let stepWidth = (rect.size.width - startOffset + endOffset) / CGFloat(max(data.count - 1, 1))
        var prevPt: CGPoint? = nil
        let fillOrigY: CGFloat = rect.size.height * (1.0 - baselinePosition)
        
        var subPath: Path? = nil
        
        for i in 0 ..< data.count {
            if let val = data[i] { // cur point is not nil
                let x = ChartUtility.xPos(startOffset + stepWidth * CGFloat(i), layoutDirection: layoutDirection, width: rect.size.width)
                let p2 = CGPoint(x: x, y: val)
                
                // prev point is not nil
                if let p1 = prevPt {
                    if curve {
                        let midPoint = CGPoint.midPoint(p1: p1, p2: p2)
                        subPath?.addQuadCurve(to: midPoint, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p1))
                        subPath?.addQuadCurve(to: p2, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p2))
                    } else {
                        subPath?.addLine(to: p2)
                    }
                } else { // prev point is nil
                    subPath = Path()
                    
                    if fill {
                        subPath?.move(to: CGPoint(x: x, y: fillOrigY))
                        subPath?.addLine(to: p2)
                    } else {
                        subPath?.move(to: p2)
                    }
                }
                
                prevPt = p2
            } else { // cur point is nil
                if let p1 = prevPt { // prev point is not nil
                    if fill {
                        subPath?.addLine(to: CGPoint(x: p1.x, y: fillOrigY))
                        subPath?.closeSubpath()
                    }
                    
                    // finish the sub path
                    if let tmpPath = subPath {
                        path.addPath(tmpPath)
                    }
                    subPath = nil
                }
                
                prevPt = nil
            }
        }
        
        if fill, let p1 = prevPt { // prev point is not nil
            subPath?.addLine(to: CGPoint(x: p1.x, y: fillOrigY))
            subPath?.closeSubpath()
        }
        
        if let tmpPath = subPath {
            path.addPath(tmpPath)
        }
        
        return path
    }
    
    func yPosition(from val: CGFloat, in rect: CGRect) -> CGFloat {
        if displayRange.upperBound == displayRange.lowerBound {
            return 0
        } else {
            return rect.size.height - (val - displayRange.lowerBound) * rect.size.height / (displayRange.upperBound - displayRange.lowerBound)
        }
    }
}

extension CGPoint {
    static func midPoint(p1: CGPoint, p2: CGPoint) -> CGPoint {
        return CGPoint(
            x: p1.x + (p2.x - p1.x) / 2,
            y: p1.y + (p2.y - p1.y) / 2
        )
    }
    
    static func controlPointForPoints(p1: CGPoint, p2: CGPoint) -> CGPoint {
        var controlPoint = CGPoint.midPoint(p1: p1, p2: p2)
        let diffY = abs(p2.y - controlPoint.y)
        
        if p1.y < p2.y {
            controlPoint.y += diffY
        } else if p1.y > p2.y {
            controlPoint.y -= diffY
        }
        return controlPoint
    }
}

struct LinesShape_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LinesShape(points: [600, 700, 650, 750, 720])
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 3))
                .frame(width: 400, height: 200)
                .previewLayout(.sizeThatFits)
            
            LinesShape(points: [600, 700, nil, 750, 720, -200, -100], fill: true)
            .fill(LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom))
            .frame(width: 400, height: 200)
            .previewLayout(.sizeThatFits)
            
            // pan left 10 points
            LinesShape(points: [600, 700, 650, 750, 720, 720], startOffset: -10.0, endOffset: 90.0)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 3))
                .frame(width: 400, height: 200)
                .previewLayout(.sizeThatFits)
            
            // pan left 10 points
            LinesShape(points: [600, 700, 650, 750, 720, 720], startOffset: 20.0, endOffset: -20.0)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 3))
                .frame(width: 400, height: 200)
                .previewLayout(.sizeThatFits)
            
            LinesShape(points: [200], curve: true)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 3))
                .frame(width: 300, height: 200)
                .previewLayout(.sizeThatFits)
            
            LinesShape(points: [600, 700, 650, 750, 720, 720], curve: true)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 3))
                .frame(width: 400, height: 200)
                .previewLayout(.sizeThatFits)
            
            LinesShape(points: [600, 700, 650, 750, 720, 720], curve: true, startOffset: -20, endOffset: 80)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 3))
                .frame(width: 400, height: 200)
                .previewLayout(.sizeThatFits)
            
            LinesShape(points: [600, 700, 650, 750], displayRange: 0...800)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 3))
                .frame(width: 400, height: 200)
                .previewLayout(.sizeThatFits)
            
            LinesShape(points: [600, 700, 650, 750], fill: true, curve: false)
                .fill(LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom))
                .frame(width: 300, height: 200)
                .previewLayout(.sizeThatFits)
            
            LinesShape(points: [600, 700, 650, 750], fill: true, curve: true)
                .fill(LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .top, endPoint: .bottom))
                .frame(width: 300, height: 200)
                .previewLayout(.sizeThatFits)
        }
    }
}
