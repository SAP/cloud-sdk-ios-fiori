import SwiftUI

struct StockMicroChart: View {
    @ObservedObject var model: ChartModel
    
    var body: some View {
        XYAxisChart(model: model,
                    chartContext: StockChartContext(),
                    chartView: StockLinesView(),
                    indicatorView: LineIndicatorView())
    }
}

class StockChartContext: LineChartContext {
    var lastCategoryIndexRangeForXAxisView = -1 ... -1
    
    override func plotPath(_ model: ChartModel) -> [[[Path]]] {
        if !model.path.isEmpty {
            return model.path
        }
        
        var result = [[[Path]]]()
        
        for seriesIndex in 0 ..< model.numOfSeries() {
            if seriesIndex == model.indexOfStockSeries {
                let seriesPath = plotLinePath(model, for: seriesIndex)
                result.append(seriesPath)
            } else {
                result.append([[Path()]])
            }
        }
    
        model.path = result
        
        return result
    }
    
    override func xAxisLabels(_ model: ChartModel, rect: CGRect, plotViewSize: CGSize) -> [AxisTitle] {
        self.xAxisGridLineLabels(model, rect: rect, isLabel: true, plotViewSize: plotViewSize)
    }

    override func xAxisGridlines(_ model: ChartModel, rect: CGRect, plotViewSize: CGSize) -> [AxisTitle] {
        self.xAxisGridLineLabels(model, rect: rect, isLabel: false, plotViewSize: plotViewSize)
    }
    
    func stockXAxisLabels(_ model: ChartModel, plotViewSize: CGSize) -> [AxisTitle] {
        let count = model.numOfCategories()
        if count < 1 {
            return []
        }
        
        let component = self.calendarComponentForXAxisLables(model, plotViewSize: plotViewSize)
        if let result = model.stockXAxisLabels[component.hashValue] {
            return result
        }
        
        let width: CGFloat = 1
        let startIndex = 0
        let endIndex = count - 1
        let unitWidth = max(width / CGFloat(max(count - 1, 1)), ChartViewLayout.minUnitWidth)
        var result: [AxisTitle] = []
        
        var prev = -1
        for i in startIndex ... endIndex {
            guard let date = getDateAtIndex(model, index: i) else {
                continue
            }
            
            let cur = Calendar.current.component(component, from: date)
            if cur != prev {
                if let title = xAxisFormattedString(model, index: i, component: component) {
                    let size = title.boundingBoxSize(with: model.categoryAxis.labels.fontSize)
                    let x = CGFloat(i) * unitWidth
                    
                    let label = AxisTitle(index: i,
                                          title: title,
                                          pos: CGPoint(x: x, y: 0),
                                          size: size)
                    result.append(label)
                    
                    prev = cur
                }
            }
        }
        
        model.stockXAxisLabels[component.hashValue] = result
        
        return result
    }
    
    override func xAxisGridLineLabels(_ model: ChartModel, rect: CGRect, isLabel: Bool, plotViewSize: CGSize) -> [AxisTitle] {
        if abs(CGFloat(model.categoryAxis.baseline.width) - rect.size.height) < 1 {
            return []
        }
        
        /// get xAxisLabels in relative position
        let tmpRet: [AxisTitle] = self.stockXAxisLabels(model, plotViewSize: plotViewSize)
        
        let count = model.numOfCategories()
        let width = rect.size.width
        
        let tmpScaleX = scaleX(model, plotViewSize: plotViewSize)
        let tmpStartPosition = startPosition(model, plotViewSize: plotViewSize)
        let startPosX = tmpStartPosition.x * tmpScaleX * rect.size.width
        let unitWidth: CGFloat = max(width * tmpScaleX / CGFloat(max(count - 1, 1)), ChartViewLayout.minUnitWidth)
        let startIndex = Int(startPosX / unitWidth).clamp(low: 0, high: count - 1)
        let endIndex = Int((startPosX + rect.size.width) / unitWidth).clamp(low: startIndex, high: count - 1)
        let catIndexRange = startIndex ... endIndex
        
        let ret = tmpRet.compactMap { (label) -> AxisTitle? in
            let x = label.pos.x * tmpScaleX * width - startPosX
            if label.index >= startIndex, label.index <= endIndex, x >= 0, x <= width {
                return label
            } else {
                return nil
            }
        }
        var prevXPos = CGFloat(Int.min)
        
        if model.categoryAxis.labelLayoutStyle == .range {
            var result: [AxisTitle] = []
            if catIndexRange.count >= 1 {
                var item = ret[0]
                
                let offset = isLabel ? min(item.size.width, (rect.size.width - 2) / 2) / 2 : 0
                let x = item.pos.x * tmpScaleX * rect.size.width - startPosX + offset
                item.x(x)
                
                result.append(item)
                
                if ret.count >= 2 {
                    var item = ret[ret.count - 1]
                    let x = item.pos.x * tmpScaleX * rect.size.width - startPosX - offset
                    item.x(x)
                    
                    result.append(item)
                }
            }
            
            return result
        } else {
            var result: [AxisTitle] = []
            for item in ret {
                var axisTitle = item
                let x = item.pos.x * tmpScaleX * width - startPosX
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
        self.categoryValueInDate(model, categoryIndex: index)
    }
    
    func monthAbbreviationFromInt(_ month: Int) -> String {
        let ma = Calendar.current.shortMonthSymbols
        return ma[month - 1]
    }
    
    func calendarComponentForXAxisLables(_ model: ChartModel, plotViewSize: CGSize) -> Calendar.Component {
        let count = model.numOfCategories()
        if count < 2 {
            return .minute
        }
        
        let width: CGFloat = 1
        let tmpScaleX = scaleX(model, plotViewSize: plotViewSize)
        let tmpStartPosition = startPosition(model, plotViewSize: plotViewSize)
        let startPosX = tmpStartPosition.x * tmpScaleX * width
        let unitWidth = max(width * tmpScaleX / CGFloat(max(count - 1, 1)), ChartViewLayout.minUnitWidth)
        var startIndex = Int((startPosX / unitWidth).rounded(.up))
        var endIndex = max(Int(((startPosX + width) / unitWidth).rounded(.down)), startIndex)
    
        if startIndex == endIndex {
            if endIndex == count - 1 {
                startIndex = endIndex - 1
            } else {
                endIndex = startIndex + 1
            }
        }
        guard let startDate = getDateAtIndex(model, index: startIndex),
              let endDate = getDateAtIndex(model, index: endIndex)
        else {
            return .minute
        }
        
        let duration = endDate.timeIntervalSince(startDate) // / TimeInterval(max(1, endIndex - startIndex))
    
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
    
    // swiftlint:disable cyclomatic_complexity
    func xAxisFormattedString(_ model: ChartModel, index: Int, component: Calendar.Component) -> String? {
        guard let date = getDateAtIndex(model, index: index) else { return nil }
        let cur = Calendar.current.component(component, from: date)
        
        switch component {
        case .year:
            let components = Calendar.current.dateComponents([.year, .month], from: date)
            if let month = components.month {
                if month > 3, model.categoryAxis.labelLayoutStyle == .allOrNothing {
                    return nil
                }
            }
            return String(cur)
            
        case .month:
            let components = Calendar.current.dateComponents([.month, .day], from: date)
            if let day = components.day {
                if day > 7, model.categoryAxis.labelLayoutStyle == .allOrNothing {
                    return nil
                }
            }
            
            return self.monthAbbreviationFromInt(cur)
            
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
                if component == .hour, minute != 0, model.categoryAxis.labelLayoutStyle == .allOrNothing {
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
    
    func categoryValueInDate(_ model: ChartModel, seriesIndex: Int, categoryIndex: Int) -> Date? {
        guard let dateString = ChartUtility.categoryValue(model, seriesIndex: seriesIndex, categoryIndex: categoryIndex) else { return nil }
        
        return ChartUtility.date(from: dateString)
    }
    
    func categoryValueInDate(_ model: ChartModel, categoryIndex: Int) -> Date? {
        self.categoryValueInDate(model, seriesIndex: model.currentSeriesIndex, categoryIndex: categoryIndex)
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
