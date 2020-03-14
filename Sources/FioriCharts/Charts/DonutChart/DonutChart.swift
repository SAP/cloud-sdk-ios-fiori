//
//  DonutChart.swift
//  FioriSwiftUI
//
//  Created by Xu, Sheng on 2/24/20.
//

import SwiftUI

struct DonutChart: View {
    @ObservedObject var model: ChartModel
    
    // degree of gap between segments
    let GAP: Double = 0.5
    
    init(_ chartModel: ChartModel) {
        self.model = chartModel
    }
    
    
    var body: some View {
        GeometryReader { proxy in
            self.chartView(in: proxy.size)
        }
    }
    
    func chartView(in size: CGSize) -> some View {
        let diameter = min(size.width / 2, size.height)
    
        // depth
        let depth = diameter / 5
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
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
            if count == 0 {
                NoDataView()
            }
            else {
                ZStack {
                    ForEach(0 ..< count) { i in
                        ArcShape(startAngle: Angle(degrees: startAngles[i]), endAngle: Angle(degrees: endAngles[i]))
                            .strokeBorder(segments[i].color ?? Color.gray, lineWidth: depth)
                            .frame(width: diameter, height: diameter)
                    }
                }
                
                VStack(alignment: .center) {
                    Spacer()
                    ForEach(0 ..< count) { i in
                        HStack {
                            Circle()
                                .fill(segments[i].color ?? Color.gray)
                                .frame(width: 12, height: 12)
                            Text(segments[i].label ?? "hello")
                                .font(.body)
                            Spacer()
                            Text(numberFormatter.string(from: segments[i].value as NSNumber) ?? "")
                                .font(.body)
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct DonutChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.donutModels) {
                DonutChart($0)
                    .frame(width: 400, height: 200)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
