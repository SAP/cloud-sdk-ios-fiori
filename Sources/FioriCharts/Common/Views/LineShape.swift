//
//  LineMicroChart.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/11/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI

struct LineShape: View {
    var pos1: CGPoint
    var pos2: CGPoint
    var color: Color
    var width: CGFloat = 1
    var strokeStyle: StrokeStyle?
    
    init(pos1: CGPoint, pos2: CGPoint, color: Color, width: CGFloat = 1, strokeStyle: StrokeStyle? = nil) {
        self.pos1 = pos1
        self.pos2 = pos2
        self.color = color
        self.width = width
        self.strokeStyle = strokeStyle
        
        if strokeStyle == nil {
            self.strokeStyle = StrokeStyle(lineWidth: width)
        }
    }
    
    var body: some View {
        return path().stroke(style: self.strokeStyle!).foregroundColor(color)
    }
    
    func path() -> Path {
        return Path { p in
            p.move(to: pos1)
            p.addLine(to: pos2)
        }
    }
}

struct LineShape_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            LineShape(pos1: CGPoint(x: 28, y: 10), pos2: CGPoint(x: 28, y: 80), color: .green, width: 3)

            LineShape(pos1: CGPoint(x: 30, y: 10), pos2: CGPoint(x: 30, y: 80), color: .black, width: 3)
            
            LineShape(pos1: CGPoint(x: 40, y: 10),
                      pos2: CGPoint(x: 280, y: 80),
                      color: .red, width: 0,
                      strokeStyle: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .miter, miterLimit: 0, dash: [4, 8], dashPhase: 0))
        }
        .frame(width: 312, height: 100, alignment: .center)
        .previewLayout(.sizeThatFits)
    }
}
