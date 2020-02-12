//
//  TimelineItemView.swift
//  DevTest
//
//  Created by Ma, Xiao on 2/4/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct TimelineItemView: View {
    
    var model: TimelineItem
    
    let isLast: Bool
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            VStack {
                Rectangle()
                    .stroke()
                    .frame(width: 26 , height: 26, alignment: .top)
                if !isLast {
                    VerticalLine()
                        .stroke(Color.gray, lineWidth: 0.6)
                }
            }
            .fixedSize(horizontal: true, vertical: false)
            .padding(EdgeInsets(top: 6, leading: 6, bottom: 0, trailing: 20))
            
            VStack(alignment: .leading, spacing: 0) {
                SafeText(model.title).font(.body)
                SafeText(model.dateTime).font(.footnote).foregroundColor(.gray)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 0))
                SafeText(model.description).font(.body)
            }
            .padding(8)
            .overlay(Bubble())
        }
    }
}

struct VerticalLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let startPoint: CGPoint = CGPoint(x: (rect.minX + rect.maxX)/2, y: rect.minY)
        let endPoint: CGPoint   = CGPoint(x: (rect.minX + rect.maxX)/2, y: rect.maxY)
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        return path
    }
}

struct Bubble: View {
    var body: some View {
        BubbleShape(cornerRadius: 3)
            .stroke(Color.gray, style: StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .round, miterLimit: 0, dash: [], dashPhase: 0))
    }
}

struct BubbleShape: Shape {
    
    let cornerRadius: CGFloat
    let triangleSide: CGFloat
    
    init(cornerRadius: CGFloat = 3, sideLength: CGFloat = 10) {
        self.cornerRadius = cornerRadius
        self.triangleSide = sideLength
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let leftTop: CGPoint        = CGPoint(x: rect.minX + self.cornerRadius, y: rect.minY + self.cornerRadius)
        let rightTop: CGPoint       = CGPoint(x: rect.maxX - self.cornerRadius, y: rect.minY + self.cornerRadius)
        let rightBottom: CGPoint    = CGPoint(x: rect.maxX - self.cornerRadius, y: rect.maxY - self.cornerRadius)
        let leftBottom: CGPoint     = CGPoint(x: rect.minX + self.cornerRadius, y: rect.maxY - self.cornerRadius)
        
        let triangleTop: CGPoint    = CGPoint(x: rect.minX, y: rect.minY + self.cornerRadius + self.triangleSide)
        let triangleBottom: CGPoint = CGPoint(x: rect.minX, y: rect.minY + self.cornerRadius + self.triangleSide * 3)
        let triangleLeft: CGPoint   = CGPoint(x: rect.minX - self.triangleSide, y: rect.minY + self.cornerRadius + self.triangleSide * 2)
        
        // draw rounded rectangle, closewise
        path.addArc(center: leftTop, radius: self.cornerRadius, startAngle: .radians(.pi), endAngle: .radians(-.pi/2), clockwise: false)
        path.addArc(center: rightTop, radius: self.cornerRadius, startAngle: .radians(-.pi/2), endAngle: .radians(0), clockwise: false)
        path.addArc(center: rightBottom, radius: self.cornerRadius, startAngle: .radians(0), endAngle: .radians(.pi/2), clockwise: false)
        path.addArc(center: leftBottom, radius: self.cornerRadius, startAngle: .radians(.pi/2), endAngle: .radians(.pi), clockwise: false)
        
        // draw triangle
        path.addLine(to: triangleBottom)
        path.addLine(to: triangleLeft)
        path.addLine(to: triangleTop)
        
        path.closeSubpath()
        
        return path
    }
}
