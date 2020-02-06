//
//  BarMicroChart.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/10/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI

struct BarShape: View {
    // top left
    var origin: CGPoint
    var size: CGSize
    var color: Color
    
    var body: some View {
        path().fill(color)
    }
    
    func path() -> Path {
        //print("Bar: \(origin), \(size)")
        var p = Path()
        
        p.move(to: CGPoint(x: origin.x, y: origin.y))
        p.addLine(to: CGPoint(x: origin.x + size.width, y: origin.y))
        p.addLine(to: CGPoint(x: origin.x + size.width, y: origin.y + size.height))
        p.addLine(to: CGPoint(x: origin.x, y: origin.y + size.height))
        p.closeSubpath()
        
        return p
    }
}

struct BarShape_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            
            BarShape(origin: CGPoint(x: 10, y: 10), size: CGSize(width: 100, height: 30), color: .blue)
            
            BarShape(origin: CGPoint(x: 180, y: 10), size: CGSize(width: 50, height: 60), color: .green)
        }
        .frame(width: 312, height: 100, alignment: .center)
        .previewLayout(.sizeThatFits)
    }
}
