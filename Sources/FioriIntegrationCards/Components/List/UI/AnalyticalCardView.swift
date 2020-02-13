//
//  AnalyticsCardView.swift
//  AnyCodable
//
//  Created by Wirjo, Fred on 2/10/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

public struct AnalyticalCardView: View {
    
    var model: AnalyticalCard
      
    public init(model: AnalyticalCard) {
        self.model = model
    }
    
    public var body: some View {
        let title = model.header?.title
        let subtitle = model.header?.subTitle
        let unitOfMeasurement = model.header?.unitOfMeasurement
        let trend = model.header?.mainIndicator?.trend
        let mainNumber = model.header?.mainIndicator?.number
        let mainUnit = model.header?.mainIndicator?.unit
        let targetNum = model.header?.sideIndicators?[0].number
        let targetUnit = model.header?.sideIndicators?[0].unit
        let deviationNum = model.header?.sideIndicators?[1].number
        let deviationUnit = model.header?.sideIndicators?[1].unit
        let details = model.header?.details
        
        return Group {
            VStack(alignment: .leading) {
                
                SafeText(title).font(.headline)
                HStack {
                    SafeText(subtitle).foregroundColor(Color.gray)
                    SafeText(" | ").foregroundColor(Color.gray)
                    SafeText(unitOfMeasurement).foregroundColor(Color.gray)
                }
                HStack {
                    SafeText(mainNumber).foregroundColor(Color.getTrendColor(trend: trend))
                        .font(.system(size: 40)).fixedSize(horizontal: false, vertical: true)
                    VStack {
                        PolygonShape(sides: 3).fill(Color.getTrendColor(trend: trend)).frame(width: 15, height: 15).rotationEffect(.degrees(90))
                        SafeText(mainUnit)
                    }.padding(.trailing, 50)
                    
                    VStack {
                        SafeText("Target").foregroundColor(Color.gray)
                        HStack {
                            SafeText(targetNum)
                            SafeText(targetUnit)
                        }
                    }.padding(.trailing, 10)
                    
                    VStack {
                        SafeText("Deviation").foregroundColor(Color.gray)
                        HStack {
                            SafeText(deviationNum)
                            SafeText(deviationUnit)
                        }
                    }
                }.padding(.bottom, 10)
                SafeText(details).foregroundColor(Color.gray).font(.system(size: 15))
            }
        }
    }
}

struct PolygonShape: Shape {
    var sides: Int
    
    func path(in rect: CGRect) -> Path {
        // hypotenuse
        let h = Double(min(rect.size.width, rect.size.height)) / 2.0
        
        // center
        let c = CGPoint(x: rect.size.width / 2.0, y: rect.size.height / 2.0)
        
        var path = Path()
                
        for i in 0..<sides {
            let angle = (Double(i) * (360.0 / Double(sides))) * Double.pi / 180

            // Calculate vertex position
            let pt = CGPoint(x: c.x + CGFloat(cos(angle) * h), y: c.y + CGFloat(sin(angle) * h))
            
            if i == 0 {
                path.move(to: pt) // move to first vertex
            } else {
                path.addLine(to: pt) // draw line to next vertex
            }
        }
        
        path.closeSubpath()
        
        return path
    }
}

