//
//  RadialShape.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/13/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI

struct ArcShape: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = true
    var insetAmount: CGFloat = 0
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        
        return arc
    }
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
    
//    let center: CGPoint
//
//    // from 0 to 100
//    let percentage: CGFloat
//
//    // the radius of outer arc
//    let radius: CGFloat
//
//    // the radius of inner arc
//    let innerRadius: CGFloat?
//
//    let color: Color
//
//    var body: some View {
//        path().foregroundColor(color)
//    }
//
//    func path() -> Path {
//        let delta = Double(percentage * 360 / 100)
//        let radian = Double(delta - 90) / 360 * Double.pi * 2
//        return Path() { path in
//            path.addRelativeArc(center: center, radius: radius, startAngle: Angle(degrees: -90), delta: Angle(degrees: delta))
//
//            if let innerRadius = innerRadius {
//                // x = cx + r * cos(a)
//                // y = cy + r * sin(a)
//                let x = center.x + innerRadius * CGFloat(cos(radian))
//                let y = center.y + innerRadius * CGFloat(sin(radian))
//
//                path.addLine(to: CGPoint(x: x, y: y))
//                path.addRelativeArc(center: center, radius: innerRadius, startAngle: Angle(degrees: delta - 90), delta: Angle(degrees: -delta))
//            }
//            else {
//                path.addLine(to: center)
//            }
//
//            path.closeSubpath()
//        }
//    }
}

struct ArcShape_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ArcShape(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90))
                .strokeBorder(Color.red)
                .frame(width: 200, height: 200)
                .previewLayout(.sizeThatFits)
            
            ArcShape(startAngle: Angle(degrees: 20), endAngle: Angle(degrees: 360))
                .strokeBorder(Color.red, lineWidth: 10)
                .frame(width: 200, height: 200)
                .previewLayout(.sizeThatFits)
            
            ArcShape(startAngle: Angle(degrees: 20), endAngle: Angle(degrees: 270), clockwise: false)
                .strokeBorder(Color.red, lineWidth: 40)
                .frame(width: 200, height: 200)
                .previewLayout(.sizeThatFits)
            
            ArcShape(startAngle: Angle(degrees: 20), endAngle: Angle(degrees: 21))
            .strokeBorder(Color.red, lineWidth: 40)
            .frame(width: 200, height: 200)
            .previewLayout(.sizeThatFits)
        }
    }
}
