//
//  ChartView.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/22/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

public struct ChartView: View {
    @ObservedObject var chartModel: ChartModel
    
    public init(_ chartModel: ChartModel) {
        self.chartModel = chartModel
    }
    
    public var body: some View {
        Group {
            if chartModel.chartType == .micro_bullet  {
                BulletMicroChart(chartModel)
            }
            else if chartModel.chartType == .micro_harvey_ball {
                HarveyBallMicroChart(chartModel)
            }
            else if chartModel.chartType == .micro_radial {
                RadialMicroChart(chartModel)
            }
            else if chartModel.chartType == .micro_column {
                ColumnMicroChart(chartModel)
            }
            else if chartModel.chartType == .stock {
                StockMicroChart(chartModel)
            }
            else if chartModel.chartType == .donut {
                DonutChart(chartModel)
            }
            else if chartModel.chartType == .line {
                LineChart(chartModel)
            }
            else {
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
