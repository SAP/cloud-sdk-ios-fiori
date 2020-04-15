//
//  AreaChart.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 4/14/20.
//

import SwiftUI

struct AreaChart: View {
    @ObservedObject var model: ChartModel

    public init(_ chartModel: ChartModel) {
        self.model = chartModel
    }
    
    var body: some View {
        XYAxisChart(model,
                    axisDataSource: DefaultAxisDataSource(),
                    chartView: LinesView(model, fill: true),
                    indicatorView: LineIndicatorView(model))
    }
}

struct AreaChart_Previews: PreviewProvider {
    static var previews: some View {
        let models: [ChartModel] = Tests.lineModels.map {
           let model = $0.copy() as! ChartModel
           model.chartType = .area
           return model
        }
        
        return Group {
            ForEach(models) {
                AreaChart($0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
