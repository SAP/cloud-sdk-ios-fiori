//
//  PolygonMicroChart.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/11/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI

struct PolygonShape: View {
    var points: [CGPoint]
    var color: Color! = .black
    
    var body: some View {
        path().fill(color)
    }
    
    func path() -> Path {
        return Path { path in
            path.move(to: points.first!)
            
            for point in points.dropFirst(){
                path.addLine(to: point)
            }
            
            path.addLine(to: points.first!)
        }
    }
}

struct PolygonShape_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            PolygonShape(points: [.zero, CGPoint(x: 130, y: 20), CGPoint(x: 260, y: 50), CGPoint(x: 180, y: 85), CGPoint(x: 50, y: 80)])
            
            PolygonShape(points: [CGPoint(x: 140, y: 30), CGPoint(x: 300, y: 75), CGPoint(x: 260, y: 90), CGPoint(x: 100, y: 70)], color: .red)
        }
        .frame(width: 320, height: 94, alignment: .topLeading)
        .previewLayout(.fixed(width: 320, height: 94))
    }
}
