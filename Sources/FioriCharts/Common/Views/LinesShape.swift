//
//  LinesShapeView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 2/26/20.
//

import SwiftUI

public struct LinesShape: Shape {
    var points: [Double]
    
    // min and max value for the display range
    var displayRange: ClosedRange<CGFloat>
    var layoutDirection: LayoutDirection
    var fill: Bool = false
    var curve:Bool = false
    var startOffset: CGFloat = 0
    var endOffset: CGFloat = 0
    
    public init(points: [Double], displayRange: ClosedRange<CGFloat>? = nil, layoutDirection: LayoutDirection = .leftToRight, fill: Bool = false, curve: Bool = false, startOffset: CGFloat = 0, endOffset: CGFloat = 0) {
        self.points = points
        
        self.layoutDirection = layoutDirection
        self.fill = fill
        self.curve = curve
        self.startOffset = startOffset
        self.endOffset = endOffset
        
        if let range = displayRange {
            self.displayRange = range
        }
        else {
            let maxValue = CGFloat(points.max() ?? 0)
            let minValue = CGFloat(points.min() ?? 0)
            self.displayRange = minValue ... maxValue
        }
    }
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        
        if points.count == 0 {
            return path
        }
        
        let data = points.map { rect.size.height - (CGFloat($0) - displayRange.lowerBound) * rect.size.height / (displayRange.upperBound - displayRange.lowerBound)}
        
        let stepWidth = (rect.size.width - startOffset + endOffset) / CGFloat(data.count - 1)
        let x = ChartUtility.xPos(startOffset, layoutDirection: layoutDirection, width: rect.size.width)
        var p1 = CGPoint(x: x, y: CGFloat(data[0]))
        if fill {
            path.move(to: CGPoint(x: x, y: rect.size.height))
            path.addLine(to: p1)
        }
        else {
            path.move(to: p1)
        }
        
        if(data.count < 2){
            return path
        }
        
        for i in 1 ..< data.count {
            let p2 = CGPoint(x: ChartUtility.xPos(startOffset + stepWidth * CGFloat(i), layoutDirection: layoutDirection, width: rect.size.width), y: data[i])
            if curve {
                let midPoint = CGPoint.midPoint(p1: p1, p2: p2)
                path.addQuadCurve(to: midPoint, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p1))
                path.addQuadCurve(to: p2, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p2))
            }
            else {
                path.addLine(to: p2)
            }
            
            p1 = p2
        }
        
        if fill {
            path.addLine(to: CGPoint(x: p1.x, y: rect.size.height))
            path.closeSubpath()
        }
        
        return path
    }
}

extension CGPoint {
    static func midPoint(p1:CGPoint, p2:CGPoint) -> CGPoint {
        return CGPoint(
            x: p1.x + (p2.x - p1.x) / 2,
            y: p1.y + (p2.y - p1.y) / 2
        )
    }
    
    static func controlPointForPoints(p1:CGPoint, p2:CGPoint) -> CGPoint {
        var controlPoint = CGPoint.midPoint(p1:p1, p2:p2)
        let diffY = abs(p2.y - controlPoint.y)
        
        if (p1.y < p2.y){
            controlPoint.y += diffY
        } else if (p1.y > p2.y) {
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
            
            // pan left 10 points
            LinesShape(points: [600, 700, 650, 750, 720, 720], startOffset: -10, endOffset: 90)
                .stroke(Color.blue, style: StrokeStyle(lineWidth: 3))
                .frame(width: 400, height: 200)
                .previewLayout(.sizeThatFits)
            
            // pan right 10 points
            LinesShape(points: [600, 600, 700, 650, 750, 720], startOffset: -90, endOffset: 10)
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
