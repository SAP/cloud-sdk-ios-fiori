//
//  ChartView.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/22/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI


public struct ChartView: View {
    var chartModel: ChartModel
    
    public init(_ chartModel: ChartModel) {
        self.chartModel = chartModel
    }
    
    public var body: some View {
        Group {
            if chartModel.chartType == .micro_harvey_ball {
                HarveyBallMicroChart(chartModel)
            }
            else if chartModel.chartType == .micro_radial {
                RadialMicroChart(chartModel)
            }
            else if chartModel.chartType == .micro_column {
                ColumnMicroChart(chartModel)
            }
            else {
                NoDataView()
            }
        }
    }
}

/*
 struct FUIChartView_Previews: PreviewProvider {
 static var previews: some View {
 let columnChart = ColumnMicroChartModel(dataSource: Test.ChartCard.items[1].dataSeries)
 
 return FUIChartView(columnChart)
 .frame(width: 300, height: 200)
 .previewLayout(.sizeThatFits)
 }
 }*/
