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
    @Environment(\.colorScheme) var colorScheme
    
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
        let fraction = model.dataItemsIn(seriesIndex: 0).last
        
        return HStack {
            if  fraction != nil && total != nil {
                Spacer()
                ZStack(alignment: .center) {
                    ArcShape(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360))
                        .strokeBorder(total!.color.color(self.colorScheme), lineWidth: radius)
                        .frame(width: radius * 2, height: radius * 2)
                    
                    ArcShape(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: Double(fraction!.value) * 360 / Double(total!.value)))
                        .strokeBorder(fraction!.color.color(self.colorScheme), lineWidth: (radius - depth))
                    .frame(width: (radius - depth) * 2, height: (radius - depth) * 2)
                }
                
                VStack(alignment: .center) {
                    if fraction!.label != nil {
                        Text(fraction!.label!)
                            .foregroundColor(fraction!.color.color(self.colorScheme))
                    }
                    
                    if total!.label != nil {
                        Text(total!.label!)
                            .foregroundColor(total!.color.color(self.colorScheme))
                    }
                }
                Spacer()
            }
            else {
                NoDataView()
            }
        }
    }
}

struct HarveyBallMicroChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.harveyBallModels) {
                HarveyBallMicroChart($0)
                    .frame(width: 400, height: 200)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
