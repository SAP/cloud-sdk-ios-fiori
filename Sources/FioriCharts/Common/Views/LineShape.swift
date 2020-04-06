//
//  LineMicroChart.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/11/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI

public struct LineShape: Shape {
    var pos1: CGPoint
    var pos2: CGPoint
    
    var layoutDirection: LayoutDirection = .leftToRight
    //    var color: Color
    //    var width: CGFloat = 1
    //    var strokeStyle: StrokeStyle?
    //
    //    init(pos1: CGPoint, pos2: CGPoint, color: Color, width: CGFloat = 1, strokeStyle: StrokeStyle? = nil) {
    //        self.pos1 = pos1
    //        self.pos2 = pos2
    //        self.color = color
    //        self.width = width
    //        self.strokeStyle = strokeStyle
    //
    //        if strokeStyle == nil {
    //            self.strokeStyle = StrokeStyle(lineWidth: width)
    //        }
    //    }
    
    public func path(in rect: CGRect) -> Path {
        return Path { p in
            p.move(to: CGPoint(x: ChartUtility.xPos(pos1.x, layoutDirection: layoutDirection, width: rect.size.width), y: pos1.y))
            p.addLine(to: CGPoint(x: ChartUtility.xPos(pos2.x, layoutDirection: layoutDirection, width: rect.size.width), y: pos2.y))
        }
    }
    
    //    var body: some View {
    //        return path().stroke(style: self.strokeStyle!).foregroundColor(color)
    //    }
    //
    //    func path() -> Path {
    //        return Path { p in
    //            p.move(to: pos1)
    //            p.addLine(to: pos2)
    //        }
    //    }
}

struct LineShape_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                LineShape(pos1: CGPoint(x: 28, y: 10), pos2: CGPoint(x: 28, y: 80))
                    .stroke(Color.green, lineWidth: 3)
                
                LineShape(pos1: CGPoint(x: 30, y: 10), pos2: CGPoint(x: 30, y: 80))
                    .stroke(Color.blue, lineWidth: 2)
                
                LineShape(pos1: CGPoint(x: 40, y: 10),
                          pos2: CGPoint(x: 280, y: 80))
                    .stroke(Color.red, style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .miter, miterLimit: 0, dash: [1, 4], dashPhase: 0))
            }
            .frame(width: 320, height: 100, alignment: .center)
            .previewLayout(.sizeThatFits)
            
            ZStack(alignment: .topLeading) {
                LineShape(pos1: CGPoint(x: 0, y: 0), pos2: CGPoint(x: 0, y: 100))
                    .stroke(Color.red, lineWidth: 5)
                //.frame(width: 10, height: 80)
                .offset(x: 2, y: 0)
                
                LineShape(pos1: CGPoint(x: 0, y: 0), pos2: CGPoint(x: 0, y: 100))
                    .stroke(Color.green, lineWidth: 5)
                .offset(x: 150, y: 0)
                
                LineShape(pos1: CGPoint(x: 0, y: 0), pos2: CGPoint(x: 0, y: 100))
                    .stroke(Color.blue, lineWidth: 5)
                .offset(x: 300, y: 0)
                
                LineShape(pos1: CGPoint(x: 0, y: 0), pos2: CGPoint(x: 300, y: 0))
                    .stroke(Color.red, lineWidth: 5)
                .offset(x: 0, y: 0)
                
                LineShape(pos1: CGPoint(x: 0, y: 0), pos2: CGPoint(x: 300, y: 0))
                    .stroke(Color.red, lineWidth: 5)
                .offset(x: 0, y: 50)
                
                LineShape(pos1: CGPoint(x: 0, y: 0), pos2: CGPoint(x: 300, y: 0))
                    .stroke(Color.red, lineWidth: 5)
                .offset(x: 0, y: 100)
                
            }
            .frame(width: 300, height: 100, alignment: .center)
            .previewLayout(.sizeThatFits)
        }
    }
}
