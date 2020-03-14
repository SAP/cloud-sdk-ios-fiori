//
//  RadialMicroChart.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/13/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI

struct RadialMicroChart: View {
    enum Mode: Int, CaseIterable {
        case inside
        case rightSide
    }
    
    @ObservedObject var model: ChartModel
    @State var mode: RadialMicroChart.Mode? = .inside
    
    // the difference of outer and inner radius range from 5...20
    private static let minDepth: CGFloat = 5
    private static let maxDepth: CGFloat = 20
    
    init(_ chartModel: ChartModel) {
        self.model = chartModel
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.arcView(in: proxy.size)
        }
    }
    
    func arcView(in size: CGSize) -> some View {
        let percentage = model.dataItemsIn(seriesIndex: 0).first
        
        let str = String(format: "%.1f%%", percentage?.value ?? 0)
        
        return HStack(alignment: .center, spacing: 4) {
            if percentage == nil {
                NoDataView()
            }
            else {
                Spacer()
                ZStack {
                    self.chartView(in: size, percentage: percentage!)
                    if mode == .inside {
                        Text(str)
                            .font(Font.system(.largeTitle))
                            .foregroundColor(percentage!.color)
                    }
                }
                Spacer()
//                if mode == .rightSide {
//                    Text(str)
//                        .font(Font.system(.largeTitle))
//                        .foregroundColor(model.percentage.color)
//                }
            }
        }
    }
    
    func chartView(in size: CGSize, percentage: MicroChartDataItem) -> some View {
        let radius = min(size.width, size.height) / 2
        
        // calculate the difference of outer and inner radius
        let val = radius / 10
        let depth = val > RadialMicroChart.maxDepth ? RadialMicroChart.maxDepth : (val < RadialMicroChart.minDepth ? RadialMicroChart.minDepth : val)
        
        return ZStack {
            ArcShape(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360))
                .strokeBorder(Color.gray, lineWidth: depth)
            ArcShape(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: Double(percentage.value) * 360 / 100))
                .strokeBorder(percentage.color, lineWidth: depth)
        }.frame(width: radius * 2, height: radius * 2, alignment: .topLeading)
    }
}

struct RadialMicroChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.radialModels) {
                RadialMicroChart($0)
                    .frame(height: 200, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
