//
//  RadialShape.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/13/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI

struct ArcShape: View {
    let center: CGPoint
    
    // from 0 to 100
    let percentage: CGFloat
    
    // the radius of outer arc
    let radius: CGFloat
    
    // the radius of inner arc
    let innerRadius: CGFloat?
    
    let color: Color
    
    var body: some View {
        path().foregroundColor(color)
    }
    
    func path() -> Path {
        let delta = Double(percentage * 360 / 100)
        let radian = Double(delta - 90) / 360 * Double.pi * 2
        return Path() { path in
            path.addRelativeArc(center: center, radius: radius, startAngle: Angle(degrees: -90), delta: Angle(degrees: delta))
            
            if let innerRadius = innerRadius {
                // x = cx + r * cos(a)
                // y = cy + r * sin(a)
                let x = center.x + innerRadius * CGFloat(cos(radian))
                let y = center.y + innerRadius * CGFloat(sin(radian))
                
                path.addLine(to: CGPoint(x: x, y: y))
                path.addRelativeArc(center: center, radius: innerRadius, startAngle: Angle(degrees: delta - 90), delta: Angle(degrees: -delta))
            }
            else {
                path.addLine(to: center)
            }
            
            path.closeSubpath()
        }
    }
}

struct ArcShape_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ArcShape(center: CGPoint(x: 100, y: 100), percentage: 12, radius: 100, innerRadius: 70, color: .red)
                .frame(width: 200, height: 200, alignment: .topLeading)
                .previewLayout(.sizeThatFits)
            
            ArcShape(center: CGPoint(x: 100, y: 100), percentage: 25, radius: 100, innerRadius: 50, color: .red)
            .frame(width: 200, height: 200, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
            
            ArcShape(center: CGPoint(x: 100, y: 100), percentage: 40, radius: 100, innerRadius: 0, color: .red)
            .frame(width: 200, height: 200, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
            
            ArcShape(center: CGPoint(x: 100, y: 100), percentage: 65, radius: 100, innerRadius: 70, color: .red)
            .frame(width: 200, height: 200, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
            
            ArcShape(center: CGPoint(x: 100, y: 100), percentage: 99, radius: 100, innerRadius: 0, color: .red)
            .frame(width: 200, height: 200, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
            
            ArcShape(center: CGPoint(x: 100, y: 100), percentage: 100, radius: 100, innerRadius: 70, color: .red)
            .frame(width: 200, height: 200, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
        }
    }
}
