//
//  XAxisView.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct XAxisView: View {
    @EnvironmentObject var model: ChartModel
    
    let textColor = Color(#colorLiteral(red: 0.4376021028, green: 0.4471841455, blue: 0.4600644708, alpha: 1))
    var rect: CGRect
    
    var body: some View {
        var xAxisTitles = calXAxisTitles()
        xAxisTitles.insert(AxisTitle(index: 0, title: ""), at: 0)
        
        let strokeStyle = StrokeStyle(lineWidth: 1, lineCap: .round, lineJoin: .miter, miterLimit: 0, dash: [2, 4], dashPhase: 0)
        
        return ZStack {
            ForEach(xAxisTitles) { title in
                LineShape(pos1: CGPoint(x: self.calXPosforXAxisElement(dataIndex: title.index, rect: self.rect), y: 0),
                          pos2: CGPoint(x: self.calXPosforXAxisElement(dataIndex: title.index, rect: self.rect), y: self.rect.origin.y),
                          color: .gray,
                          width: 1,
                          strokeStyle: strokeStyle)
                
                Text(title.title)
                    .font(.footnote)
                    .foregroundColor(self.textColor)
                    .position(x: self.calXPosforXAxisElement(dataIndex: title.index, rect: self.rect),
                              y: self.rect.origin.y + self.rect.size.height / 2)
            }
        }
    }
    
    func calXAxisTitles() -> [AxisTitle] {
        var result: [AxisTitle] = []
        
        let startDate = getDateAtIndex(model.displayStartIndex)
        let endDate = getDateAtIndex(model.displayEndIndex)
        let duration = endDate.timeIntervalSince(startDate)
        
        if duration < 60 {
            result = findData(component: .second)
        }
        else if duration < 3600 {
            result = findData(component: .minute)
        }
        else if duration < 3600 * 24 { // hour
            result = findData(component: .hour)
        }
        else if duration < 3600 * 24 * 60 { // day
            result = findData(component: .day)
        }
        else if duration < 3600 * 24 * 31 * 14 { // month
            result = findData(component: .month)
        }
        else { // year
            result = findData(component: .year)
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
    
    func findData(component: Calendar.Component, skipFirst: Bool = true) -> [AxisTitle] {
        var result: [AxisTitle] = []
        
        var prev = -1
        for i in model.displayStartIndex...model.displayEndIndex{
            let date = getDateAtIndex(i)
            let cur = Calendar.current.component(component, from: date)
            if prev == -1 && skipFirst {
                prev = cur
            } else if cur != prev {
                if component == .month {
                    result.append(AxisTitle(index: i, title: monthAbbreviationFromInt(cur)))
                }
                else if component == .day {
                    result.append(AxisTitle(index: i, title: String("\(cur)(D)")))
                }
                else if component == .hour {
                    result.append(AxisTitle(index: i, title: String("\(cur):00")))
                }
                else if component == .minute {
                    result.append(AxisTitle(index: i, title: String("\(cur)(M)")))
                }
                else {
                    result.append(AxisTitle(index: i, title: String(cur)))
                }
                prev = cur
            }
        }
        
        return result
    }
    
    func calXPosforXAxisElement(dataIndex: Int, rect: CGRect) -> CGFloat {
        let count = model.displayEndIndex - model.displayStartIndex
        return rect.origin.x + CGFloat(dataIndex - model.displayStartIndex) * rect.size.width / CGFloat(count)
    }
    
    func getDateAtIndex(_ index: Int) -> Date {
        let count = model.data[model.selectedSeriesIndex!].count
//        if StockUtility.isItADayModeAndNotClosed(model) {
//            if index >= count  {
//                let startTime = model.data[model.selectedSeriesIndex!].first!.date
//                let seconds = index * 3600 / StockUtility.calNumOfDataItemsInDayModePerHour(model)
//                let date = startTime.addingTimeInterval(TimeInterval(seconds))
//
//                return date
//            }
//        }
        
        return StockUtility.categoryValueInDate(model, categoryIndex: index)!
    }
    
    func getPriceAtIndex(_ index: Int) -> CGFloat {
        let count = model.data[model.selectedSeriesIndex!].count
//        if StockUtility.isItADayModeAndNotClosed(model) {
//            if index >= count  {
//                return -1
//            }
//        }
        
        return CGFloat(StockUtility.dimensionValue(model, categoryIndex: index) ?? -1)
    }
    
    func monthAbbreviationFromInt(_ month: Int) -> String {
        let ma = Calendar.current.shortMonthSymbols
        return ma[month - 1]
    }
}

struct XAxisView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.stockModels) {
                XAxisView(rect: CGRect(x: 0, y: 180, width: 300, height: 20)).environmentObject(StockUtility.preprocessModel($0))
            }
            .frame(width:300, height: 200, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
        }
        
    }
}
