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
            } else if chartModel.chartType == .stackedBar {
                StackedBarChart(model: chartModel)
            } else if chartModel.chartType == .bubble {
                BubbleChart(model: chartModel)
            } else if chartModel.chartType == .scatter {
                ScatterChart(model: chartModel)
            } else {
                NoDataView()
            }
        }
    }
    
    struct Layout {
        /// Minimum: 20px from left edge of content area
        static let minYAxisViewWidth: CGFloat = 20
        /// Maximum Y Axis Width: 35% of content area
        static let maxYAxisViewWidthRatio: CGFloat = 0.35
        /// when the y-axis label area its at its maximum width and values are still truncated, the user can double tap the y-axis label area to expand the y-axis label area to the right. This will increase the width of the labels up to 60% of the content area.
        static let maxExpandedYAxisViewWidthRatio: CGFloat = 0.60
        /// Maximum secondary Y Axis Width: 20% of content area
        static let maxSecondaryYAxisViewWidthRatio: CGFloat = 0.20
        /// The minimum spacing bwteen y axis labels and baseline
        static let minSpacingBtwYAxisLabelAndBaseline: CGFloat = 3
        /// The minimum spacing between y-axis gridline labels is 3px
        static let minSpacingBtwYAxisLabels: CGFloat = 3
        ///A minimum of 4px padding is present on both the left and right of the x axis label if the text labels come in closely.
        static let minSpacingBtwXAxisLabels: CGFloat = 4
        /// Extra diameter width for selected point in line/area chart
        static let extraSelectedPointRadiusWidth: CGFloat = 2.5
        /// Extra white border radius width around selected point in line/area chart
        static let extraSelectedPointWhiteBoderRadiusWidth: CGFloat = 2
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
