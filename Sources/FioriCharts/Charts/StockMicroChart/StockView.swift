//
//  StockView.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 12/18/19.
//  Copyright © 2019 sstadelman. All rights reserved.
//

import SwiftUI
/*
enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}*/

struct StockView: View {
    @EnvironmentObject var model: ChartModel
    
    @State var closestPoint:CGPoint = .zero
    @State var closestDataIndex:Int = 0
    @State var showIndicator = false
    @State var draggingStockView = false
    
    // scale is not allowed to be less than 1.0
    @State var lastScale: CGFloat = 1.0
    @State var lastStartPos: Int = 0
    
    let stockAxisDataSource = StockAxisDataSource()
    
    init() {
        lastScale = 0
        lastStartPos = 0
    }
    
    @GestureState var dragState = DragState.inactive
    //@GestureState var position = CGPoint.zero
    
    var body: some View {
        GeometryReader { geometry in
            self.chartView(in: geometry.frame(in: .local))
        }
    }
    
    func chartView(in rect: CGRect) -> some View {
        let xAxisHeight:CGFloat = 24
        let yAxisWidth:CGFloat = 20
        
        let width = rect.size.width - yAxisWidth
        let height = rect.size.height - xAxisHeight
        let linesRect = CGRect(x: yAxisWidth, y: 0, width: width, height: height)
        
        // drag to show the indicator
        let pan = LongPressGesture(minimumDuration: 0.5)
            .sequenced(before: DragGesture())
            .onChanged({ value in
                switch value {
                case .second(true, let drag):
                    if let value = drag {
                        self.showIndicator = true
                        self.closestPoint = self.calClosestDataPoint(toPoint: value.location, rect: linesRect)
                    }
                default:
                    break
                }
            })
            .onEnded({ _ in
                self.showIndicator = false
            })
        
        // drag chart horizontally or drag to show the indicator
        let drag = DragGesture()
            .onChanged({ value in
                // not zoomed in
                if self.model.scale == 1.0 {
                    self.showIndicator = true
                    self.closestPoint = self.calClosestDataPoint(toPoint: value.location, rect: linesRect)
                    return
                }
                
                self.draggingStockView = true
                let maxPos = Int(linesRect.size.width * (self.model.scale - 1))
                let tmp = self.lastStartPos - Int(value.translation.width)
                if self.model.panChartToDataPointOnly {
                    let unitWidth: CGFloat = linesRect.size.width * self.model.scale / CGFloat(StockUtility.numOfDataItmes(self.model) - 1)
                    let closestIndex = Int(CGFloat(tmp) / unitWidth)
                    self.model.startPos = Int(CGFloat(closestIndex) * unitWidth).clamp(low: 0, high: maxPos)
                }
                else {
                    self.model.startPos = tmp.clamp(low: 0, high: maxPos)
                }
            })
            .onEnded({ value in
                self.showIndicator = false
                self.draggingStockView = false
                self.lastStartPos = self.model.startPos
            })
        
        // zoom in & out
        let mag = MagnificationGesture()
            .onChanged({ value in
                self.showIndicator = false
                let count = StockUtility.numOfDataItmes(self.model)
                let maxScale = max(1, CGFloat(count - 1) / 2)
                let tmp = self.lastScale * value.magnitude
                self.model.scale = tmp.clamp(low: 1.0, high: maxScale)
                let width = linesRect.size.width
                let midPos: CGFloat = (CGFloat(self.lastStartPos) + width / 2) / (self.lastScale * width)
                
                let maxPos: Int = Int(width * (self.model.scale - 1))
                self.model.startPos = Int(midPos * width * self.model.scale - width/2).clamp(low: 0, high: maxPos)
            })
            .onEnded({ value in
                self.lastScale = self.model.scale
                self.lastStartPos = self.model.startPos
            })
            .exclusively(before: drag)

        // calculate display range
        let minVal = CGFloat(model.ranges?[model.currentSeriesIndex].lowerBound ?? 0)
        let maxVal = CGFloat(model.ranges?[model.currentSeriesIndex].upperBound ?? 1)
        var displayMinVal: CGFloat = minVal - (maxVal - minVal) * 0.2
        var displayMaxVal: CGFloat = maxVal + (maxVal - minVal) * 0.2
        
        if minVal >= 0 && maxVal >= 0 && displayMinVal < 0 {
            displayMinVal = 0
        }
        
        if model.numericAxis.isZeroBased {
            displayMinVal = 0
        }
        
        if let tmp = model.numericAxis.explicitMin {
            displayMinVal = CGFloat(tmp)
        }

        if let tmp = model.numericAxis.explicitMax {
            displayMaxVal = CGFloat(tmp)
        }
        
        return ZStack {
            if model.userInteractionEnabled {
                StockLinesView(rect: linesRect, displayRange: displayMinVal...displayMaxVal)
                    .frame(width: linesRect.size.width, height: linesRect.size.height)
                    .offset(x: linesRect.origin.x/2, y: -xAxisHeight/2)
                    .opacity(draggingStockView ? 0.4 : 1.0)
                    .gesture(pan)
                    .gesture(drag)
                    .gesture(mag)
            }
            else {
                StockLinesView(rect: linesRect, displayRange: displayMinVal...displayMaxVal)
                    .offset(x: linesRect.origin.x/2, y: -xAxisHeight/2)
            }
            
            XAxisView(rect: CGRect(x: yAxisWidth, y: rect.size.height - xAxisHeight, width: width, height: xAxisHeight), axisDataSource: stockAxisDataSource)
            
            YAxisView(rect: CGRect(x:0, y: 0, width: yAxisWidth, height: height), chartWidth: linesRect.size.width, displayRange: displayMinVal...displayMaxVal, axisDataSource: stockAxisDataSource)
            
            if self.showIndicator && closestDataIndex >= 0 {
                StockIndicatorView(rect: linesRect, closestPoint: $closestPoint, closestDataIndex: $closestDataIndex)
            }
        }
    }
    
    func calClosestDataPoint(toPoint: CGPoint, rect: CGRect) -> CGPoint {
        let width = rect.size.width
        
        let unitWidth: CGFloat = width * model.scale / CGFloat(StockUtility.numOfDataItmes(model) - 1)
        let startIndex = Int((CGFloat(model.startPos) / unitWidth).rounded(.up))
        let startOffset: CGFloat = (unitWidth - CGFloat(model.startPos).truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
        
        let minVal = CGFloat(model.ranges?[model.currentSeriesIndex].lowerBound ?? 0)
        let maxVal = CGFloat(model.ranges?[model.currentSeriesIndex].upperBound ?? 0)
        let index: Int = Int((toPoint.x - startOffset) / unitWidth + 0.5) + startIndex
        
        self.closestDataIndex = index.clamp(low: 0, high: StockUtility.lastValidDimIndex(model))
        
        let currentData = StockUtility.dimensionValue(model, categoryIndex: self.closestDataIndex)
        let x = rect.origin.x + startOffset + CGFloat(self.closestDataIndex - startIndex) * unitWidth
        let y = rect.size.height - (CGFloat(currentData ?? 0) - minVal) * rect.size.height / (maxVal - minVal) + rect.origin.y
        
        return CGPoint(x: x, y: y)
    }
}

struct StockView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(Tests.stockModels) {
            StockView().environmentObject($0)
        }
        .frame(width:300, height: 200, alignment: .topLeading)
        .previewLayout(.sizeThatFits)
    }
}

class StockAxisDataSource : DefaultAxisDataSource {
    override func xAxisTitles(_ model: ChartModel, rect: CGRect) -> [AxisTitle] {
        let width = rect.size.width
        let startPosInFloat = CGFloat(model.startPos)
        let unitWidth: CGFloat = width * model.scale / CGFloat(StockUtility.numOfDataItmes(model) - 1)
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
    
    func findData(_ model: ChartModel, startIndex: Int, endIndex: Int, component: Calendar.Component, rect: CGRect, skipFirst: Bool = true) -> [AxisTitle] {
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
        
        return result
    }
    
    func calXPosforXAxisElement(_ model: ChartModel, dataIndex: Int, rect: CGRect) -> CGFloat {
        if dataIndex == 0 {
            return rect.origin.x
        }
        
        let width = rect.size.width
        let unitWidth: CGFloat = width * model.scale / CGFloat(StockUtility.numOfDataItmes(model) - 1)
        let startIndex = Int((CGFloat(model.startPos) / unitWidth).rounded(.up))
        let startOffset: CGFloat = (unitWidth - CGFloat(model.startPos).truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
        
        return rect.origin.x + startOffset + CGFloat(dataIndex - startIndex) * unitWidth
    }
    
    func getDateAtIndex(_ model: ChartModel, index: Int) -> Date? {
        return StockUtility.categoryValueInDate(model, categoryIndex: index)
    }
    
    func monthAbbreviationFromInt(_ month: Int) -> String {
        let ma = Calendar.current.shortMonthSymbols
        return ma[month - 1]
    }
}

