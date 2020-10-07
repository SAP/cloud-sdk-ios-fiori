//
//  LineChart.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/13/20.
//

import SwiftUI

struct LineChart: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        XYAxisChart(chartContext: DefaultChartContext(),
                    chartView: LinesView(),
                    indicatorView: LineIndicatorView())
            .environmentObject(model)
    }
}

struct LineChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.lineModels) {
                LineChart(model: $0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
