//
//  XYAxisChart.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/19/20.
//

import SwiftUI

struct AxisDataSourceEnvironmentKey: EnvironmentKey {
    static let defaultValue: AxisDataSource = DefaultAxisDataSource()
    
}

//swiftlint:disable implicit_getter
extension EnvironmentValues {
    var axisDataSource: AxisDataSource {
        get {
            return self[AxisDataSourceEnvironmentKey]
        }
        
        set {
            self[AxisDataSourceEnvironmentKey] = newValue
        }
    }
}

struct XYAxisChart<Content: View, Indicator: View>: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.layoutDirection) var layoutDirection
    
    var chartView: Content
    var indicatorView: Indicator
    var axisDataSource: AxisDataSource
    
    init(axisDataSource: AxisDataSource, chartView: Content, indicatorView: Indicator) {
        self.chartView = chartView
        self.indicatorView = indicatorView
        self.axisDataSource = axisDataSource
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }.padding(8)
        .environment(\.axisDataSource, axisDataSource)
    }
    
    // swiftlint:disable function_body_length
    func makeBody(in rect: CGRect) -> some View {
        let yAxisWidth = yAxisLabelsMaxWidth(rect)
        let secondaryYAxisWidth = yAxisLabelsMaxWidth(rect, secondary: true)
        let chartWidth = rect.size.width - yAxisWidth - secondaryYAxisWidth
        let xAxisHeight = xAxisLabelsMaxHeight(CGRect(x: 0, y: 0, width: chartWidth, height: rect.size.height   ))
        
        let xAxisRect, yAxisRect, secondaryYAxisRect, chartRect: CGRect
        switch model.valueType {
        case .allPositive:
            yAxisRect = CGRect(x: 0, y: 0, width: yAxisWidth, height: rect.size.height - xAxisHeight)
            secondaryYAxisRect = CGRect(x: 0, y: 0, width: secondaryYAxisWidth, height: rect.size.height - xAxisHeight)
            chartRect = CGRect(x: yAxisWidth, y: 0, width: chartWidth, height: rect.size.height - xAxisHeight)
            xAxisRect = CGRect(x: yAxisWidth, y: rect.size.height - xAxisHeight, width: chartWidth, height: xAxisHeight)
        case .allNegative:
            yAxisRect = CGRect(x: 0, y: xAxisHeight, width: yAxisWidth, height: rect.size.height - xAxisHeight)
            secondaryYAxisRect = CGRect(x: 0, y: xAxisHeight, width: secondaryYAxisWidth, height: rect.size.height - xAxisHeight)
            chartRect = CGRect(x: yAxisWidth, y: 0, width: chartWidth, height: rect.size.height - xAxisHeight)
            xAxisRect = CGRect(x: yAxisWidth, y: 0, width: chartWidth, height: xAxisHeight)
        case .mixed:
            yAxisRect = CGRect(x: 0, y: 0, width: yAxisWidth, height: rect.size.height)
            secondaryYAxisRect = CGRect(x: 0, y: 0, width: secondaryYAxisWidth, height: rect.size.height)
            chartRect = CGRect(x: yAxisWidth, y: 0, width: chartWidth, height: rect.size.height)
            var baselineYPos: CGFloat = rect.size.height - xAxisHeight
            var useSecondary = false
            if yAxisWidth == 0 {
                useSecondary = true
            }
            let yAxisLabels = axisDataSource.yAxisLabels(model, rect: chartRect, layoutDirection: layoutDirection, secondary: useSecondary)
            for label in yAxisLabels {
                if abs(label.value) < 0.001 {
                    baselineYPos = label.pos.y
                    break
                }
            }
            
            xAxisRect = CGRect(x: yAxisWidth, y: baselineYPos, width: chartWidth, height: xAxisHeight)
        }
        
        return HStack(alignment: .top, spacing: 0) {
            VStack(spacing: 0) {
                if yAxisWidth > 0 {
                    YAxisView(axisDataSource: axisDataSource)
                        .frame(height: yAxisRect.size.height)
                        .position(x: yAxisRect.size.width/2, y: yAxisRect.origin.y + yAxisRect.size.height / 2)
                        .environmentObject(self.model)
                }
            }.frame(width: yAxisRect.size.width, height: rect.size.height)
            
            VStack(alignment: .leading, spacing: 0) {
                if model.valueType == .allPositive {
                    GridLinesAndChartView(chartView: chartView, indicatorView: indicatorView)
                        .frame(width: chartRect.width, height: chartRect.height)
                    
                    XAxisView(axisDataSource: axisDataSource)
                        .frame(height: xAxisRect.height)
                        .environmentObject(self.model)
                } else if model.valueType == .allNegative {
                    XAxisView(axisDataSource: axisDataSource)
                        .frame(height: xAxisRect.height)
                        .zIndex(1)
                        .environmentObject(self.model)
                    
                    GridLinesAndChartView(chartView: chartView, indicatorView: indicatorView)
                    .frame(width: chartRect.width, height: chartRect.height)
                } else {
                    ZStack {
                        GridLinesAndChartView(chartView: chartView, indicatorView: indicatorView)
                        .frame(width: chartRect.width, height: chartRect.height)
                        
                        XAxisView(axisDataSource: axisDataSource)
                            .frame(height: xAxisRect.height)
                            .position(x: xAxisRect.size.width / 2, y: xAxisRect.origin.y + xAxisRect.size.height / 2)
                            .environmentObject(self.model)
                    }
                }
            }
            
            // secondary numerix axis
            VStack(spacing: 0) {
                if secondaryYAxisWidth > 0 {
                    YAxisView(axisDataSource: axisDataSource, secondary: true)
                        .frame(height: secondaryYAxisRect.size.height)
                        .position(x: secondaryYAxisRect.size.width/2, y: secondaryYAxisRect.origin.y + secondaryYAxisRect.size.height / 2)
                        .zIndex(2)
                        .environmentObject(self.model)
                }
            }.frame(width: secondaryYAxisRect.size.width, height: rect.size.height)
        }
    }
    
    func xAxisLabelsMaxHeight(_ rect: CGRect) -> CGFloat {
        let labels = axisDataSource.xAxisLabels(model, rect: rect)
        if labels.isEmpty || (model.categoryAxis.baseline.isHidden && model.categoryAxis.labels.isHidden) {
            return 0
        }
        
        if !model.categoryAxis.baseline.isHidden && model.categoryAxis.labels.isHidden {
            return max(0, model.categoryAxis.baseline.width)
        }
        
        var height: CGFloat = 16
        var totalWidth: CGFloat = 0
        var prevXPos: CGFloat = -100000
        var prevLabelWidth: CGFloat = 0
        for label in labels {
            let size: CGSize = label.title.isEmpty ? .zero : label.title.boundingBoxSize(with: model.categoryAxis.labels.fontSize)
            // spacing btw baseline and labels are 3pt
            height = max(height, size.height + model.categoryAxis.baseline.width + 3)
            
            // check if the gap btw two adjacent labels is greater than 4pt
            if label.pos.x < prevXPos + prevLabelWidth / 2.0 + size.width / 2.0 + 4 {
                totalWidth += rect.size.width
            }
            // min spacing btw labels are 4pt
            if size.width > 0 {
                totalWidth += size.width + 4
                prevXPos = label.pos.x
                prevLabelWidth = size.width
            }
        }
        totalWidth -= 4
        
        // show nothing
        if model.chartType != .stock && model.categoryAxis.labelLayoutStyle == .allOrNothing && totalWidth > rect.size.width {
            axisDataSource.isEnoughSpaceToShowXAxisLables = false
            height = 0
        }
        
        return height + model.categoryAxis.baseline.width + 3
    }
    
    func yAxisLabelsMaxWidth(_ rect: CGRect, secondary: Bool = false) -> CGFloat {
        let allIndexs = IndexSet(integersIn: 0 ..< model.data.count)
        var indexes: [Int] = allIndexs.sorted()
        
        // For clustered line, area and combo charts this is the secondary Y axis.
        if model.chartType == .line || model.chartType == .area || model.chartType == .combo {
            indexes = secondary ? model.indexesOfSecondaryValueAxis.sorted() : model.indexesOfSecondaryValueAxis.symmetricDifference(allIndexs).sorted()
        } else {
            if secondary {
                return 0
            }
        }
        
        let axis = secondary ? model.secondaryNumericAxis : model.numericAxis
        
        if indexes.isEmpty {
            return 0
        }
        
        if axis.labels.isHidden && axis.gridlines.isHidden {
            return 0
        }
        
        if axis.labels.isHidden {
            return axis.gridlines.width
        }
    
        // min width is 20
        var width: CGFloat = 20
        let labels = axisDataSource.yAxisLabels(model, rect: rect, layoutDirection: layoutDirection, secondary: secondary)
        
        for label in labels {
            let size = label.title.boundingBoxSize(with: axis.labels.fontSize)
            // spacing btw baseline and labels are 3pt
            width = max(width, size.width + axis.baseline.width / 2.0 + 3)
        }
        if model.chartType == .bubble || model.chartType == .scatter {
            model.yAxisMaxWidth = max(width, model.yAxisMaxWidth)
        
            return model.yAxisMaxWidth
        } else {
            return width
        }
    }
}

struct XYAxisChart_Previews: PreviewProvider {
    static var previews: some View {
        XYAxisChart(axisDataSource: DefaultAxisDataSource(),
                    chartView: LinesView(),
                    indicatorView: LineIndicatorView())
            .environmentObject(Tests.lineModels[0])
            .frame(width: 300, height: 400)
            .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 16))
    }
}
