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
    
    init(_ model: ChartModel) {
        self.model = model
    }
    
    var body: some View {
        XYAxisChart(model,
                    axisDataSource: StockAxisDataSource(),
                    chartView: StockLinesView(model),
                    indicatorView: StockIndicatorView(model))
        .padding()
    }
}

class StockAxisDataSource : DefaultAxisDataSource {
    override func xAxisLabels(_ model: ChartModel, rect: CGRect) -> [AxisTitle] {
        let width = rect.size.width
        let startPosInFloat = CGFloat(model.startPos)
        let unitWidth: CGFloat = width * model.scale / CGFloat(ChartUtility.numOfDataItmes(model) - 1)
        let startIndex = Int((startPosInFloat / unitWidth).rounded(.up))
        let endIndex = Int(((startPosInFloat + width) / unitWidth).rounded(.down))
        
        var result: [AxisTitle] = []
        
        guard let startDate = getDateAtIndex(model, index: startIndex),
            let endDate = getDateAtIndex(model, index: endIndex) else {
                return result
        }
        
        let duration = endDate.timeIntervalSince(startDate)
        
        if duration < 60 {
            result = findData(model, startIndex: startIndex, endIndex: endIndex, component: .second, rect: rect)
        }
        else if duration < 3600 {
            result = findData(model, startIndex: startIndex, endIndex: endIndex, component: .minute, rect: rect)
        }
        else if duration < 3600 * 24 { // hour
            result = findData(model, startIndex: startIndex, endIndex: endIndex, component: .hour, rect: rect)
        }
        else if duration < 3600 * 24 * 60 { // day
            result = findData(model, startIndex: startIndex, endIndex: endIndex, component: .day, rect: rect)
        }
        else if duration < 3600 * 24 * 31 * 14 { // month
            result = findData(model, startIndex: startIndex, endIndex: endIndex, component: .month, rect: rect)
        }
        else { // year
            result = findData(model, startIndex: startIndex, endIndex: endIndex, component: .year, rect: rect)
        }
        
        // trim results if there are too many
        if result.count > 6 {
            let ratio = Float(result.count) / 4
            var tmp: [AxisTitle] = []
            for i in 1...5 {
                var index = Int(Float(i) * ratio - 0.5)
                if index >= result.count {
                    index = result.count - 1
                }
                tmp.append(result[index])
            }
            
            return tmp
        }
        
        return result
    }
    
    func findData(_ model: ChartModel, startIndex: Int, endIndex: Int, component: Calendar.Component, rect: CGRect, skipFirst: Bool = false) -> [AxisTitle] {
        var result: [AxisTitle] = []
        
        var prev = -1
        for i in startIndex...endIndex{
            guard let date = getDateAtIndex(model, index: i) else { return result }
            let cur = Calendar.current.component(component, from: date)
            if prev == -1 && skipFirst {
                prev = cur
            } else if cur != prev {
                switch component {
                case .month:
                    result.append(AxisTitle(index: i, title: monthAbbreviationFromInt(cur), pos: calXPosforXAxisElement(model, dataIndex: i, rect: rect)))
                    
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
                    
                    result.append(AxisTitle(index: i, title: title, pos: calXPosforXAxisElement(model, dataIndex: i, rect: rect)))
                    
                case .hour, .minute:
                    let components = Calendar.current.dateComponents([.hour, .minute], from: date)
                    var title: String = ""
                    if let hour = components.hour {
                        title.append(String(hour))
                    }
                    
                    if let minute = components.minute {
                        if !title.isEmpty {
                            title.append(":")
                        }
                        if minute < 10 {
                            title.append("0")
                        }
                        
                        title.append(String(minute))
                    }
                    
                    result.append(AxisTitle(index: i, title: title, pos: calXPosforXAxisElement(model, dataIndex: i, rect: rect)))
                    
                default:
                    result.append(AxisTitle(index: i, title: String(cur), pos: calXPosforXAxisElement(model, dataIndex: i, rect: rect)))
                }
                
                prev = cur
            }
        }
        
        if let tmp = result.last, abs(tmp.pos - rect.size.width) < 1 {
            result.removeLast()
        }
        
        if let tmp = result.first, abs(tmp.pos) < 1 {
            result.removeFirst()
        }
        
        return result
    }
    
    func calXPosforXAxisElement(_ model: ChartModel, dataIndex: Int, rect: CGRect) -> CGFloat {
        if dataIndex == 0 {
            return rect.origin.x
        }
        
        let width = rect.size.width
        let unitWidth: CGFloat = width * model.scale / CGFloat(ChartUtility.numOfDataItmes(model) - 1)
        let startIndex = Int((CGFloat(model.startPos) / unitWidth).rounded(.up))
        let startOffset: CGFloat = (unitWidth - CGFloat(model.startPos).truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
        
        return rect.origin.x + startOffset + CGFloat(dataIndex - startIndex) * unitWidth
    }
    
    func getDateAtIndex(_ model: ChartModel, index: Int) -> Date? {
        return ChartUtility.categoryValueInDate(model, categoryIndex: index)
    }
    
    func monthAbbreviationFromInt(_ month: Int) -> String {
        let ma = Calendar.current.shortMonthSymbols
        return ma[month - 1]
    }
}


struct StockMicroChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.stockModels) { model in
                StockMicroChart(model)
                    .frame(height: 260)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
    
