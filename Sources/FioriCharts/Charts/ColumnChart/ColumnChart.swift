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
        var startIndex = -1
        var endIndex = maxDataCount - 1
        
        if endIndex < 0 {
            return ret
        }
    
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ColumnGapFraction)
        
        for index in 0...endIndex {
            let x = rect.origin.x + (columnXIncrement * CGFloat(index) + clusterWidth / 2.0) * model.scale * rect.size.width
            if startIndex == -1 {
                if x >= CGFloat(model.startPos) {
                    startIndex = index
                }
            }
            
            if x < CGFloat(model.startPos) + rect.size.width {
                endIndex = index
            }
        }
        
        let labelsIndex = model.categoryAxis.labelLayoutStyle == .allOrNothing ? Array(startIndex ... endIndex) : (startIndex != endIndex ? [startIndex, endIndex] : [startIndex])
        
        for (index, i) in labelsIndex.enumerated() {
            var x = rect.origin.x + (columnXIncrement * CGFloat(i) + clusterWidth / 2.0) * model.scale * rect.size.width - CGFloat(model.startPos)
            
            let title = ChartUtility.categoryValue(model, categoryIndex: i) ?? ""
            if model.categoryAxis.labelLayoutStyle == .range && isLabel {
                let size = title.boundingBoxSize(with: model.categoryAxis.labels.fontSize)
                if index == 0 {
                    let tmpX = rect.origin.x + columnXIncrement * CGFloat(i) * model.scale * rect.size.width - CGFloat(model.startPos)
                    x = max(0, tmpX) + min(size.width, (rect.size.width - 2) / 2) / 2
                } else {
                    let tmpX = rect.origin.x + (columnXIncrement * CGFloat(i) + clusterWidth) * model.scale * rect.size.width - CGFloat(model.startPos)
                    x =  min(tmpX, rect.size.width) - min(size.width, (rect.size.width - 2) / 2) / 2
                }
            }
            
            ret.append(AxisTitle(index: i,
                                 title: title,
                                 pos: CGPoint(x: x, y: 0)))
        }
        
        return ret
    }
    
    override func plotData(_ model: ChartModel) -> [[ChartPlotRectData]] {
        var result: [[ChartPlotRectData]] = []
        let seriesCount = model.numOfSeries()
        let maxDataCount = model.numOfCategories(in: 0)
        
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ColumnGapFraction)
        let columnWidth = clusterWidth / CGFloat(seriesCount)
        
        let tickValues = model.numericAxisTickValues
        let yScale = tickValues.plotScale
        let baselinePosition = tickValues.plotBaselinePosition
        let baselineValue = tickValues.plotBaselineValue
        let corruptDataHeight = yScale / 1000
        
        var clusteredX: CGFloat
        //
        // Loop through data points
        //
        for categoryIndex in 0 ..< maxDataCount {
            var seriesResult: [ChartPlotRectData] = []
            
            //
            // Loop through series
            //
            for seriesIndex in 0 ..< seriesCount {
                //
                // Calculate and define clustered column x positions.
                //
                clusteredX = columnXIncrement * CGFloat(categoryIndex)
                clusteredX += columnWidth * CGFloat(seriesIndex)
                var columnHeight = corruptDataHeight
                var clusteredY = baselinePosition
                var rawValue: CGFloat = 0
                //
                // Fetch value
                //
                let value = model.plotItemValue(at: seriesIndex, category: categoryIndex, dimension: 0)
                
                if let val = value {
                    rawValue = CGFloat(val)
                    if val >= 0.0 {
                        columnHeight = yScale * (CGFloat(val) - baselineValue)
                    } else {
                        columnHeight = -yScale * (CGFloat(val) - baselineValue)
                        clusteredY = baselinePosition - columnHeight
                    }
                }
                
                seriesResult.append(ChartPlotRectData(seriesIndex: seriesIndex,
                                                      categoryIndex: categoryIndex,
                                                      value: rawValue,
                                                      x: clusteredX,
                                                      y: clusteredY,
                                                      width: columnWidth,
                                                      height: columnHeight))
            }
            
            result.append(seriesResult)
        }
        
        return result
    }
    
    override func snapChartToPoint(_ model: ChartModel, at x: CGFloat, in rect: CGRect) -> CGFloat {
        let maxDataCount = model.numOfCategories(in: 0)
        let columnXIncrement = 1.0 / (CGFloat(maxDataCount) - ColumnGapFraction / (1.0 + ColumnGapFraction))
        let unitWidth = columnXIncrement * model.scale * rect.size.width
        let categoryIndex = Int(x / unitWidth + 0.5)
        let clusteredX = columnXIncrement * CGFloat(categoryIndex) * model.scale * rect.size.width
        
        return clusteredX
    }
    
    override func displayCategoryIndexesAndOffsets(_ model: ChartModel, rect: CGRect) -> (startIndex: Int, endIndex: Int, startOffset: CGFloat, endOffset: CGFloat) {
        var startIndex = -1
        var endIndex = -1
        var startOffset: CGFloat = 0
        var endOffset: CGFloat = 0
        
        let pd = plotData(model)
        for plotSeries in pd {
            if startIndex == -1 {
                if let first = plotSeries.first, let last = plotSeries.last {
                    let firstX = first.rect.origin.x * model.scale * rect.size.width
                    if (CGFloat(model.startPos) >= firstX && CGFloat(model.startPos) <= last.rect.maxX * model.scale * rect.size.width) || firstX >= CGFloat(model.startPos) {
                        startIndex = first.categoryIndex
                        startOffset = firstX - CGFloat(model.startPos)
                    }
                }
            }
            
            if let first = plotSeries.first, let last = plotSeries.last {
                if (CGFloat(model.startPos) + rect.size.width) >= first.rect.origin.x * model.scale * rect.size.width {
                    endIndex = first.categoryIndex
                    endOffset = last.rect.maxX * model.scale * rect.size.width - CGFloat(model.startPos) - rect.size.width
                }
            }
        }
        
        if startIndex > endIndex {
            endIndex = startIndex
        }
        
        return (startIndex, endIndex, startOffset, endOffset)
    }
    
    override func closestSelectedPlotItem(_ model: ChartModel, atPoint: CGPoint, rect: CGRect, layoutDirection: LayoutDirection) -> (seriesIndex: Int, categoryIndex: Int) {
        let width = rect.size.width
        let pd = plotData(model)
        let x = ChartUtility.xPos(atPoint.x,
                                  layoutDirection: layoutDirection,
                                  width: width)
        
        for plotSeries in pd {
            for plotCat in plotSeries {
                let xMin = plotCat.rect.minX * model.scale * width - CGFloat(model.startPos)
                let xMax = plotCat.rect.maxX * model.scale * width - CGFloat(model.startPos)
                
                if x >= xMin && x <= xMax {
                    return (plotCat.seriesIndex, plotCat.categoryIndex)
                }
            }
        }
        
        return (-1, -1)
    }
    
    // range selection
    override func closestSelectedPlotItems(_ model: ChartModel, atPoints: [CGPoint], rect: CGRect, layoutDirection: LayoutDirection) -> [(Int, Int)] {
        if atPoints.count != 2 {
            return []
        }

        let width = rect.size.width
        let pd = plotData(model)
        let points = atPoints.map { (pt) -> CGPoint in
            let x = ChartUtility.xPos(pt.x,
                                      layoutDirection: layoutDirection,
                                      width: width)
            return CGPoint(x: x, y: pt.y)
        }.sorted { $0.x <= $1.x }

        var res: [(Int, Int)] = []
        
        for (index, pt) in points.enumerated() {
            var selectedSeriesIndex: Int = -1
            var selectedCategoryIndex: Int = -1
            for plotSeries in pd {
                for plotCat in plotSeries {
                    let xMin = plotCat.rect.minX * model.scale * width - CGFloat(model.startPos)
                    let xMax = plotCat.rect.maxX * model.scale * width - CGFloat(model.startPos)

                    if (xMin >= pt.x || (pt.x >= xMin && pt.x <= xMax)) && selectedSeriesIndex == -1 && index == 0 {
                        selectedSeriesIndex = plotCat.seriesIndex
                        selectedCategoryIndex = plotCat.categoryIndex

                        res.append((selectedSeriesIndex, selectedCategoryIndex))
                    }
                    
                    if index == 1 {
                        if pt.x >= xMin {
                            selectedSeriesIndex = plotCat.seriesIndex
                            selectedCategoryIndex = plotCat.categoryIndex
                        } else {
                            if selectedSeriesIndex > -1 {
                                res.append((selectedSeriesIndex, selectedCategoryIndex))
                                return res
                            }
                        }
                    }
                }
            }
        }
        
        return res
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
