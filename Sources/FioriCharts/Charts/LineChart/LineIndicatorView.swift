//
//  LineIndicatorView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/26/20.
//

import SwiftUI
import FioriSwiftUICore

struct SelectionItem: Identifiable {
    let categoryIndex: Int
    let seriesIndexes: [Int]
    
    var id: Int {
        return categoryIndex
    }
}

/*
 Line, Stock and Combo chart use this to show selection UI
 */
struct LineIndicatorView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    //swiftlint:disable force_unwrapping
    func makeBody(in rect: CGRect) -> some View {
        let (rangeIndicator, selectionItems) = ChartUtility.convertSelectionsToSelectionItems(model)
        let baselinePosition = ChartUtility.xAxisBaselinePosition(model)

        let extraSelectedPointAndBorderDiameter = (ChartViewLayout.extraSelectedPointRadiusWidth + ChartViewLayout.extraSelectedPointWhiteBoderRadiusWidth) * 2
        
        return ZStack {
            // range selection indicators
            if rangeIndicator != nil {
                LineRangeIndicatorView(seriesIndex: self.seriesIdFromKey(rangeIndicator!),
                                       startIndex: self.lowerBoundFromKey(rangeIndicator!),
                                       endIndex: self.upperBoundFromKey(rangeIndicator!),
                                       displayRange: self.displayRange(rangeIndicator!),
                                       baselinePosition: baselinePosition,
                                       lineWidth: self.lineWidth(rangeIndicator!),
                                       pointRadius: self.pointRadius(rangeIndicator!, show: true),
                                       pointGap: self.pointGap(rangeIndicator!),
                                       lineFillColor: self.lineStrokeColor(rangeIndicator!, stroke: false),
                                       lineStrokeColor: self.lineStrokeColor(rangeIndicator!, stroke: true),
                                       pointStrokeColor: self.pointStrokeColor(rangeIndicator!))
                    .frame(width: self.rangeSelectionWidth(rangeIndicator!, rect: rect), height: rect.size.height)
                    .position(x: self.rangeSelectionPosition(rangeIndicator!, rect: rect), y: rect.size.height / 2.0)
            }
            
            ForEach(selectionItems) { item in
                LineLineIndicatorView(height: rect.size.height)
                    .frame(width: 9, height: rect.size.height)
                    .position(x: self.xPos(item.categoryIndex, rect: rect), y: rect.size.height / 2)
                
                // point indicators
                ForEach(item.seriesIndexes, id: \.self) { seriesIndex in
                    LinePointIndicatorView(pointRadius: self.pointRadius(seriesIndex, show: false),
                                           strokeColr: self.pointStrokeColor(seriesIndex))
                        .frame(width: self.pointRadius(seriesIndex, show: false) * 2 + extraSelectedPointAndBorderDiameter,
                               height: self.pointRadius(seriesIndex, show: false) * 2 + extraSelectedPointAndBorderDiameter)
                        .position(self.pos(from: seriesIndex, categoryIndex: item.categoryIndex, rect: rect))
                }
            }
        }
    }
    
    func seriesIdFromKey(_ key: String) -> Int {
        let indices = key.split(separator: ":").map {
            Int($0) ?? 0
        }
        
        return indices.isEmpty ? 0 : indices[0]
    }
    
    func lowerBoundFromKey(_ key: String) -> Int {
        let indices = key.split(separator: ":").map {
            Int($0) ?? 0
        }
        
        return indices.count >= 2 ? indices[1] : 0
    }
    
    func upperBoundFromKey(_ key: String) -> Int {
        let indices = key.split(separator: ":").map {
            Int($0) ?? 0
        }
        
        return indices.count >= 3 ? indices[2] : 0
    }
    
    func displayRange(_ key: String) -> ClosedRange<CGFloat> {
        if model.chartType == .stock {
            return ChartUtility.displayRange(model)
        } else {
            let seriesIndex = seriesIdFromKey(key)
            let secondarySeriesIndexes = model.indexesOfSecondaryValueAxis.sorted()
            if secondarySeriesIndexes.contains(seriesIndex) {
                return ChartUtility.displayRange(model, secondary: true)
            } else {
                return ChartUtility.displayRange(model)
            }
        }
    }
    
    func rangeSelectionWidth(_ key: String, rect: CGRect) -> CGFloat {
        let indices = key.split(separator: ":").map {
            Int($0) ?? 0
        }
        
        let low = indices.count >= 2 ? indices[1] : 0
        let upper = indices.count >= 3 ? indices[2] : 0
        
        return xPos(upper, rect: rect) - xPos(low, rect: rect)
    }
    
    func rangeSelectionPosition(_ key: String, rect: CGRect) -> CGFloat {
        let indices = key.split(separator: ":").map {
            Int($0) ?? 0
        }
        
        let low = indices.count >= 2 ? indices[1] : 0
        let upper = indices.count >= 3 ? indices[2] : 0
        
        return (xPos(upper, rect: rect) + xPos(low, rect: rect)) / 2
    }
    
    func xPos(_ categoryIndex: Int, rect: CGRect) -> CGFloat {
        let startPosX = model.startPos.x * model.scale * rect.size.width
        
        if model.chartType == .combo {
            let pd = chartContext.plotData(model)
            let allIndexs = IndexSet(integersIn: 0 ..< model.numOfSeries())
            let lineIndexes =  model.indexesOfColumnSeries.symmetricDifference(allIndexs).sorted()
            let seriesIndex = lineIndexes.isEmpty ? 0 : lineIndexes[0]
            
            if pd.isEmpty {
                return 0
            } else {
                return pd[categoryIndex][seriesIndex].pos.x * model.scale * rect.size.width - startPosX
            }
        } else {
            let count = model.chartType == .stock ? ChartUtility.numOfDataItems(model) : model.numOfCategories()
            let unitWidth: CGFloat = max(rect.size.width * model.scale / CGFloat(max(count - 1, 1)), ChartViewLayout.minUnitWidth)
            
            return CGFloat(categoryIndex) * unitWidth - startPosX
        }
    }
    
    func pos(from key: String, rect: CGRect) -> CGPoint {
        let indices = key.split(separator: ":").map {
            Int($0) ?? 0
        }
        
        let seriesIndex = indices.isEmpty ? 0 : indices[0]
        let categoryIndex = indices.count >= 2 ? indices[1] : 0
        
        return pos(from: seriesIndex, categoryIndex: categoryIndex, rect: rect)
    }
    
    func pos(from seriesIndex: Int, categoryIndex: Int, rect: CGRect) -> CGPoint {
        let x = xPos(categoryIndex, rect: rect)
        
        var y: CGFloat = 0
        if model.chartType == .combo {
            let pd = chartContext.plotData(model)
            
            if !pd.isEmpty {
                y = (1.0 - pd[categoryIndex][seriesIndex].pos.y) * rect.size.height
            }
        } else {
            let secondarySeriesIndexes = model.indexesOfSecondaryValueAxis.sorted()
            let displayRange = ChartUtility.displayRange(model)
            let seconaryDisplayRange = ChartUtility.displayRange(model, secondary: true)
            let range = secondarySeriesIndexes.contains(seriesIndex) ? seconaryDisplayRange : displayRange

            if let value = ChartUtility.dimensionValue(model, seriesIndex: seriesIndex, categoryIndex: categoryIndex) {
                y = rect.size.height - (CGFloat(value) - range.lowerBound) * rect.size.height / (range.upperBound - range.lowerBound) + rect.origin.y
            }
        }
        
        return CGPoint(x: x, y: y)
    }
    
    func lineStrokeColor(_ key: String, stroke: Bool) -> Color {
        let seriesIndex = seriesIdFromKey(key)
        
        return lineStrokeColor(seriesIndex, stroke: stroke)
    }
    
    func lineStrokeColor(_ seriesIndex: Int, stroke: Bool) -> Color {
        if model.chartType == .stock {
            var isPriceGoingUp = true
            if let startPrice = ChartUtility.dimensionValue(model, categoryIndex: 0), let endPrice = ChartUtility.dimensionValue(model, categoryIndex: ChartUtility.lastValidDimIndex(model)) {
                if startPrice > endPrice {
                    isPriceGoingUp = false
                }
            }
            
            var strokeColor = Color.primary
            if model.seriesAttributes.count > seriesIndex {
                let attr = model.seriesAttributes[seriesIndex]
                
                strokeColor = isPriceGoingUp ? attr.palette.colors[0] : attr.palette.colors[1]
            }
            
            if stroke {
                return strokeColor
            }
            
            return strokeColor.opacity(0.4)
        } else {
            var strokeColor = Color.primary
            if model.seriesAttributes.count > seriesIndex {
                let attr = model.seriesAttributes[seriesIndex]
                
                if stroke {
                    strokeColor = attr.palette.colors[0]
                }
                
                strokeColor = attr.palette.fillColor
            }
            
            return strokeColor
        }
    }
    
    func pointStrokeColor(_ key: String) -> Color {
        let seriesIndex = seriesIdFromKey(key)
        
        return pointStrokeColor(seriesIndex)
    }
    
    func pointStrokeColor(_ seriesIndex: Int) -> Color {
        var strokeColor = Color.primary
        if model.seriesAttributes.count > seriesIndex {
            let point = model.seriesAttributes[seriesIndex].point
            strokeColor = point.strokeColor
        }
    
        if model.chartType == .stock {
            return lineStrokeColor(seriesIndex, stroke: true)
        } else {
            return strokeColor
        }
    }
    
    func lineWidth(_ key: String) -> CGFloat {
        let seriesIndex = seriesIdFromKey(key)
        
        var width: CGFloat = 1
        
        if model.seriesAttributes.count > seriesIndex {
            width = model.seriesAttributes[seriesIndex].lineWidth
        }
        
        return width
    }
    
    func pointGap(_ key: String) -> CGFloat {
        let seriesIndex = seriesIdFromKey(key)
        
        var gap: CGFloat = 2
        if model.seriesAttributes.count > seriesIndex {
            gap = model.seriesAttributes[seriesIndex].point.gap
        }
        
        return gap
    }
    
    func pointRadius(_ key: String, show: Bool) -> CGFloat {
        let seriesIndex = seriesIdFromKey(key)
        
        return pointRadius(seriesIndex, show: show)
    }
    
    func pointRadius(_ seriesIndex: Int, show: Bool) -> CGFloat {
        var diameter: CGFloat = 7
        var pointIsHidden = false
        
        if model.seriesAttributes.count > seriesIndex {
            let point = model.seriesAttributes[seriesIndex].point
            pointIsHidden = point.isHidden
            diameter = point.diameter
        }
        
        if show {
            return pointIsHidden ? 0 : diameter/2.0
        } else {
            return diameter/2.0
        }
    }
}

struct LineIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        LineIndicatorView()
            .environmentObject(Tests.lineModels[0])
            .environment(\.chartContext, DefaultChartContext())
            .frame(width: 300, height: 200, alignment: .topLeading)
            .padding(32)
            .previewLayout(.sizeThatFits)
    }
}
