//
//  LineChart.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/13/20.
//

import SwiftUI

struct LineChart: View {
    @ObservedObject var model: ChartModel
    @Environment(\.colorScheme) var colorScheme
    let axisDataSource = DefaultAxisDataSource()
    
    public init(_ chartModel: ChartModel) {
        self.model = chartModel
    }
    
    var body: some View {
        var data: [[Double]] = []
        for series in model.data {
            var s: [Double] = []
            for dim in series {
                if let val = dim.first {
                    s.append(val)
                }
            }
            data.append(s)
        }
        let xAxisHeight:CGFloat = 24
        let yAxisWidth:CGFloat = 20
        
        return GeometryReader { proxy in
            ZStack {
                ForEach(0 ..< data.count) { i in
                    LinesShape(points: data[i])
                        .stroke(self.model.seriesAttributes.colors[i].color(self.colorScheme),
                                lineWidth: CGFloat(self.model.seriesAttributes.lineWidth))
                        .frame(width: proxy.size.width - yAxisWidth, height: proxy.size.height - xAxisHeight)
                        .offset(x: yAxisWidth / 2, y: -xAxisHeight/2)
                }
                
                XAxisView(rect: CGRect(x: yAxisWidth, y: proxy.size.height - xAxisHeight, width: proxy.size.width - yAxisWidth, height: xAxisHeight), axisDataSource: self.axisDataSource).environmentObject(self.model)
                    .offset(x: 0)
                
                YAxisView(rect: CGRect(x:0, y: 0, width: yAxisWidth, height: proxy.size.height - xAxisHeight), chartWidth: proxy.size.width - yAxisWidth, axisDataSource: self.axisDataSource).environmentObject(self.model)
            }
        }.padding()
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.lineModels) {
                LineChart($0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
