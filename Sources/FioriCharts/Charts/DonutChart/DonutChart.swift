//
//  DonutChart.swift
//  FioriSwiftUI
//
//  Created by Xu, Sheng on 2/24/20.
//

import SwiftUI

struct DonutChart: View {
    @EnvironmentObject var model: ChartModel
    
    var body: some View {
        GeometryReader { proxy in
            self.chartView(in: proxy.size)
        }
    }
    
    func chartView(in size: CGSize) -> some View {
        let diameter = min(size.width, size.height)
        // 1pt gap -> degree of gap between segments
        let GAP: Double = 360.0 / (Double(diameter) * Double.pi)
        
        // depth
        let depth: CGFloat = diameter * (126.0 - 76.0) / ( 2.0 * 126.0)
        
        let segments: [MicroChartDataItem] = model.dataItemsIn(seriesIndex: 0)
        let count = segments.count
        let total = segments.reduce(into: 0) { (val, segment) in
            val += Double(segment.value)
        }
        
        let totalDegree: Double = count > 1 ? 360 - Double(count) * GAP : 360
        
        var startAngles: [Double] = Array(repeating: 0, count: count)
        var endAngles: [Double] = Array(repeating: 0, count: count)
        for i in 0 ..< count {
            if i > 0 {
                startAngles[i] = endAngles[i-1] + GAP
            }

            endAngles[i] = startAngles[i] + Double(segments[i].value) * totalDegree / total
        }
        
        return HStack(alignment: .center) {
            if segments.isEmpty {
                NoDataView()
            } else {
                ZStack {
                    ForEach(0 ..< count) { i in
                        ArcShape(startAngle: Angle(degrees: startAngles[i]), endAngle: Angle(degrees: endAngles[i]))
                            .strokeBorder(segments[i].color, lineWidth: depth)
                            .frame(width: diameter, height: diameter)
                    }
                }
            }
        }
    }
}

struct DonutChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.donutModels) {
                DonutChart()
                    .environmentObject($0)
                    .frame(width: 200, height: 200)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
