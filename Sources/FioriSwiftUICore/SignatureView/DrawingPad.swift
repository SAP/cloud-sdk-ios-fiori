import Foundation
import SwiftUI

/// Drawing struct used to capture user signature
struct Drawing {
    /// array of points used to track signature
    public var points = [CGPoint]()
    
    /// maximum X value of signature
    public var maxX: CGFloat {
        guard let max = points.max(by: { $0.x < $1.x }) else { return CGFloat.nan }
        return max.x
    }
    
    /// maximum Y value of signature
    public var maxY: CGFloat {
        guard let max = points.max(by: { $0.y < $1.y }) else { return CGFloat.nan }
        return max.y
    }
    
    /// minimum X value of signature
    public var minX: CGFloat {
        guard let min = points.min(by: { $0.x < $1.x }) else { return CGFloat.nan }
        return min.x
    }
    
    /// minimum Y value of signature
    public var minY: CGFloat {
        guard let min = points.min(by: { $0.y < $1.y }) else { return CGFloat.nan }
        return min.y
    }
}

struct DrawingPad: View {
    @Binding var currentDrawing: Drawing
    @Binding var drawings: [Drawing]
    var strokeColor: Color
    var lineWidth: CGFloat
    var backgroundColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                for drawing in self.drawings {
                    self.add(drawing: drawing, toPath: &path)
                }
                self.add(drawing: self.currentDrawing, toPath: &path)
            }
            .stroke(self.strokeColor, lineWidth: self.lineWidth)
            .background(self.backgroundColor)
            .gesture(
                DragGesture(minimumDistance: 0.1)
                    .onChanged { value in
                        let currentPoint = value.location
                        if currentPoint.y >= 0,
                           currentPoint.y < geometry.size.height
                        {
                            self.currentDrawing.points.append(currentPoint)
                        }
                    }
                    .onEnded { _ in
                        self.drawings.append(self.currentDrawing)
                        self.currentDrawing = Drawing()
                    }
            )
        }
        // .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func add(drawing: Drawing, toPath path: inout Path) {
        let points = drawing.points
        if points.count > 1 {
            for i in 0 ..< points.count - 1 {
                let current = points[i]
                let next = points[i + 1]
                path.move(to: current)
                path.addLine(to: next)
            }
        }
    }
}
