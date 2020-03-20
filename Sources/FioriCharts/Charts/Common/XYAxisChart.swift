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

struct XYAxisChart<Content: View>: View {
    @ObservedObject var model: ChartModel
    var chartView: Content
    
    @State var closestPoint:CGPoint = .zero
    @State var closestDataIndex:Int = 0
    @State var showIndicator = false
    @State var draggingChartView = false
    
    // scale is not allowed to be less than 1.0
    @State var lastScale: CGFloat = 1.0
    @State var lastStartPos: Int = 0
    @GestureState var dragState = DragState.inactive
    
    var axisDataSource: AxisDataSource?
    
    init(_ chartModel: ChartModel, chartView: Content) {
        self.model = chartModel
        self.chartView = chartView
    
        axisDataSource = model.chartType == .stock ? StockAxisDataSource() : DefaultAxisDataSource()
        lastScale = 0
        lastStartPos = 0
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.chartView(in: geometry.frame(in: .local))
        }
    }
    
    func chartView(in rect: CGRect) -> some View {
        let displayRange = StockUtility.displayRange(model)
        let xAxisHeight:CGFloat = 24
        let yAxisWidth:CGFloat = 20
        
        let chartRect = CGRect(x: yAxisWidth, y: 0, width: rect.size.width - yAxisWidth, height: rect.size.height - xAxisHeight)
        
        // drag to show the indicator
        let pan = LongPressGesture(minimumDuration: 0.5)
            .sequenced(before: DragGesture())
            .onChanged({ value in
                switch value {
                case .second(true, let drag):
                    if let value = drag {
                        self.showIndicator = true
                        self.closestPoint = self.calClosestDataPoint(toPoint: value.location, rect: chartRect)
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
                    self.closestPoint = self.calClosestDataPoint(toPoint: value.location, rect: chartRect)
                    return
                }
                
                self.draggingChartView = true
                let maxPos = Int(chartRect.size.width * (self.model.scale - 1))
                let tmp = self.lastStartPos - Int(value.translation.width)
                if self.model.panChartToDataPointOnly {
                    let unitWidth: CGFloat = chartRect.size.width * self.model.scale / CGFloat(StockUtility.numOfDataItmes(self.model) - 1)
                    let closestIndex = Int(CGFloat(tmp) / unitWidth)
                    self.model.startPos = Int(CGFloat(closestIndex) * unitWidth).clamp(low: 0, high: maxPos)
                }
                else {
                    self.model.startPos = tmp.clamp(low: 0, high: maxPos)
                }
            })
            .onEnded({ value in
                self.showIndicator = false
                self.draggingChartView = false
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
                let width = chartRect.size.width
                let midPos: CGFloat = (CGFloat(self.lastStartPos) + width / 2) / (self.lastScale * width)
                
                let maxPos: Int = Int(width * (self.model.scale - 1))
                self.model.startPos = Int(midPos * width * self.model.scale - width/2).clamp(low: 0, high: maxPos)
            })
            .onEnded({ value in
                self.lastScale = self.model.scale
                self.lastStartPos = self.model.startPos
            })
            .exclusively(before: drag)
        
        return ZStack {
            if model.userInteractionEnabled {
                chartView
                    .frame(width: chartRect.size.width, height: chartRect.size.height)
                    .offset(x: chartRect.origin.x/2, y: -xAxisHeight/2)
                    .opacity(draggingChartView ? 0.4 : 1.0)
                    .gesture(pan)
                    .gesture(drag)
                    .gesture(mag)
            }
            else {
                chartView
                    .frame(width: chartRect.size.width, height: chartRect.size.height)
                    .offset(x: chartRect.origin.x/2, y: -xAxisHeight/2)
            }
            
            XAxisView(rect: CGRect(x: yAxisWidth, y: rect.size.height - xAxisHeight, width: chartRect.size.width, height: xAxisHeight), axisDataSource: axisDataSource).environmentObject(self.model)

            YAxisView(rect: CGRect(x:0, y: 0, width: yAxisWidth, height: chartRect.size.height), chartWidth: chartRect.size.width, displayRange: displayRange, axisDataSource: axisDataSource).environmentObject(self.model)
            
            if self.showIndicator && closestDataIndex >= 0 {
                StockIndicatorView(rect: chartRect, closestPoint: $closestPoint, closestDataIndex: $closestDataIndex)
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

extension Comparable {
    func clamp(low: Self, high: Self) -> Self {
        if (self > high) {
            return high
        } else if (self < low) {
            return low
        }
        
        return self
    }
}

struct XYAxisChart_Previews: PreviewProvider {
    static var previews: some View {
        XYAxisChart(Tests.lineModels[0],
                    chartView: LinesView(Tests.lineModels[0]))
            .frame(width:300, height: 400)
        .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 16))
    }
}
