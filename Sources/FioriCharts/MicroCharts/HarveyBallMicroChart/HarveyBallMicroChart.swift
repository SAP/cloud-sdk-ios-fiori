//
//  HarveyBallMicroChart.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/13/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI

struct HarveyBallMicroChart: View {
    @ObservedObject var model: ChartModel
    
    // the difference of outer and inner radius range from 5...20
    private static let minDepth: CGFloat = 5
    private static let maxDepth: CGFloat = 20
    
    public init(_ chartModel: ChartModel) {
        self.model = chartModel
    }
    
    
    var body: some View {
        GeometryReader { proxy in
            self.chartView(in: proxy.size)
        }
    }
    
    func chartView(in size: CGSize) -> some View {
        let radius = min(size.width, size.height) / 2
        
        // calculate the difference of outer and inner radius
        let val = radius / 10
        let depth = val > HarveyBallMicroChart.maxDepth ? HarveyBallMicroChart.maxDepth : (val < HarveyBallMicroChart.minDepth ? HarveyBallMicroChart.minDepth : val)
        
        let total = model.dataItemsIn(seriesIndex: 0).first
        let fraction = model.dataItemsIn(seriesIndex: 1).first
        
        return HStack {
            if  fraction != nil && total != nil {
                ZStack {
                    ArcShape(center: CGPoint(x: radius, y: radius), percentage: 100, radius: radius, innerRadius: 0, color: total!.color)
                    ArcShape(center: CGPoint(x: radius, y: radius),
                             percentage: fraction!.value * CGFloat(100) / total!.value,
                             radius: radius - depth,
                             innerRadius: 0,
                             color: fraction!.color)
                }.frame(width: radius * 2, height: radius * 2, alignment: .topLeading)
                
                VStack(alignment: .center) {
                    if fraction!.label != nil {
                        Text(fraction!.label!)
                            .foregroundColor(fraction!.color)
                    }
                    
                    if total!.label != nil {
                        Text(total!.label!)
                            .foregroundColor(total!.color)
                    }
                }
                Spacer()
            }
        }
    }
}

struct HarveyBallMicroChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.harveyBallModels) {
                HarveyBallMicroChart($0)
                    .frame(width: 300, height: 200)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
