//
//  StockMicroChart.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/18/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI

struct StockMicroChart: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        XYAxisChart(chartContext: StockChartContext(),
                    chartView: StockLinesView(),
                    indicatorView: StockIndicatorView())
            .environmentObject(model)
    }
}

class StockChartContext: DefaultChartContext {
    override func xAxisLabels(_ model: ChartModel, rect: CGRect) -> [AxisTitle] {
        return xAxisGridLineLabels(model, rect: rect, isLabel: true)
    }

    override func xAxisGridlines(_ model: ChartModel, rect: CGRect) -> [AxisTitle] {
        return xAxisGridLineLabels(model, rect: rect, isLabel: false)
    }
    
    override func xAxisLabels(_ model: ChartModel) -> [AxisTitle] {
        if let result = model.xAxisLabels[model.categoryAxis.labels.fontSize] {
            return result
        }
        
        var result: [AxisTitle] = []
        let width: CGFloat = 1
        
        let startPosX = model.startPos.x * model.scale * width
        let unitWidth: CGFloat = max(width * model.scale / CGFloat(max(ChartUtility.numOfDataItems(model) - 1, 1)), ChartViewLayout.minUnitWidth)
        let startIndex = Int((startPosX / unitWidth).rounded(.up))
        let endIndex = max(Int(((startPosX + width) / unitWidth).rounded(.down)), startIndex)
        
        guard let startDate = getDateAtIndex(model, index: startIndex),
              let endDate = getDateAtIndex(model, index: endIndex) else {
            return result
        }
        
        let duration = endDate.timeIntervalSince(startDate)
        let component = calendarComponentForXAxisLables(with: duration)
        
        var prev = -1
        for i in startIndex...endIndex {
            guard let date = getDateAtIndex(model, index: i) else {
                continue
            }
            
            let cur = Calendar.current.component(component, from: date)
            if cur != prev {
                if let title = xAxisFormattedString(model, index: i, component: component) {
                    let size = title.boundingBoxSize(with: model.categoryAxis.labels.fontSize)
                    let x = CGFloat(i - startIndex) * unitWidth
                    
                    result.append(AxisTitle(index: i,
                                            title: title,
                                            pos: CGPoint(x: x, y: 0),
                                            size: size))
                    
                    prev = cur
                }
            }
        }
        
        model.xAxisLabels = [:]
        model.xAxisLabels = [model.categoryAxis.labels.fontSize: result]
        
        return result
    }
    
    override func xAxisGridLineLabels(_ model: ChartModel, rect: CGRect, isLabel: Bool) -> [AxisTitle] {
        let width = rect.size.width
        if width <= 0 {
            return []
        }
        
        /// get xAxisLabels in relative position
        let ret = xAxisLabels(model)
        let startPosX = model.startPos.x * model.scale * rect.size.width
        let unitWidth: CGFloat = max(width * model.scale / CGFloat(max(ChartUtility.numOfDataItems(model) - 1, 1)), ChartViewLayout.minUnitWidth)

        let startOffset: CGFloat = (unitWidth - startPosX.truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
        
        var prevXPos: CGFloat = -1000
        if model.categoryAxis.labelLayoutStyle == .range && isLabel {
            var result: [AxisTitle] = []
            if ret.count >= 1 {
                var item = ret[0]
                let offset = min(item.size.width, (rect.size.width - 2) / 2) / 2
                let x = startOffset + offset + item.pos.x * width
                prevXPos = x + item.size.width / 2
                
                item.x(x)
                result.append(item)
                
                if ret.count >= 2, let last = ret.last {
                    var item = last
                    let offset = -min(item.size.width, (rect.size.width - 2) / 2) / 2
                    let x = startOffset + offset + item.pos.x * width
                    
                    if x - prevXPos - item.size.width / 2 >= ChartViewLayout.minSpacingBtwXAxisLabels {
                        item.x(x)
                        
                        result.append(item)
                    }
                }
            }
            
            return result
        } else {
            var result: [AxisTitle] = []
            for item in ret {
                var axisTitle = item
                let x = startOffset + item.pos.x * width
                if x - prevXPos - item.size.width / 2 >= ChartViewLayout.minSpacingBtwXAxisLabels {
                    axisTitle.x(x)
                    result.append(axisTitle)
                    prevXPos = x + item.size.width / 2
                }
            }

            return result
        }
    }
    
    func getDateAtIndex(_ model: ChartModel, index: Int) -> Date? {
        return ChartUtility.categoryValueInDate(model, categoryIndex: index)
    }
    
    func monthAbbreviationFromInt(_ month: Int) -> String {
        let ma = Calendar.current.shortMonthSymbols
        return ma[month - 1]
    }
    
    func calendarComponentForXAxisLables(with duration: TimeInterval) -> Calendar.Component {
        if duration < 60 {
            return .second
        } else if duration < 3600 {
            return .minute
        } else if duration < 3600 * 24 { // hour
            return .hour
        } else if duration < 3600 * 24 * 60 { // day
            return .day
        } else if duration < 3600 * 24 * 31 * 14 { // month
            return .month
        } else { // year
            return .year
        }
    }
    
    //swiftlint:disable cyclomatic_complexity
    func xAxisFormattedString(_ model: ChartModel, index: Int, component: Calendar.Component) -> String? {
        guard let date = getDateAtIndex(model, index: index) else { return nil }
        let cur = Calendar.current.component(component, from: date)
        
        switch component {
        case .year:
            let components = Calendar.current.dateComponents([.year, .month], from: date)
            if let month = components.month {
                if month > 3 && model.categoryAxis.labelLayoutStyle == .allOrNothing {
                    return nil
                }
            }
            return String(cur)
            
        case .month:
            let components = Calendar.current.dateComponents([.month, .day], from: date)
            if let day = components.day {
                if day > 7 && model.categoryAxis.labelLayoutStyle == .allOrNothing {
                    return nil
                }
            }
            
            return monthAbbreviationFromInt(cur)
            
        case .day:
            let components = Calendar.current.dateComponents([.month, .day], from: date)
            var title: String = ""
            if let month = components.month {
                title.append(String(month))
            }
            
            if let day = components.day {
                if !title.isEmpty {
                    title.append("/")
                }
                title.append(String(day))
            }
            
            return title
            
        case .hour, .minute:
            let components = Calendar.current.dateComponents([.hour, .minute], from: date)
            var title: String = ""
            if let hour = components.hour {
                title.append(String(hour))
            }
            
            if let minute = components.minute {
                if component == .hour && minute != 0 && model.categoryAxis.labelLayoutStyle == .allOrNothing {
                    return nil
                }
                
                if !title.isEmpty {
                    title.append(":")
                }
                if minute < 10 {
                    title.append("0")
                }
                
                title.append(String(minute))
            }
            
            return title
            
        default:
            return String(cur)
        }
    }
    
    override func snapChartToPoint(_ model: ChartModel, at x: CGFloat, in rect: CGRect) -> CGFloat {
        let unitWidth: CGFloat = max(model.scale * rect.size.width / CGFloat(max(ChartUtility.numOfDataItems(model) - 1, 1)), 1)
        let categoryIndex = Int(x / unitWidth)
        let x = CGFloat(categoryIndex) * unitWidth
        
        return x
    }
    
    override func displayCategoryIndexesAndOffsets(_ model: ChartModel, rect: CGRect) -> (startIndex: Int, endIndex: Int, startOffset: CGFloat, endOffset: CGFloat) {
        let width = rect.size.width
        let startPosX = model.startPos.x * model.scale * width
        let maxDataCount = model.numOfCategories(in: model.currentSeriesIndex)
        let unitWidth: CGFloat = max(width * model.scale / CGFloat(max(maxDataCount - 1, 1)), ChartViewLayout.minUnitWidth)
        let startIndex = Int(startPosX / unitWidth).clamp(low: 0, high: maxDataCount - 1)
        
        var endIndex = Int(((startPosX + width) / unitWidth).rounded(.up)).clamp(low: 0, high: maxDataCount - 1)
        let startOffset: CGFloat = -startPosX.truncatingRemainder(dividingBy: unitWidth)
        
        let endOffset: CGFloat = (CGFloat(endIndex) * unitWidth - startPosX - width).truncatingRemainder(dividingBy: unitWidth)
        
        if endIndex > ChartUtility.lastValidDimIndex(model) {
            endIndex = ChartUtility.lastValidDimIndex(model)
        }
        
        return (startIndex, endIndex, startOffset, endOffset)
    }
    
    override func closestSelectedPlotItem(_ model: ChartModel, atPoint: CGPoint, rect: CGRect, layoutDirection: LayoutDirection) -> (seriesIndex: Int, categoryIndex: Int) {
        let width = rect.size.width
        let startPosX = model.startPos.x * model.scale * width
        let x = ChartUtility.xPos(atPoint.x,
                                  layoutDirection: layoutDirection,
                                  width: width)
        let point = CGPoint(x: x, y: atPoint.y)
        let count = ChartUtility.numOfDataItems(model)
        let unitWidth: CGFloat = max(width * model.scale / CGFloat(max(count - 1, 1)), ChartViewLayout.minUnitWidth)
        let startIndex = Int((startPosX / unitWidth).rounded(.up))
        let startOffset: CGFloat = (unitWidth - startPosX.truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
        let index: Int = Int((point.x - startOffset) / unitWidth + 0.5) + startIndex
        
        var closestDataIndex = index.clamp(low: 0, high: ChartUtility.lastValidDimIndex(model))
        
        let xPos = rect.origin.x + startOffset + CGFloat(closestDataIndex - startIndex) * unitWidth
        if xPos - rect.origin.x - rect.size.width > 1 {
            closestDataIndex -= 1
        }
        
        return (model.currentSeriesIndex, closestDataIndex)
    }
    
    // range selection
    override func closestSelectedPlotItems(_ model: ChartModel, atPoints: [CGPoint], rect: CGRect, layoutDirection: LayoutDirection) -> [(Int, Int)] {
        if let p0 = atPoints.first, let p1 = atPoints.last {
            let firstItem = closestSelectedPlotItem(model, atPoint: p0, rect: rect, layoutDirection: layoutDirection)
            let lastItem = closestSelectedPlotItem(model, atPoint: p1, rect: rect, layoutDirection: layoutDirection)
            let items = [firstItem, lastItem].sorted { $0.1 <= $1.1 }
            
            return items
        }
        
        return []
    }

}

struct StockMicroChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.stockModels) { model in
                StockMicroChart(model: model)
                    .frame(height: 260)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
    
