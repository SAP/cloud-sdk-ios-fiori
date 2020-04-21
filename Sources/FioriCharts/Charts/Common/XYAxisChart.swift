//
//  XYAxisChart.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/19/20.
//

import SwiftUI

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
}

struct XYAxisChart<Content: View, Indicator: View>: View {
    @ObservedObject var model: ChartModel
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.layoutDirection) var layoutDirection
    
    var chartView: Content
    var indicatorView: Indicator
    var axisDataSource: AxisDataSource
    
    //    @State var closestPoint:CGPoint = .zero
    //    @State var closestDataIndex:Int = 0
    @State var showIndicator = false
    @State var draggingChartView = false
    
    // scale is not allowed to be less than 1.0
    @State var lastScale: CGFloat = 1.0
    @State var lastStartPos: Int = 0
    @GestureState var dragState = DragState.inactive
    //@State private var xAxisHeight:CGFloat = 20
    @State private var yAxisWidth: CGFloat = 20
    @State private var xAxisSize: CGSize = CGSize(width: 0, height: 24)
    @State private var yAxisSize: CGSize = CGSize(width: 20, height: 0)
    
    init(_ chartModel: ChartModel, axisDataSource: AxisDataSource, chartView: Content, indicatorView: Indicator) {
        self.model = chartModel
        self.chartView = chartView
        self.indicatorView = indicatorView
        self.axisDataSource = axisDataSource
        
        lastScale = 0
        lastStartPos = 0
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }.padding(8)
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let xAxisHeight = xAxisLabelsMaxHeight(rect)
        let yAxisWidth = yAxisLabelsMaxWidth()
        
        let displayRange = ChartUtility.displayRange(model)
        let chartWidth = rect.size.width - yAxisWidth
        
        let xAxisRect, yAxisRect, chartRect: CGRect
        switch model.valueType {
        case .allPositive:
            yAxisRect = CGRect(x: 0, y: 0, width: yAxisWidth, height: rect.size.height - xAxisHeight)
            chartRect = CGRect(x: yAxisWidth, y: 0, width: chartWidth, height: rect.size.height - xAxisHeight)
            xAxisRect = CGRect(x: yAxisWidth, y: rect.size.height - xAxisHeight, width: chartWidth, height: xAxisHeight)
        case .allNegative:
            yAxisRect = CGRect(x: 0, y: xAxisHeight, width: yAxisWidth, height: rect.size.height - xAxisHeight)
            chartRect = CGRect(x: yAxisWidth, y: 0, width: chartWidth, height: rect.size.height - xAxisHeight)
            xAxisRect = CGRect(x: yAxisWidth, y: 0, width: chartWidth, height: xAxisHeight)
        case .mixed:
            yAxisRect = CGRect(x: 0, y: 0, width: yAxisWidth, height: rect.size.height)
            chartRect = CGRect(x: yAxisWidth, y: 0, width: chartWidth, height: rect.size.height)
            var baselineYPos: CGFloat = rect.size.height - xAxisHeight
            let yAxisLabels = axisDataSource.yAxisLabels(model, rect: chartRect, displayRange: displayRange)
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
                YAxisView(displayRange: displayRange,
                          axisDataSource: axisDataSource)
                    .frame(height: yAxisRect.size.height)
                    .position(x: yAxisRect.size.width/2, y: yAxisRect.origin.y + yAxisRect.size.height / 2)
                    .zIndex(2)
                    .environmentObject(self.model)
            }.frame(width: yAxisRect.size.width, height: rect.size.height)
            
            VStack(alignment: .leading, spacing: 0) {
                if model.valueType == .allPositive {
                    GridLinesAndChartView(chartRect: chartRect, displayRange: displayRange)
                    //.zIndex(1)
                    
                    XAxisView(axisDataSource: axisDataSource)
                        .frame(height: xAxisRect.height)
                        .environmentObject(self.model)
                } else if model.valueType == .allNegative {
                    XAxisView(axisDataSource: axisDataSource)
                        .frame(height: xAxisRect.height)
                        .environmentObject(self.model)
                    
                    GridLinesAndChartView(chartRect: chartRect, displayRange: displayRange)
                    //.zIndex(1)
                } else {
                    ZStack {
                        GridLinesAndChartView(chartRect: chartRect, displayRange: displayRange)
                        //.zIndex(1)
                        
                        XAxisView(axisDataSource: axisDataSource)
                            .frame(height: xAxisRect.height)
                            .position(x: xAxisRect.size.width / 2, y: xAxisRect.origin.y + xAxisRect.size.height / 2)
                            .environmentObject(self.model)
                    }
                }
            }
        }
    }
    
    func GridLinesAndChartView(chartRect: CGRect, displayRange: ClosedRange<CGFloat>) -> some View {
        // drag to show the indicator
        let pan = LongPressGesture(minimumDuration: 0.5)
            .sequenced(before: DragGesture())
            .onChanged({ value in
                switch value {
                case .second(true, let drag):
                    if let value = drag {
                        self.showIndicator = true
                        let x = ChartUtility.xPos(value.location.x, layoutDirection: self.layoutDirection, width: chartRect.size.width)
                        self.axisDataSource.closestDataPoint(self.model, toPoint: CGPoint(x: x, y: value.location.y), rect: chartRect)
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
                if abs(self.model.scale.distance(to: 1.0)) < 0.001 {
                    self.showIndicator = true
                    let x = ChartUtility.xPos(value.location.x, layoutDirection: self.layoutDirection, width: chartRect.size.width)
                    self.axisDataSource.closestDataPoint(self.model, toPoint: CGPoint(x: x, y: value.location.y), rect: chartRect)
                    return
                }
                
                self.draggingChartView = true
                let maxPos = Int(chartRect.size.width * (self.model.scale - 1))
                let tmp = self.layoutDirection == .leftToRight ? (self.lastStartPos - Int(value.translation.width)) : (self.lastStartPos + Int(value.translation.width))
                if self.model.snapToPoint {
                    let unitWidth: CGFloat = chartRect.size.width * self.model.scale / CGFloat(ChartUtility.numOfDataItems(self.model) - 1)
                    let closestIndex = Int(CGFloat(tmp) / unitWidth)
                    self.model.startPos = Int(CGFloat(closestIndex) * unitWidth).clamp(low: 0, high: maxPos)
                } else {
                    self.model.startPos = tmp.clamp(low: 0, high: maxPos)
                }
            })
            .onEnded({ _ in
                self.showIndicator = false
                self.draggingChartView = false
                self.lastStartPos = self.model.startPos
            })
        
        // zoom in & out
        let mag = MagnificationGesture()
            .onChanged({ value in
                self.showIndicator = false
                let count = ChartUtility.numOfDataItems(self.model)
                let maxScale = max(1, CGFloat(count - 1) / 2)
                let tmp = self.lastScale * value.magnitude
                self.model.scale = tmp.clamp(low: 1.0, high: maxScale)
                let width = chartRect.size.width
                let midPos: CGFloat = (CGFloat(self.lastStartPos) + width / 2) / (self.lastScale * width)
                
                let maxPos: Int = Int(width * (self.model.scale - 1))
                self.model.startPos = Int(midPos * width * self.model.scale - width/2).clamp(low: 0, high: maxPos)
            })
            .onEnded({ _ in
                self.lastScale = self.model.scale
                self.lastStartPos = self.model.startPos
            })
            .exclusively(before: drag)
        
        return ZStack {
            self.chartView
                .opacity(draggingChartView ? 0.4 : 1.0)
                .gesture(pan)
                .gesture(drag)
                .gesture(mag)
                .disabled(!model.userInteractionEnabled)
            
            XAxisGridlines(axisDataSource: axisDataSource)
                .environmentObject(model)
            YAxisGridlines(displayRange: displayRange, axisDataSource: axisDataSource)
                .environmentObject(model)
            
            if self.showIndicator {
                indicatorView
            }
        }.frame(width: chartRect.size.width, height: chartRect.size.height)
    }
    
    func xAxisLabelsMaxHeight(_ rect: CGRect) -> CGFloat {
        let lables = axisDataSource.xAxisLabels(model, rect: rect)
        if lables.count == 0 { return 16 }
        
        var height: CGFloat = 16
        var totalWidth: CGFloat = 0
        for label in lables {
            let size = label.title.boundingBoxSize(with: model.categoryAxis.labels.fontSize)
            height = max(height, size.height)
            totalWidth += size.width + 2
        }
        
        // show nothing
        if model.categoryAxis.labelLayoutStyle == .allOrNothing && totalWidth > rect.size.width {
            height = 0
        }
        
        return height + model.categoryAxis.baseline.width
    }
    
    func yAxisLabelsMaxWidth() -> CGFloat {
        var width: CGFloat = 20
        let range = ChartUtility.displayRange(model)
        for val in [range.lowerBound, range.upperBound] {
            let str = axisDataSource.yAxisFormattedString(model, value: Double(val))
            let size = str.boundingBoxSize(with: model.numericAxis.labels.fontSize)
            width = max(width, size.width)
        }
        
        return width + 6
    }
}

struct XAxisSizePreferenceKey: PreferenceKey {
    typealias Value = [CGSize]
    static let defaultValue: Value = []
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value.append(contentsOf: nextValue())
    }
}

struct SizeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content.overlay(GeometryReader { proxy in
            Color.clear.preference(key: XAxisSizePreferenceKey.self, value: [proxy.size])
        })
    }
}

extension Comparable {
    func clamp(low: Self, high: Self) -> Self {
        if self > high {
            return high
        } else if self < low {
            return low
        }
        
        return self
    }
}

struct XYAxisChart_Previews: PreviewProvider {
    static var previews: some View {
        XYAxisChart(Tests.lineModels[0],
                    axisDataSource: DefaultAxisDataSource(),
                    chartView: LinesView(Tests.lineModels[0]),
                    indicatorView: StockIndicatorView(Tests.lineModels[0]))
            .frame(width: 300, height: 400)
            .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 16))
    }
}
