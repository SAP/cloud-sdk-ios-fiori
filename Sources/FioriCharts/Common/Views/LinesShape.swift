import SwiftUI

struct LinesShape: Shape {
    let model: ChartModel
    let seriesIndex: Int
    let categoryIndexRange: ClosedRange<Int>

    // min and max value for the display range
    let displayRange: ClosedRange<CGFloat>
    let layoutDirection: LayoutDirection
    let fill: Bool
    let curve: Bool
    let startOffset: CGFloat
    let endOffset: CGFloat
    let baselinePosition: CGFloat
    
    public init(model: ChartModel, seriesIndex: Int, categoryIndexRange: ClosedRange<Int>, displayRange: ClosedRange<CGFloat>, layoutDirection: LayoutDirection = .leftToRight, fill: Bool = false, baselinePosition: CGFloat = 0, curve: Bool = false, startOffset: CGFloat = 0, endOffset: CGFloat = 0) {
        self.model = model
        self.seriesIndex = seriesIndex
        self.categoryIndexRange = categoryIndexRange
        
        self.layoutDirection = layoutDirection
        self.fill = fill
        self.curve = curve
        self.startOffset = startOffset
        self.endOffset = endOffset
        self.baselinePosition = baselinePosition
        self.displayRange = displayRange
    }
    
    // swiftlint:disable cyclomatic_complexity
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        
        if self.seriesIndex < 0 || self.seriesIndex >= self.model.numOfSeries() || self.categoryIndexRange.upperBound < 0 {
            return path
        }

        let stepWidth = (rect.size.width - self.startOffset + self.endOffset) / CGFloat(max(self.categoryIndexRange.count - 1, 1))
        var prevPt: CGPoint?
        let fillOrigY: CGFloat = rect.size.height * (1.0 - self.baselinePosition)
        
        var subPath: Path?
        
        for i in 0 ..< self.categoryIndexRange.count {
            let dataVal = ChartUtility.dimensionValue(self.model, seriesIndex: self.seriesIndex, categoryIndex: i + self.categoryIndexRange.lowerBound, dimensionIndex: 0)
            if let tmpVal = dataVal { // cur point is not nil
                let val = self.yPosition(from: tmpVal, in: rect)
                let x = ChartUtility.xPos(self.startOffset + stepWidth * CGFloat(i), layoutDirection: self.layoutDirection, width: rect.size.width)
                let p2 = CGPoint(x: x, y: val)
                
                // prev point is not nil
                if let p1 = prevPt {
                    if self.curve {
                        let midPoint = CGPoint.midPoint(p1: p1, p2: p2)
                        subPath?.addQuadCurve(to: midPoint, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p1))
                        subPath?.addQuadCurve(to: p2, control: CGPoint.controlPointForPoints(p1: midPoint, p2: p2))
                    } else {
                        subPath?.addLine(to: p2)
                    }
                } else { // prev point is nil
                    subPath = Path()
                    
                    if self.fill {
                        subPath?.move(to: CGPoint(x: x, y: fillOrigY))
                        subPath?.addLine(to: p2)
                    } else {
                        subPath?.move(to: p2)
                    }
                }
                
                prevPt = p2
            } else { // cur point is nil
                if let p1 = prevPt { // prev point is not nil
                    if self.fill {
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
        
        if self.fill, let p1 = prevPt { // prev point is not nil
            subPath?.addLine(to: CGPoint(x: p1.x, y: fillOrigY))
            subPath?.closeSubpath()
        }
        
        if let tmpPath = subPath {
            path.addPath(tmpPath)
        }
        
        return path
    }
    
    func yPosition(from val: CGFloat, in rect: CGRect) -> CGFloat {
        if self.displayRange.upperBound == self.displayRange.lowerBound {
            return 0
        } else {
            return rect.size.height - (val - self.displayRange.lowerBound) * rect.size.height / (self.displayRange.upperBound - self.displayRange.lowerBound)
        }
    }
}

extension CGPoint {
    static func midPoint(p1: CGPoint, p2: CGPoint) -> CGPoint {
        CGPoint(
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
