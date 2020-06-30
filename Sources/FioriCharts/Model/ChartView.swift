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
        Group {
            if chartModel.data.isEmpty || chartModel.data.first?.isEmpty ?? true {
                NoDataView()
            } else if chartModel.chartType == .micro_bullet {
                BulletMicroChart().environmentObject(chartModel)
            } else if chartModel.chartType == .micro_harvey_ball {
                HarveyBallMicroChart().environmentObject(chartModel)
            } else if chartModel.chartType == .micro_radial {
                RadialMicroChart().environmentObject(chartModel)
            } else if chartModel.chartType == .micro_column {
                ColumnMicroChart().environmentObject(chartModel)
            } else if chartModel.chartType == .stock {
                StockMicroChart().environmentObject(chartModel)
            } else if chartModel.chartType == .donut {
                DonutChart().environmentObject(chartModel)
            } else if chartModel.chartType == .line {
                LineChart().environmentObject(chartModel)
            } else if chartModel.chartType == .area {
                AreaChart().environmentObject(chartModel)
            } else if chartModel.chartType == .column {
                ColumnChart().environmentObject(chartModel)
            } else if chartModel.chartType == .stackedColumn {
                StackedColumnChart().environmentObject(chartModel)
            } else if chartModel.chartType == .waterfall {
                WaterfallChart().environmentObject(chartModel)
            } else {
                NoDataView()
            }
        }
    }
}

struct FUIChartView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.allCases) {
                ChartView($0)
                    .frame(width: 300, height: 200)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
