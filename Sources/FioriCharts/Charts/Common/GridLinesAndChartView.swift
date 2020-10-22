//
//  GridLinesAndChartView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/17/20.
//

import SwiftUI

struct GridLinesAndChartView<Content: View, Indicator: View>: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection

    // scale is not allowed to be less than 1.0
    @State var lastScale: CGFloat = 1.0
    @State var lastStartPosX: CGFloat = 0
    @State var lastStartPosY: CGFloat = 0
    
    @State var draggingChartView = false
    @State var gestureInProgress: Bool = false
    
    @GestureState var dragState = DragState.inactive
    
    var chartView: Content
    var indicatorView: Indicator
    
    init(chartView: Content, indicatorView: Indicator, scale: CGFloat = 1.0, startPosX: CGFloat = 0, startPosY: CGFloat = 0) {
        self.chartView = chartView
        self.indicatorView = indicatorView
        self._lastScale = State(initialValue: scale)
        self._lastStartPosX = State(initialValue: startPosX)
        self._lastStartPosY = State(initialValue: startPosY)
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    //swiftlint:disable function_body_length
    func makeBody(in rect: CGRect) -> some View {
        // pan chart horizontally or slide to show the indicator if it is not zoomed in
        let drag = DragGesture()
            .onChanged({ value in
                // not zoomed in, perform selection
                if abs(self.model.scale.distance(to: 1.0)) < 0.001 {
                    let item = self.chartContext.closestSelectedPlotItem(self.model, atPoint: value.location, rect: rect, layoutDirection: self.layoutDirection)
                    
                    ChartUtility.updateSelections(self.model, selectedPlotItems: [item], isTap: false)
                    return
                }
                
                // pan the plot chart while it is zoomed in
                if self.model.selections != nil {
                    self.model.selections = nil
                }
                self.draggingChartView = true
    
                let tmpX = self.layoutDirection == .leftToRight ? (self.lastStartPosX * self.model.scale * rect.size.width - value.translation.width) / (self.model.scale * rect.size.width) : (self.lastStartPosX * self.model.scale * rect.size.width + value.translation.width) / (self.model.scale * rect.size.width)
                self.model.startPos.x = max(0, min(tmpX, (self.model.scale - 1) / max(self.model.scale, 1)))
                
                let tmpY = (self.lastStartPosY * self.model.scale * rect.size.height + value.translation.height) / (self.model.scale * rect.size.height)
                self.model.startPos.y = max(0, min(tmpY, (self.model.scale - 1) / max(self.model.scale, 1)))
                self.model.xAxisLabels = [:]
                
                if self.model.chartType == .bubble || self.model.chartType == .scatter {
                    self.model.yAxisLabels = [:]
                    self.model.secondaryYAxisLabels = [:]
                }
            })
            .onEnded({ _ in
                self.draggingChartView = false
                self.adjustStartPos(in: rect)
                self.lastStartPosX = self.model.startPos.x
                self.lastStartPosY = self.model.startPos.y
            })
        
        // zoom in & out
        let mag = MagnificationGesture()
            .onChanged({ value in
                if self.model.selections != nil {
                    self.model.selections = nil
                }
                let maxScale: CGFloat
                if self.model.chartType == .bubble || self.model.chartType == .scatter {
                    maxScale = 10
                } else {
                    let count: Int
                    if self.model.chartType == .stock {
                        count = ChartUtility.numOfDataItems(self.model)
                    } else {
                        count = self.model.numOfCategories()
                    }
                    
                    if count <= 3 {
                        return
                    }
                    
                    maxScale = max(1, CGFloat(count - 1) / 2)
                }
            
                let tmp = self.lastScale * value.magnitude
                self.model.scale = tmp.clamp(low: 1.0, high: maxScale)
                let width = rect.size.width
                
                let middleX = (self.lastStartPosX * self.model.scale * width + width / 2) * self.model.scale / self.lastScale
                let tmpX = (middleX - width / 2) / (self.model.scale * rect.size.width)
                self.model.startPos.x = max(0, min(tmpX, (self.model.scale - 1) / max(self.model.scale, 1)))
                
                let middleY = (self.lastStartPosY * self.model.scale * rect.size.height + rect.size.height / 2) * self.model.scale / self.lastScale
                let tmpY = (middleY - rect.size.height / 2) / (self.model.scale * rect.size.height)
                self.model.startPos.y = max(0, min(tmpY, (self.model.scale - 1) / max(self.model.scale, 1)))
                self.model.xAxisLabels = [:]
                if self.model.chartType == .bubble || self.model.chartType == .scatter {
                    self.model.yAxisLabels = [:]
                    self.model.secondaryYAxisLabels = [:]
                }
            })
            .onEnded({ _ in
                self.lastScale = self.model.scale
                self.adjustStartPos(in: rect)
                self.lastStartPosX = self.model.startPos.x
                self.lastStartPosY = self.model.startPos.y
                self.draggingChartView = false
            })

        return ZStack {
            XAxisGridlines()
                
            YAxisGridlines()
            
            chartView
                .opacity(self.alpha())
            
            indicatorView
            
            if model.userInteractionEnabled {
                Background(tappedCallback: { (point, chartRect) in
                    let item = self.chartContext.closestSelectedPlotItem(self.model, atPoint: point, rect: chartRect, layoutDirection: self.layoutDirection)
                    ChartUtility.updateSelections(self.model, selectedPlotItems: [item], isTap: true)
                }, doubleTappedCallback: { (_, _) in
                    // clear selections
                    if self.model.selections != nil {
                        self.model.selections = nil
                    }
                }) { (points, chartRect) in
                    if self.model.selectionMode == .single || self.model.numOfSeries() == 1 || self.model.chartType == .stock {
                        let items = self.chartContext.closestSelectedPlotItems(self.model,
                                                                                 atPoints: [points.0, points.1],
                                                                                 rect: chartRect,
                                                                                 layoutDirection: self.layoutDirection)
                        
                        ChartUtility.updateSelections(self.model, selectedPlotItems: items, isTap: false)
                    }
                }
                .gesture(drag)
                .gesture(mag)
                .disabled(!model.userInteractionEnabled)
            }
        }
    }
    
    func adjustStartPos(in rect: CGRect) {
        if model.snapToPoint && (model.chartType != .bar && model.chartType != .stackedBar) {
            let tmpX = model.startPos.x
            self.model.startPos.x = chartContext.snapChartToPoint(model, at: tmpX, in: rect)
        }
        
        if model.snapToPoint && (model.chartType == .bar || model.chartType == .stackedBar) {
            let tmpY = self.model.startPos.y
            model.startPos.y = chartContext.snapChartToPoint(model, at: tmpY, in: rect)
        }
    }
    
    func alpha() -> Double {
        if model.chartType == .bubble || model.chartType == .scatter {
            return 1
        } else {
            if model.selections != nil {
                return 0.25
            } else {
                return 1
            }
        }
    }
}

struct Background: UIViewRepresentable {
    var tappedCallback: ((CGPoint, CGRect) -> Void)
    var doubleTappedCallback: ((CGPoint, CGRect) -> Void)
    var longPressedCallback: (((CGPoint, CGPoint), CGRect) -> Void)
    
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
        
        // long pressed gesture to do range selection
        let longPressedGesture = UILongPressGestureRecognizer(target: context.coordinator,
                                                              action: #selector(Coordinator.longPressed(gesture:)))
        longPressedGesture.numberOfTouchesRequired = 2
        longPressedGesture.minimumPressDuration = 0.5
        longPressedGesture.allowableMovement = 5
        
        v.addGestureRecognizer(longPressedGesture)
        
        return v
    }
    
    class Coordinator: NSObject {
        var tappedCallback: ((CGPoint, CGRect) -> Void)
        var doubleTappedCallback: ((CGPoint, CGRect) -> Void)
        var longPressedCallback: (((CGPoint, CGPoint), CGRect) -> Void)
        
        init(tappedCallback: @escaping ((CGPoint, CGRect) -> Void),
             doubleTappedCallback: @escaping ((CGPoint, CGRect) -> Void),
             longPressedCallback: @escaping (((CGPoint, CGPoint), CGRect) -> Void)) {
            self.tappedCallback = tappedCallback
            self.doubleTappedCallback = doubleTappedCallback
            self.longPressedCallback = longPressedCallback
        }
        
        @objc func tapped(gesture: UITapGestureRecognizer) {
            let point = gesture.location(in: gesture.view)
            let rect = gesture.view?.frame ?? CGRect.zero
            
            self.tappedCallback(point, rect)
        }
        
        @objc func doubleTapped(gesture: UITapGestureRecognizer) {
            let point = gesture.location(in: gesture.view)
            let rect = gesture.view?.frame ?? CGRect.zero
            
            self.doubleTappedCallback(point, rect)
        }
        
        @objc func longPressed(gesture: UILongPressGestureRecognizer) {
            let first = gesture.location(ofTouch: 0, in: gesture.view)
            let second = gesture.location(ofTouch: 1, in: gesture.view)
            let rect = gesture.view?.frame ?? CGRect.zero
            
            self.longPressedCallback((first, second), rect)
        }
    }
    
    func makeCoordinator() -> Background.Coordinator {
        return Coordinator(tappedCallback: self.tappedCallback,
                           doubleTappedCallback: self.doubleTappedCallback,
                           longPressedCallback: self.longPressedCallback)
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

struct GridLinesAndChartView_Previews: PreviewProvider {
    static var previews: some View {
        GridLinesAndChartView(chartView: LinesView(),
                indicatorView: LineIndicatorView())
            .environmentObject(Tests.lineModels[0])
            .environment(\.chartContext, DefaultChartContext())
            .frame(width: 300, height: 400)
            .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 16))
    }
}
