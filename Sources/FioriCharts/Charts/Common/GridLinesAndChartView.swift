//
//  GridLinesAndChartView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 6/17/20.
//

import SwiftUI

struct GridLinesAndChartView<Content: View, Indicator: View>: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.axisDataSource) var axisDataSource
    @Environment(\.layoutDirection) var layoutDirection
    @State var draggingChartView = false
    
    // scale is not allowed to be less than 1.0
    @State var lastScale: CGFloat = 1.0
    @State var lastStartPos: Int = 0
    @GestureState var dragState = DragState.inactive
    
    var chartView: Content
    var indicatorView: Indicator
    
    init(chartView: Content, indicatorView: Indicator) {
            self.chartView = chartView
            self.indicatorView = indicatorView
        }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        // pan chart horizontally or slide to show the indicator if it is not zoomed in
        let drag = DragGesture()
            .onChanged({ value in
                // not zoomed in
                if abs(self.model.scale.distance(to: 1.0)) < 0.001 {
                    let item = self.axisDataSource.closestSelectedPlotItem(self.model, atPoint: value.location, rect: rect, layoutDirection: self.layoutDirection)
                    
                    ChartUtility.updateSelections(self.model, selectedPlotItems: [item], isTap: false)
                    return
                }
                
                if self.model.selections != nil {
                    self.model.selections = nil
                }
                self.draggingChartView = true
                let maxPos = Int(rect.size.width * (self.model.scale - 1))
                let tmpX = self.layoutDirection == .leftToRight ? (CGFloat(self.lastStartPos) - value.translation.width) : (CGFloat(self.lastStartPos) + value.translation.width)
                if self.model.snapToPoint {
                    self.model.startPos = Int(self.axisDataSource.snapChartToPoint(self.model, at: tmpX, in: rect)).clamp(low: 0, high: maxPos)
                } else {
                    let tmp = Int(tmpX)
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
                if self.model.selections != nil {
                    self.model.selections = nil
                }
                let count = ChartUtility.numOfDataItems(self.model)
                let maxScale = max(1, CGFloat(count - 1) / 2)
                let tmp = self.lastScale * value.magnitude
                self.model.scale = tmp.clamp(low: 1.0, high: maxScale)
                let width = rect.size.width
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
            XAxisGridlines()
                
            YAxisGridlines()
            
            chartView
                .opacity((draggingChartView || self.model.selections != nil) ? 0.25 : 1.0)
            
            indicatorView
            
            Background(tappedCallback: { (point, chartRect) in
                let item = self.axisDataSource.closestSelectedPlotItem(self.model, atPoint: point, rect: chartRect, layoutDirection: self.layoutDirection)
                
                ChartUtility.updateSelections(self.model, selectedPlotItems: [item], isTap: true)
            }, doubleTappedCallback: { (_, _) in
                // clear selections
                if self.model.selections != nil {
                    self.model.selections = nil
                }
            }) { (points, chartRect) in
                if self.model.selectionMode == .single || self.model.numOfSeries() == 1 || self.model.chartType == .stock {
                    let items = self.axisDataSource.closestSelectedPlotItems(self.model,
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
        //GridLinesAndChartView()
        GridLinesAndChartView(chartView: LinesView(),
                indicatorView: LineIndicatorView())
            .environmentObject(Tests.lineModels[0])
            .environment(\.axisDataSource, DefaultAxisDataSource())
            .frame(width: 300, height: 400)
            .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 16))
    }
}
