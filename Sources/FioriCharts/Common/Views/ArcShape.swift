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
}

struct ArcShape_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ArcShape(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90))
                .strokeBorder(Color.red)
                .frame(width: 200, height: 200)
                .previewLayout(.sizeThatFits)
            
            ArcShape(startAngle: Angle(degrees: 20), endAngle: Angle(degrees: 360))
                .strokeBorder(Color.red, lineWidth: 40)
                .frame(width: 200, height: 200)
                .previewLayout(.sizeThatFits)
            
//            ArcShape(startAngle: Angle(degrees: 20), endAngle: Angle(degrees: 360))
//                .stroke(Color.red, lineWidth: 40)
//                .frame(width: 200, height: 200)
//                .previewLayout(.sizeThatFits)
            
            ArcShape(startAngle: Angle(degrees: 20), endAngle: Angle(degrees: 270), clockwise: false)
                .strokeBorder(Color.red, lineWidth: 100)
                .frame(width: 200, height: 200)
                .previewLayout(.sizeThatFits)
            
            ArcShape(startAngle: Angle(degrees: 20), endAngle: Angle(degrees: 21))
                .strokeBorder(Color.red, lineWidth: 40)
                .frame(width: 200, height: 200)
                .previewLayout(.sizeThatFits)
        }
    }
}
