import SwiftUI

struct WaterfallChart: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        XYAxisChart(model: model,
                    chartContext: WaterfallChartContext(),
                    chartView: WaterfallView(),
                    indicatorView: EmptyView())
    }
}

class WaterfallChartContext: StackedColumnChartContext {
    override func plotData(_ model: ChartModel) -> [[ChartPlotData]] {
        if let pd = model.plotDataCache {
            return pd
        }
        
        var result: [[ChartPlotData]] = []
        let maxDataCount = model.numOfCategories(in: 0)
        
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ChartViewLayout.columnGapFraction)
        
        let tickValues = model.numericAxisTickValues
        let yScale = tickValues.plotScale
        let baselinePosition = tickValues.plotBaselinePosition
        let baselineValue = tickValues.plotBaselineValue
        let corruptDataHeight = yScale / 10000000
        
        var clusteredX: CGFloat
        var subTotal: CGFloat = 0.0
        var origin = baselinePosition
        //
        // Loop through data points
        //
        for categoryIndex in 0 ..< maxDataCount {
            //
            // Calculate and define clustered column x positions.
            //
            clusteredX = columnXIncrement * CGFloat(categoryIndex)
            let isSubTotal = categoryIndex == 0 ? true : model.indexesOfTotalsCategories.contains(categoryIndex)
            var columnHeight = corruptDataHeight
            var clusteredY = baselinePosition
            var rawValue: CGFloat = 0
            
            //
            // Fetch value
            //
            let value = model.plotItemValue(at: 0, category: categoryIndex, dimension: 0)
            
            if isSubTotal {
                //
                // If the total index indicates it should be presented as a total column and the value is not provided, use calculated total.
                //
                if let val = value {
                    rawValue = CGFloat(val)
                } else {
                    rawValue = subTotal
                }
            } else {
                if let val = value {
                    rawValue = CGFloat(val)
                } else {
                    rawValue = 0
                }
                
                subTotal += rawValue
            }
            
            if rawValue >= 0 {
                columnHeight = yScale * ((rawValue < baselineValue || !isSubTotal) ? rawValue : (rawValue - baselineValue))
                clusteredY = isSubTotal ? baselinePosition : origin
                origin = clusteredY + columnHeight
            } else {
                columnHeight = -yScale * ((rawValue > baselineValue || !isSubTotal) ? rawValue : (rawValue - baselineValue))
                clusteredY = isSubTotal ? baselinePosition - columnHeight : origin - columnHeight
                origin = clusteredY
            }
            
            let rectData = ChartPlotData.rect(rect: ChartPlotRectData(seriesIndex: 0,
                                                                      categoryIndex: categoryIndex,
                                                                      value: rawValue,
                                                                      x: clusteredX,
                                                                      y: clusteredY,
                                                                      width: clusterWidth,
                                                                      height: columnHeight))
            
            result.append([rectData])
        }
        
        model.plotDataCache = result
        
        return result
    }
    
    override func plotPath(_ model: ChartModel) -> [[[Path]]] {
        if !model.path.isEmpty {
            return model.path
        }
        
        var result = [[[Path]]]()
        let seriesCount = model.numOfSeries()

        for seriesIndex in 0 ..< max(1, seriesCount) {
            let linesPath = self.connectingLinesPath(model, for: seriesIndex)
            let columnCount = model.numOfCategories(in: seriesIndex)
            
            var seriesPath = [[Path]]()
            for categoryIndex in 0 ..< columnCount {
                let columnPath = Path()
                let linePath = linesPath.count > categoryIndex ? linesPath[categoryIndex] : Path()
                seriesPath.append([columnPath, linePath])
            }

            result.append(seriesPath)
        }

        model.path = result

        return result
    }
    
    func connectingLinesPath(_ model: ChartModel, for seriesIndex: Int) -> [Path] {
        let maxDataCount = model.numOfCategories(in: 0)
        let columnXIncrement = 1.0 / (CGFloat(max(1, maxDataCount)) - ChartViewLayout.columnGapFraction / (1.0 + ChartViewLayout.columnGapFraction))
        let clusterWidth = columnXIncrement / (1.0 + ChartViewLayout.columnGapFraction)
        let pd = self.plotData(model)
        var seriesPath = [Path]()
        
        for categoryIndex in 0 ..< maxDataCount {
            var path = Path()
            
            let startX = columnXIncrement * CGFloat(categoryIndex)
            let endX = columnXIncrement * CGFloat(categoryIndex) + clusterWidth
            
            // top line and bottom line
            if model.plotItemValue(at: seriesIndex, category: categoryIndex, dimension: 0) != nil {
                let isTotal = self.isSubTotal(model, categoryIndex: categoryIndex)
                
                // only top line
                if isTotal {
                    let topY = self.yPos(model, for: pd[categoryIndex][0], isStart: true)
                    path.move(to: CGPoint(x: startX, y: topY))
                    path.addLine(to: CGPoint(x: startX + clusterWidth, y: topY))
                } else {
                    let item = pd[categoryIndex][0]
                    path.move(to: CGPoint(x: startX, y: 1.0 - item.rect.minY))
                    path.addLine(to: CGPoint(x: startX + clusterWidth, y: 1.0 - item.rect.minY))
                    
                    path.move(to: CGPoint(x: startX, y: 1.0 - item.rect.maxY))
                    path.addLine(to: CGPoint(x: startX + clusterWidth, y: 1.0 - item.rect.maxY))
                }

                // connecting line to next column
                if categoryIndex < maxDataCount - 1, model.plotItemValue(at: seriesIndex, category: categoryIndex + 1, dimension: 0) != nil {
                    let startPoint = CGPoint(x: endX, y: yPos(model, for: pd[categoryIndex][0], isStart: true))
                    
                    let endPoint: CGPoint = categoryIndex == maxDataCount - 1 ? startPoint : CGPoint(x: columnXIncrement * CGFloat(categoryIndex + 1),
                                                                                                     y: self.yPos(model, for: pd[categoryIndex + 1][0], isStart: false))
                    
                    if categoryIndex < maxDataCount - 1 {
                        path.move(to: startPoint)
                        path.addLine(to: endPoint)
                    }
                }
            }
            
            seriesPath.append(path)
        }
        
        return seriesPath
    }
    
    func yPos(_ model: ChartModel, for item: ChartPlotData, isStart: Bool) -> CGFloat {
        let isTotal = self.isSubTotal(model, categoryIndex: item.categoryIndex)
        
        let isTop = (isTotal && item.value > 0) || (isStart && item.value > 0) || (!isStart && !isTotal && item.value < 0)
            
        if isTop {
            return (1.0 - item.rect.maxY)
        } else {
            return (1.0 - item.rect.minY)
        }
    }
    
    func isSubTotal(_ model: ChartModel, categoryIndex: Int) -> Bool {
        categoryIndex == 0 ? true : model.indexesOfTotalsCategories.contains(categoryIndex)
    }
}

struct WaterfallChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.waterfallModels) {
                WaterfallChart(model: $0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
