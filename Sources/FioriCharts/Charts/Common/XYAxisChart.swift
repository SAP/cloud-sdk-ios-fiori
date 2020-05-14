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
    
    // swiftlint:disable function_body_length
    func makeBody(in rect: CGRect) -> some View {
        let xAxisHeight = xAxisLabelsMaxHeight(rect)
        let yAxisWidth = yAxisLabelsMaxWidth(rect)
        let secondaryYAxisWidth = yAxisLabelsMaxWidth(rect, secondary: true)
        
        let displayRange = ChartUtility.displayRange(model)
        let chartWidth = rect.size.width - yAxisWidth - secondaryYAxisWidth
        
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
                    GridLinesAndChartView(chartRect: chartRect, displayRange: displayRange)
                    
                    XAxisView(axisDataSource: axisDataSource)
                        .frame(height: xAxisRect.height)
                        .environmentObject(self.model)
                } else if model.valueType == .allNegative {
                    XAxisView(axisDataSource: axisDataSource)
                        .frame(height: xAxisRect.height)
                        .zIndex(1)
                        .environmentObject(self.model)
                    
                    GridLinesAndChartView(chartRect: chartRect, displayRange: displayRange)
                } else {
                    ZStack {
                        GridLinesAndChartView(chartRect: chartRect, displayRange: displayRange)
                        
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
    
    // swiftlint:disable function_body_length
    func GridLinesAndChartView(chartRect: CGRect, displayRange: ClosedRange<CGFloat>) -> some View {
        // pan chart horizontally or slide to show the indicator if it is not zoomed in
        let drag = DragGesture()
            .onChanged({ value in
                // not zoomed in
                if abs(self.model.scale.distance(to: 1.0)) < 0.001 {
                    self.showIndicator = true
                    let x = ChartUtility.xPos(value.location.x, layoutDirection: self.layoutDirection, width: chartRect.size.width)
                    self.axisDataSource.closestDataPoint(self.model, toPoint: CGPoint(x: x, y: value.location.y), rect: chartRect)
                    return
                }
                
                self.showIndicator = false
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
                .opacity( (draggingChartView || showIndicator) ? 0.4 : 1.0)
            
            Background(tappedCallback: { (location) in
                print("single tapped at \(location)")
                self.showIndicator = true
                let x = ChartUtility.xPos(location.x, layoutDirection: self.layoutDirection, width: chartRect.size.width)
                self.axisDataSource.closestDataPoint(self.model, toPoint: CGPoint(x: x, y: location.y), rect: chartRect)
            }) { (location) in
                print("double tapped at \(location)")
                self.showIndicator = false
            }
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
        let labels = axisDataSource.xAxisLabels(model, rect: rect)
        if labels.isEmpty { return 16 }
        
        var height: CGFloat = 16
        var totalWidth: CGFloat = 0
        for label in labels {
            let size = label.title.boundingBoxSize(with: model.categoryAxis.labels.fontSize)
            // spacing btw baseline and labels are 3pt
            height = max(height, size.height + model.categoryAxis.baseline.width + 3)
            // min spacing btw labels are 4pt
            totalWidth += size.width + 4
        }
        totalWidth -= 4
        
        // show nothing
        if model.categoryAxis.labelLayoutStyle == .allOrNothing && totalWidth > rect.size.width {
            height = 0
        }
        
        return height + model.categoryAxis.baseline.width
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
        
        return width
    }
}

struct Background: UIViewRepresentable {
    var tappedCallback: ((CGPoint) -> Void)
    var doubleTappedCallback: ((CGPoint) -> Void)
    
    func makeUIView(context: UIViewRepresentableContext<Background>) -> UIView {
        let v = UIView(frame: .zero)
        let gesture = UITapGestureRecognizer(target: context.coordinator,
                                             action: #selector(Coordinator.tapped))
        v.addGestureRecognizer(gesture)
        
        // double tap used to cancel the selection
        let doubleTapGesture = UITapGestureRecognizer(target: context.coordinator,
                                                      action: #selector(Coordinator.doubleTapped))
        doubleTapGesture.numberOfTapsRequired = 2
        
        v.addGestureRecognizer(doubleTapGesture)
        
        return v
    }
    
    class Coordinator: NSObject {
        var tappedCallback: ((CGPoint) -> Void)
        var doubleTappedCallback: ((CGPoint) -> Void)
        
        init(tappedCallback: @escaping ((CGPoint) -> Void), doubleTappedCallback: @escaping ((CGPoint) -> Void)) {
            self.tappedCallback = tappedCallback
            self.doubleTappedCallback = doubleTappedCallback
        }
        
        @objc func tapped(gesture: UITapGestureRecognizer) {
            let point = gesture.location(in: gesture.view)
            
            self.tappedCallback(point)
        }
        
        @objc func doubleTapped(gesture: UITapGestureRecognizer) {
            let point = gesture.location(in: gesture.view)
        
            self.doubleTappedCallback(point)
        }
    }
    
    func makeCoordinator() -> Background.Coordinator {
        return Coordinator(tappedCallback: self.tappedCallback, doubleTappedCallback: self.doubleTappedCallback)
    }
    
    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<Background>) {
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
