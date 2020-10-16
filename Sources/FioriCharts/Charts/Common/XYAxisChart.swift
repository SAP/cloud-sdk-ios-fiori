//
//  XYAxisChart.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/19/20.
//

import SwiftUI

struct ChartContentEnvironmentKey: EnvironmentKey {
    static let defaultValue: ChartContext = DefaultChartContext()
    
}

//swiftlint:disable implicit_getter
extension EnvironmentValues {
    var chartContext: ChartContext {
        get {
            return self[ChartContentEnvironmentKey]
        }
        
        set {
            self[ChartContentEnvironmentKey] = newValue
        }
    }
}

struct XYAxisChart<Content: View, Indicator: View>: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.layoutDirection) var layoutDirection
    @State var yAxisExpanded: Bool = false
  
    var chartView: Content
    var indicatorView: Indicator
    var chartContext: ChartContext
    
    init(chartContext: ChartContext, chartView: Content, indicatorView: Indicator) {
        self.chartView = chartView
        self.indicatorView = indicatorView
        self.chartContext = chartContext
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
        .padding(8)
        .environment(\.chartContext, chartContext)
        .contentShape(Rectangle())
    }
    
    // swiftlint:disable function_body_length
    func makeBody(in rect: CGRect) -> some View {
        let yAxisWidth = yAxisLabelsMaxWidth(rect)
        let secondaryYAxisWidth = yAxisLabelsMaxWidth(rect, secondary: true)
        let chartWidth = rect.size.width - yAxisWidth - secondaryYAxisWidth
        let xAxisBaselineHeight = model.categoryAxis.baseline.isHidden ? 0 : model.categoryAxis.baseline.width
        let xAxisLabelsHeight = xAxisLabelsMaxHeight(CGRect(x: 0, y: 0, width: chartWidth, height: rect.size.height))
        let xAxisHeight = xAxisBaselineHeight + xAxisLabelsHeight
        
        var xAxisRect, xAxisLabelsRect, yAxisRect, secondaryYAxisRect, chartRect: CGRect
        if model.chartType == .bar || model.chartType == .stackedBar {
            yAxisRect = CGRect(x: 0, y: 0, width: yAxisWidth, height: rect.size.height - xAxisHeight)
            secondaryYAxisRect = CGRect(x: 0, y: 0, width: secondaryYAxisWidth, height: rect.size.height - xAxisHeight)
            chartRect = CGRect(x: yAxisWidth, y: 0, width: chartWidth, height: rect.size.height - xAxisHeight)
            xAxisRect = CGRect(x: yAxisWidth, y: rect.size.height - xAxisHeight, width: chartWidth, height: xAxisHeight)
            xAxisLabelsRect = .zero
        } else {
            switch model.valueType {
            case .allPositive:
                yAxisRect = CGRect(x: 0, y: 0, width: yAxisWidth, height: rect.size.height - xAxisHeight)
                secondaryYAxisRect = CGRect(x: 0, y: 0, width: secondaryYAxisWidth, height: rect.size.height - xAxisHeight)
                chartRect = CGRect(x: yAxisWidth, y: 0, width: chartWidth, height: rect.size.height - xAxisHeight)
                xAxisRect = CGRect(x: yAxisWidth, y: rect.size.height - xAxisHeight, width: chartWidth, height: xAxisHeight)
                xAxisLabelsRect = .zero
            case .allNegative:
                if model.xAxisLabelsPosition == .dynamic {
                    yAxisRect = CGRect(x: 0, y: xAxisHeight, width: yAxisWidth, height: rect.size.height - xAxisHeight)
                    secondaryYAxisRect = CGRect(x: 0, y: xAxisHeight, width: secondaryYAxisWidth, height: rect.size.height - xAxisHeight)
                    xAxisRect = CGRect(x: yAxisWidth, y: 0, width: chartWidth, height: xAxisHeight)
                    chartRect = CGRect(x: yAxisWidth, y: 0, width: chartWidth, height: rect.size.height - xAxisHeight)
                    xAxisLabelsRect = .zero
                } else {
                    yAxisRect = CGRect(x: 0, y: xAxisBaselineHeight, width: yAxisWidth, height: rect.size.height - xAxisHeight)
                    secondaryYAxisRect = CGRect(x: 0, y: xAxisBaselineHeight, width: secondaryYAxisWidth, height: rect.size.height - xAxisHeight)
                    xAxisRect = CGRect(x: yAxisWidth, y: 0, width: chartWidth, height: xAxisBaselineHeight)
                    chartRect = CGRect(x: yAxisWidth, y: xAxisBaselineHeight, width: chartWidth, height: rect.size.height - xAxisHeight)
                    xAxisLabelsRect = CGRect(x: yAxisWidth, y: rect.size.height - xAxisLabelsHeight, width: chartWidth, height: xAxisLabelsHeight)
                }
            case .mixed:
                if model.xAxisLabelsPosition == .dynamic {
                    yAxisRect = CGRect(x: 0, y: 0, width: yAxisWidth, height: rect.size.height)
                    secondaryYAxisRect = CGRect(x: 0, y: 0, width: secondaryYAxisWidth, height: rect.size.height)
                    chartRect = CGRect(x: yAxisWidth, y: 0, width: chartWidth, height: rect.size.height)
                } else {
                    yAxisRect = CGRect(x: 0, y: 0, width: yAxisWidth, height: rect.size.height - xAxisLabelsHeight)
                    secondaryYAxisRect = CGRect(x: 0, y: 0, width: secondaryYAxisWidth, height: rect.size.height - xAxisLabelsHeight)
                    chartRect = CGRect(x: yAxisWidth, y: 0, width: chartWidth, height: rect.size.height - xAxisLabelsHeight)
                }
                var baselineYPos: CGFloat = rect.size.height - xAxisHeight
                var useSecondary = false
                if yAxisWidth == 0 {
                    useSecondary = true
                }
                let yAxisLabels = chartContext.yAxisLabels(model, rect: chartRect, layoutDirection: layoutDirection, secondary: useSecondary)
                for label in yAxisLabels {
                    if abs(label.value) < 0.001 {
                        baselineYPos = label.pos.y
                        break
                    }
                }
                
                if model.xAxisLabelsPosition == .dynamic {
                    xAxisRect = CGRect(x: yAxisWidth, y: baselineYPos, width: chartWidth, height: xAxisHeight)
                    xAxisLabelsRect = .zero
                } else {
                    xAxisRect = CGRect(x: yAxisWidth, y: baselineYPos, width: chartWidth, height: xAxisBaselineHeight)
                    xAxisLabelsRect = CGRect(x: yAxisWidth, y: rect.size.height - xAxisLabelsHeight, width: chartWidth, height: xAxisLabelsHeight)
                }
            }
        }
        
        let doubleTapGesture = TapGesture(count: 2).onEnded {
            self.yAxisExpanded.toggle()
        }
        
        return HStack(alignment: .top, spacing: 0) {
            // primary y axis
            VStack(spacing: 0) {
                if yAxisWidth > 0 {
                    if model.userInteractionEnabled {
                        YAxisView()
                            .frame(height: yAxisRect.size.height)
                            .position(x: yAxisRect.size.width/2, y: yAxisRect.origin.y + yAxisRect.size.height / 2)
                            .contentShape(Rectangle())
                            .gesture(doubleTapGesture)
                    } else {
                        YAxisView()
                                .frame(height: yAxisRect.size.height)
                                .position(x: yAxisRect.size.width/2, y: yAxisRect.origin.y + yAxisRect.size.height / 2)
                                .contentShape(Rectangle())
                    }
                }
            }.frame(width: yAxisRect.size.width, height: rect.size.height)
            
            // plot view
            VStack(alignment: .leading, spacing: 0) {
                if model.chartType == .bar || model.chartType == .stackedBar || model.valueType == .allPositive {
                    GridLinesAndChartView(chartView: chartView, indicatorView: indicatorView, scale: model.scale, startPosX: model.startPos.x, startPosY: model.startPos.y)
                        .frame(width: chartRect.width, height: chartRect.height)
                        .zIndex(3)
                    
                    XAxisView()
                        .frame(height: xAxisRect.height)
                } else if model.valueType == .allNegative {
                    XAxisView(isShowBaselineOnly: model.xAxisLabelsPosition == .fixedBottom ? true : false)
                        .frame(height: xAxisRect.height)
                    
                    GridLinesAndChartView(chartView: chartView, indicatorView: indicatorView, scale: model.scale, startPosX: model.startPos.x, startPosY: model.startPos.y)
                        .frame(width: chartRect.width, height: chartRect.height)
                        .zIndex(3)
                    
                    if model.xAxisLabelsPosition == .fixedBottom {
                        XAxisView(isShowLabelsOnly: true)
                            .frame(height: xAxisLabelsRect.height)
                    }
                } else {
                    ZStack {
                        XAxisView(isShowBaselineOnly: model.xAxisLabelsPosition == .fixedBottom ? true : false)
                            .frame(height: xAxisRect.height)
                            .position(x: xAxisRect.size.width / 2, y: xAxisRect.origin.y + xAxisRect.size.height / 2)
                        
                        GridLinesAndChartView(chartView: chartView, indicatorView: indicatorView, scale: model.scale, startPosX: model.startPos.x, startPosY: model.startPos.y)
                            .frame(width: chartRect.width, height: chartRect.height)
                    }.zIndex(3)
                    
                    if model.xAxisLabelsPosition == .fixedBottom {
                        XAxisView(isShowLabelsOnly: true)
                            .frame(height: xAxisLabelsRect.height)
                    }
                }
            }.zIndex(2)
            
            // secondary numerix axis
            VStack(spacing: 0) {
                if secondaryYAxisWidth > 0 {
                    YAxisView(secondary: true)
                        .frame(height: secondaryYAxisRect.size.height)
                        .position(x: secondaryYAxisRect.size.width/2, y: secondaryYAxisRect.origin.y + secondaryYAxisRect.size.height / 2)
                        .zIndex(2)
                }
            }.frame(width: secondaryYAxisRect.size.width, height: rect.size.height)
        }
    }
    
    func xAxisLabelsMaxHeight(_ rect: CGRect) -> CGFloat {
        let labels = chartContext.xAxisLabels(model, rect: rect)
        if labels.isEmpty || model.categoryAxis.labels.isHidden {
            return 0
        }
        
        var height: CGFloat = 16
        var totalWidth: CGFloat = 0
        var prevXPos: CGFloat = -100000
        var prevLabelWidth: CGFloat = 0
        for label in labels {
            let size: CGSize = label.size
            
            // spacing btw baseline and labels are 3pt
            height = max(height, size.height)
            
            // check if the gap btw two adjacent labels is greater than 4pt
            if label.pos.x < prevXPos + prevLabelWidth / 2.0 + size.width / 2.0 + ChartViewLayout.minSpacingBtwXAxisLabels {
                totalWidth += rect.size.width
            }
            // min spacing btw labels are 4pt
            if size.width > 0 {
                totalWidth += size.width + ChartViewLayout.minSpacingBtwXAxisLabels
                prevXPos = label.pos.x
                prevLabelWidth = size.width
            }
        }
        totalWidth -= 4
        
        // show nothing
        if model.chartType != .stock && model.categoryAxis.labelLayoutStyle == .allOrNothing && totalWidth > rect.size.width {
            chartContext.isEnoughSpaceToShowXAxisLables = false
            height = 0
        } else {
            chartContext.isEnoughSpaceToShowXAxisLables = true
        }

        return height > 0 ? height + 3 : 0
    }
    
    /**
     Minimum: 20px from left edge of content area
     Maximum: 35% of content area
     Expanded State: when the y-axis label area its at its maximum width and values are still truncated, the user can double tap the y-axis label area to expand the y-axis label area to the right. This will increase the width of the labels up to 60% of the content area. Double tapping the expanded y-axis label area will return it to its maximum.
     */
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
    
        var maxPointRadius: CGFloat = 0
        if model.chartType == .line || model.chartType == .area {
            let maxPointDiameter = model.seriesAttributes.reduce(0) { (result, seriesAttribute) -> CGFloat in
                return max(seriesAttribute.point.diameter, result)
            }

            maxPointRadius = maxPointDiameter / 2 + ChartViewLayout.extraSelectedPointRadiusWidth + ChartViewLayout.extraSelectedPointWhiteBoderRadiusWidth
        }
        
        // min width is 20
        var width: CGFloat = ChartViewLayout.minYAxisViewWidth
        let labels = chartContext.yAxisLabels(model, layoutDirection: layoutDirection, secondary: secondary)
        
        for label in labels {
            let size = label.size

            // spacing btw baseline and labels are 3pt
            width = max(width, size.width + max(axis.baseline.width / 2.0, maxPointRadius) + ChartViewLayout.minSpacingBtwYAxisLabelAndBaseline)
        }
        
        if secondary && width > rect.size.width * ChartViewLayout.maxSecondaryYAxisViewWidthRatio {
            width = rect.size.width * ChartViewLayout.maxSecondaryYAxisViewWidthRatio
        } else if !secondary && width > rect.size.width * ChartViewLayout.maxYAxisViewWidthRatio && !yAxisExpanded {
            width = rect.size.width * ChartViewLayout.maxYAxisViewWidthRatio
        } else if !secondary && width > rect.size.width * ChartViewLayout.maxExpandedYAxisViewWidthRatio && yAxisExpanded {
            width = rect.size.width * ChartViewLayout.maxExpandedYAxisViewWidthRatio
        }
        
        return width
    }
}

struct XYAxisChart_Previews: PreviewProvider {
    static var previews: some View {
        XYAxisChart(chartContext: DefaultChartContext(),
                    chartView: LinesView(),
                    indicatorView: LineIndicatorView())
            .environmentObject(Tests.lineModels[0])
            .frame(width: 300, height: 400)
            .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 16))
    }
}
