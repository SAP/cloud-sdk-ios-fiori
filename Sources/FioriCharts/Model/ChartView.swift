//
//  ChartView.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/22/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

/**
SwiftUI View's wrapper for all charts

## Usage

```
let model = ChartModel(chartType: .line,
           data: [[nil, 220, nil, 250, 200, nil, 230],
                  [160, nil, 130, 170, nil, 190, 180]],
           titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]]
)

then in,
 public var body: some View {
    ...
    ChartView(model)
        .frame(width: 300, height: 200)
    ...
}
 
```
*/

public struct ChartView: View {
    @ObservedObject var chartModel: ChartModel
    
    public init(_ chartModel: ChartModel) {
        self.chartModel = chartModel
    }
    
    public var body: some View {
        return Group {
            if chartModel.data.isEmpty || chartModel.data.first?.isEmpty ?? true {
                NoDataView()
            } else if chartModel.chartType == .micro_bullet {
                BulletMicroChart(model: chartModel)
            } else if chartModel.chartType == .micro_harvey_ball {
                HarveyBallMicroChart(model: chartModel)
            } else if chartModel.chartType == .micro_radial {
                RadialMicroChart(model: chartModel)
            } else if chartModel.chartType == .micro_column {
                ColumnMicroChart(model: chartModel)
            } else if chartModel.chartType == .stock {
                StockMicroChart(model: chartModel)
            } else if chartModel.chartType == .donut {
                DonutChart(model: chartModel)
            } else if chartModel.chartType == .line {
                LineChart(model: chartModel)
            } else if chartModel.chartType == .area {
                AreaChart(model: chartModel)
            } else if chartModel.chartType == .column {
                ColumnChart(model: chartModel)
            } else if chartModel.chartType == .stackedColumn {
                StackedColumnChart(model: chartModel)
            } else if chartModel.chartType == .waterfall {
                WaterfallChart(model: chartModel)
            } else if chartModel.chartType == .combo {
                ComboChart(model: chartModel)
            } else if chartModel.chartType == .bar {
                BarChart(model: chartModel)
            } else if chartModel.chartType == .bubble {
                BubbleChart(model: chartModel)
            } else if chartModel.chartType == .scatter {
                ScatterChart(model: chartModel)
            } else {
                NoDataView()
            }
        }
    }
}

struct FUIChartView_Previews: PreviewProvider {
    static var previews: some View {
        let model1 = ChartModel(chartType: .line,
                                data: [[200, 170, 165, 143, 166, 112, 110],
                                       [150, 120, 130, 135, 120, 138, 137]],
                                titlesForCategory: [["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]])

        return Group {
            ChartView(model1)
                .frame(width: 300, height: 200)
        }
        .previewLayout(.sizeThatFits)
    }
}
