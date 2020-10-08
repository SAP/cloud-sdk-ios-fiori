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
    
    func xAxisGridLineLabels(_ model: ChartModel, rect: CGRect, isLabel: Bool) -> [AxisTitle] {
        var result: [AxisTitle] = []
        let width = rect.size.width
        if width <= 0 {
            return result
        }
        
        let startPosX = model.startPos.x * model.scale * rect.size.width
        let unitWidth: CGFloat = max(width * model.scale / CGFloat(max(ChartUtility.numOfDataItems(model) - 1, 1)), 1)
        let startIndex = Int((startPosX / unitWidth).rounded(.up))
        let endIndex = Int(((startPosX + width) / unitWidth).rounded(.down))
        
        guard let startDate = getDateAtIndex(model, index: startIndex),
            let endDate = getDateAtIndex(model, index: endIndex) else {
                return result
        }
        
        let duration = endDate.timeIntervalSince(startDate)
        let component = calendarComponentForXAxisLables(with: duration)
        if model.categoryAxis.labelLayoutStyle == .allOrNothing {
            result = findData(model, startIndex: startIndex, endIndex: endIndex, component: component, rect: rect)
        } else {
            let indexes: Set = [startIndex, endIndex]
            let startOffset: CGFloat = (unitWidth - startPosX.truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
            for i in indexes {
                let tmpTitle = xAxisFormattedString(model, index: i, component: component)
                if let title = tmpTitle {
                    var offset: CGFloat = 0
                    if isLabel {
                        let size = title.boundingBoxSize(with: model.categoryAxis.labels.fontSize)
                        if i == startIndex {
                            offset = min(size.width, (rect.size.width - 2) / 2) / 2
                        } else {
                            offset = -min(size.width, (rect.size.width - 2) / 2) / 2
                        }
                    }
                    
                    result.append(AxisTitle(index: i,
                                            title: title,
                                            pos: CGPoint(x: rect.origin.x + startOffset + offset + CGFloat(i - startIndex) * unitWidth,
                                                         y: 0)))
                }
            }
        }

        return result
    }
    
    func findData(_ model: ChartModel, startIndex: Int, endIndex: Int, component: Calendar.Component, rect: CGRect, skipFirst: Bool = false) -> [AxisTitle] {
        var result: [AxisTitle] = []
        
        var prev = -1
        var prevXPos: CGFloat = -100000
        var prevLabelWidth: CGFloat = 0
        for i in startIndex...endIndex {
            guard let date = getDateAtIndex(model, index: i) else { return result }
            let cur = Calendar.current.component(component, from: date)
            if prev == -1 && skipFirst {
                prev = cur
            } else if cur != prev {
                if let title = xAxisFormattedString(model, index: i, component: component) {
                    let label = AxisTitle(index: i,
                                          title: title,
                                          pos: CGPoint(x: calXPosforXAxisElement(model, dataIndex: i, rect: rect),
                                                       y: 0))
                    
                    let size = title.boundingBoxSize(with: model.categoryAxis.labels.fontSize)
                                    
                    // check if the gap btw two adjacent labels is less than 4pt
                    if label.pos.x >= prevXPos + prevLabelWidth / 2.0 + size.width / 2.0 + 4 {
                        prevXPos = label.pos.x
                        prevLabelWidth = size.width
                        result.append(label)
                        prev = cur
                    }
                }
            }
        }
        
        return result
    }
    
    func calXPosforXAxisElement(_ model: ChartModel, dataIndex: Int, rect: CGRect) -> CGFloat {
        if dataIndex == 0 {
            return rect.origin.x
        }
        
        let width = rect.size.width
        let startPosX = model.startPos.x * model.scale * rect.size.width
        let unitWidth: CGFloat = max(width * model.scale / CGFloat(max(ChartUtility.numOfDataItems(model) - 1, 1)), 1)
        let startIndex = Int((startPosX / unitWidth).rounded(.up))
        let startOffset: CGFloat = (unitWidth - startPosX.truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
        
        return rect.origin.x + startOffset + CGFloat(dataIndex - startIndex) * unitWidth
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
    
