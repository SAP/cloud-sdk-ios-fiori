//
//  ColumnChart.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/3/20.
//

import SwiftUI

let ColumnGapFraction: CGFloat = 0.333333

struct ColumnChart: View {
    @ObservedObject var model: ChartModel

    public init(_ chartModel: ChartModel) {
        self.model = chartModel
    }
    
    var body: some View {
        XYAxisChart(model,
                    axisDataSource: ColumnAxisDataSource(),
                    chartView: ColumnView(model),
                    indicatorView: ColumnIndicatorView(model))
    }
}

class ColumnAxisDataSource: DefaultAxisDataSource {
    override func xAxisLabels(_ model: ChartModel, rect: CGRect) -> [AxisTitle] {
        return xAxisGridLineLabels(model, rect: rect, isLabel: true)
    }

    override func xAxisGridlines(_ model: ChartModel, rect: CGRect) -> [AxisTitle] {
        return xAxisGridLineLabels(model, rect: rect, isLabel: false)
    }
    
    func xAxisGridLineLabels(_ model: ChartModel, rect: CGRect, isLabel: Bool) -> [AxisTitle] {
        var ret: [AxisTitle] = []
        let maxDataCount = model.numOfCategories(in: 0)
        let startIndex = 0
        let endIndex = maxDataCount - 1

        if endIndex < 0 {
            return ret
        }
    
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ColumnGapFraction)
        let labelsIndex = model.categoryAxis.labelLayoutStyle == .allOrNothing ? Array(startIndex ... endIndex) : (startIndex != endIndex ? [startIndex, endIndex] : [startIndex])
        
        for (index, i) in labelsIndex.enumerated() {
            var x = rect.origin.x + (columnXIncrement * CGFloat(i) + clusterWidth / 2.0) * rect.size.width
            
            let title = ChartUtility.categoryValue(model, categoryIndex: i) ?? ""
            if model.categoryAxis.labelLayoutStyle == .range && isLabel {
                let size = title.boundingBoxSize(with: model.categoryAxis.labels.fontSize)
                if index == 0 {
                    x = rect.origin.x + min(size.width, (rect.size.width - 2) / 2) / 2
                } else {
                    x = rect.origin.x + (columnXIncrement * CGFloat(i) + clusterWidth) * rect.size.width - min(size.width, (rect.size.width - 2) / 2) / 2
                }
            }
            
            ret.append(AxisTitle(index: i,
                                 title: title,
                                 pos: CGPoint(x: x, y: 0)))
        }
        
        return ret
    }
}

// swiftlint:disable force_cast
struct ColumnChart_Previews: PreviewProvider {
    static var previews: some View {
        let models: [ChartModel] = Tests.lineModels.map {
           let model = $0.copy() as! ChartModel
           model.chartType = .column
           return model
        }
        
        return Group {
            ForEach(models) {
                ColumnChart($0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
