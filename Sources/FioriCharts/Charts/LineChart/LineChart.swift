//
//  LineChart.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/13/20.
//

import SwiftUI

struct LineChart: View {
    @ObservedObject var model: ChartModel
    
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
        
        return ZStack {
            ForEach(0 ..< data.count) { i in
                LinesShape(points: data[i])
                    .stroke(Color(hex: self.model.seriesAttributes.colors[i]), lineWidth: CGFloat(self.model.seriesAttributes.lineWidth))
            }
        }
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
