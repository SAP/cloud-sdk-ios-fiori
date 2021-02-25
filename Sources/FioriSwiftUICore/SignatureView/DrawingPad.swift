//
//  DrawingPad.swift
//  
//
//  Created by Wirjo, Fred on 2/25/21.
//

import Foundation
import SwiftUI


struct Drawing {
    public var points: [CGPoint] = [CGPoint]()
    
    public var maxX: CGFloat {
        return points.max(by: { $0.x < $1.x })!.x
    }
    
    public var maxY: CGFloat {
        return points.max(by: { $0.y < $1.y })!.y
    }
    
    public var minX: CGFloat {
        return points.min(by: { $0.x < $1.x })!.x
    }
    
    public var minY: CGFloat {
        return points.min(by: { $0.y < $1.y })!.y
    }
}

struct DrawingPad: View {
    @Binding var currentDrawing: Drawing
    @Binding var drawings: [Drawing]
    @Binding var strokeColor: Color
    @Binding var lineWidth: CGFloat
    @Binding var backgroundColor: Color
    
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
                        .onChanged({ (value) in
                            let currentPoint = value.location
                            if currentPoint.y >= 0
                                && currentPoint.y < geometry.size.height {
                                self.currentDrawing.points.append(currentPoint)
                            }
                        })
                        .onEnded({ (value) in
                            self.drawings.append(self.currentDrawing)
                            self.currentDrawing = Drawing()
                        })
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private func add(drawing: Drawing, toPath path: inout Path) {
        let points = drawing.points
        if points.count > 1 {
            for i in 0..<points.count-1 {
                let current = points[i]
                let next = points[i+1]
                path.move(to: current)
                path.addLine(to: next)
            }
        }
    }
    
}
