import SwiftUI

struct GridLinesAndChartView<Content: View, Indicator: View>: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
  
    @State var lastScaleX: CGFloat = 1.0
    @State var lastScaleY: CGFloat = 1.0
    @State var lastCenterPosition: CGPoint? = nil
    
    var chartView: Content
    var indicatorView: Indicator
    
    init(chartView: Content, indicatorView: Indicator, scaleX: CGFloat = 1.0, scaleY: CGFloat = 1.0, centerPosition: CGPoint? = nil) {
        self.chartView = chartView
        self.indicatorView = indicatorView

        self._lastScaleX = State(initialValue: scaleX)
        self._lastScaleY = State(initialValue: scaleY)
        self._lastCenterPosition = State(initialValue: centerPosition)
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        // pan chart horizontally or slide to show the indicator if it is not zoomed in
        _ = self.chartContext.plotPath(self.model)
        
        let drag = DragGesture()
            .onChanged { value in
                let scaleX = self.chartContext.scaleX(self.model, plotViewSize: rect.size)
                let scaleY = self.chartContext.scaleY(self.model, plotViewSize: rect.size)
                
                // not zoomed in, perform selection
                if self.model.selectionEnabled && scaleX < 1.001 && scaleY < 1.001 {
                    let item = self.chartContext.closestSelectedPlotItem(self.model, atPoint: value.location, rect: rect, layoutDirection: self.layoutDirection)
                    
                    ChartUtility.updateSelections(self.model, selectedPlotItems: [item], isTap: false)
                    return
                }
                
                // pan the plot chart while it is zoomed in
                if self.model.selections != nil {
                    self.model.selections = nil
                }
                
                var tmpLastCenterPosition: CGPoint
                if let tmpPosition = self.lastCenterPosition {
                    tmpLastCenterPosition = tmpPosition
                } else {
                    tmpLastCenterPosition = self.chartContext.centerPosition(self.model, plotViewSize: rect.size)
                    self.lastCenterPosition = tmpLastCenterPosition
                }
                
                let tmpX = self.layoutDirection == .leftToRight ? (tmpLastCenterPosition.x * scaleX * rect.size.width - value.translation.width) / (scaleX * rect.size.width) : (tmpLastCenterPosition.x * scaleX * rect.size.width + value.translation.width) / (scaleX * rect.size.width)
                let x = max(0.5 / scaleX, min(1 - 0.5 / scaleX, tmpX))

                let tmpY = (tmpLastCenterPosition.y * scaleY * rect.size.height - value.translation.height) / (scaleY * rect.size.height)
                let y = max(0.5 / scaleY, min(1 - 0.5 / scaleY, tmpY))
                self.model.centerPosition = CGPoint(x: x, y: y)

                if self.model.chartType == .bubble || self.model.chartType == .scatter {
                    self.model.xAxisLabels = [:]
                }
                
                if self.model.chartType == .bubble || self.model.chartType == .scatter {
                    self.model.yAxisLabels = [:]
                }
                
                if self.model.chartType == .bubble || self.model.chartType == .scatter {
                    self.model.yAxisLabels = [:]
                    self.model.secondaryYAxisLabels = [:]
                }
            }
            .onEnded { _ in
                self.adjustStartPosition(in: rect)
                self.lastCenterPosition = self.chartContext.centerPosition(self.model, plotViewSize: rect.size)
            }
        
        // zoom in & out
        let mag = MagnificationGesture()
            .onChanged { value in
                if !self.model.scaleXEnabled && !self.model.scaleYEnabled {
                    return
                }
                
                if self.model.selections != nil {
                    self.model.selections = nil
                }
                
                if self.model.chartType == .bubble || self.model.chartType == .scatter {
                    if self.model.scaleXEnabled || self.model.scaleYEnabled {
                        self.model.scaleX = max(1, self.lastScaleX * value.magnitude)
                        self.model.scaleY = self.model.scaleX
                    }
                } else {
                    if self.model.scaleXEnabled {
                        self.model.scaleX = max(1, self.lastScaleX * value.magnitude)
                    }
                    
                    if self.model.scaleYEnabled {
                        self.model.scaleY = max(1, self.lastScaleY * value.magnitude)
                    }
                }
                
                self.model.centerPosition = self.chartContext.centerPosition(self.model, plotViewSize: rect.size)
                
                if self.model.chartType == .bubble || self.model.chartType == .scatter {
                    self.model.xAxisLabels = [:]
                }
                
                if self.model.chartType == .bubble || self.model.chartType == .scatter {
                    self.model.yAxisLabels = [:]
                }
            }
            .onEnded { _ in
                self.lastScaleX = self.model.scaleX
                self.lastScaleY = self.model.scaleY
                
                self.adjustStartPosition(in: rect)
            }

        return ZStack {
            XAxisGridlines(plotViewSize: rect.size)
            
            YAxisGridlines(plotViewSize: rect.size)
            
            chartView
                .opacity(self.alpha())
            
            indicatorView
            
            Background(tappedCallback: { point, chartRect, _ in
                if !self.model.selectionEnabled {
                    return
                }
                
                let item = self.chartContext.closestSelectedPlotItem(self.model, atPoint: point, rect: chartRect, layoutDirection: self.layoutDirection)
                ChartUtility.updateSelections(self.model, selectedPlotItems: [item], isTap: true)
            }, doubleTappedCallback: { _, _, _ in
                if !self.model.selectionEnabled {
                    return
                }
                
                // clear selections
                if self.model.selections != nil {
                    self.model.selections = nil
                }
            }) { points, chartRect, state in
                if !self.model.selectionEnabled {
                    return
                }
                
                if self.model.selectionMode == .single || self.model.numOfSeries() == 1 || self.model.chartType == .stock, state == UIGestureRecognizer.State.began.rawValue {
                    let items = self.chartContext.closestSelectedPlotItems(self.model, atPoints: [points.0, points.1],
                                                                           rect: chartRect,
                                                                           layoutDirection: self.layoutDirection)
                    
                    ChartUtility.updateSelections(self.model, selectedPlotItems: items, isTap: false)
                }
            }
            .gesture(drag)
            .gesture(mag)
        }.disabled(!self.model.userInteractionEnabled)
    }
    
    func adjustStartPosition(in rect: CGRect) {
        if self.model.snapToPoint {
            let tmpStartPosition = self.chartContext.startPosition(self.model, plotViewSize: rect.size)
            let tmpCenterPosition = self.chartContext.centerPosition(self.model, plotViewSize: rect.size)
            
            if self.model.chartType == .bar || self.model.chartType == .stackedBar {
                let tmpY = self.chartContext.snapChartToPoint(self.model, at: tmpStartPosition.y)
                let tmpScaleY = self.chartContext.scaleY(self.model, plotViewSize: rect.size)
                let y = max(0.5 / tmpScaleY, min(1 - 0.5 / tmpScaleY, tmpY + 0.5 / tmpScaleY))
                
                self.model.centerPosition = CGPoint(x: tmpCenterPosition.x, y: y)
            } else {
                let tmpX = self.chartContext.snapChartToPoint(self.model, at: tmpStartPosition.x)
                let tmpScaleX = self.chartContext.scaleX(self.model, plotViewSize: rect.size)
                let x = max(0.5 / tmpScaleX, min(1 - 0.5 / tmpScaleX, tmpX + 0.5 / tmpScaleX))

                self.model.centerPosition = CGPoint(x: x, y: tmpCenterPosition.y)
            }
        }
    }
    
    func alpha() -> Double {
        if self.model.chartType == .line || self.model.chartType == .area || self.model.chartType == .stock {
            if self.model.selections != nil {
                return 0.25
            }
        }
        
        return 1
    }
}

struct Background: UIViewRepresentable {
    var tappedCallback: (CGPoint, CGRect, Int) -> Void
    var doubleTappedCallback: (CGPoint, CGRect, Int) -> Void
    var longPressedCallback: ((CGPoint, CGPoint), CGRect, Int) -> Void
    
    func makeUIView(context: UIViewRepresentableContext<Background>) -> UIView {
        let v = UIView(frame: .zero)
        
        // single tap gesture recognizer
        let gesture = UITapGestureRecognizer(target: context.coordinator,
                                             action: #selector(Coordinator.tapped))
        gesture.delegate = context.coordinator
        v.addGestureRecognizer(gesture)
        
        // double tap used to cancel the selection
        let doubleTapGesture = UITapGestureRecognizer(target: context.coordinator,
                                                      action: #selector(Coordinator.doubleTapped))
        doubleTapGesture.delegate = context.coordinator
        doubleTapGesture.numberOfTapsRequired = 2
        v.addGestureRecognizer(doubleTapGesture)
        
        // long pressed gesture to do range selection
        let longPressedGesture = UILongPressGestureRecognizer(target: context.coordinator,
                                                              action: #selector(Coordinator.longPressed(gesture:)))
        longPressedGesture.delegate = context.coordinator
        longPressedGesture.numberOfTouchesRequired = 2
        longPressedGesture.minimumPressDuration = 0.5
        longPressedGesture.allowableMovement = 5
        
        v.addGestureRecognizer(longPressedGesture)
        
        return v
    }
    
    class Coordinator: NSObject, UIGestureRecognizerDelegate {
        var tappedCallback: (CGPoint, CGRect, Int) -> Void
        var doubleTappedCallback: (CGPoint, CGRect, Int) -> Void
        var longPressedCallback: ((CGPoint, CGPoint), CGRect, Int) -> Void
        
        init(tappedCallback: @escaping ((CGPoint, CGRect, Int) -> Void),
             doubleTappedCallback: @escaping ((CGPoint, CGRect, Int) -> Void),
             longPressedCallback: @escaping (((CGPoint, CGPoint), CGRect, Int) -> Void))
        {
            self.tappedCallback = tappedCallback
            self.doubleTappedCallback = doubleTappedCallback
            self.longPressedCallback = longPressedCallback
        }
        
        @objc func tapped(gesture: UITapGestureRecognizer) {
            let point = gesture.location(in: gesture.view)
            let rect = gesture.view?.frame ?? CGRect.zero
            let state = gesture.state.rawValue
            
            self.tappedCallback(point, rect, state)
        }
        
        @objc func doubleTapped(gesture: UITapGestureRecognizer) {
            let point = gesture.location(in: gesture.view)
            let rect = gesture.view?.frame ?? CGRect.zero
            let state = gesture.state.rawValue
            
            self.doubleTappedCallback(point, rect, state)
        }
        
        @objc func longPressed(gesture: UILongPressGestureRecognizer) {
            let first = gesture.location(ofTouch: 0, in: gesture.view)
            let second = gesture.location(ofTouch: 1, in: gesture.view)
            let rect = gesture.view?.frame ?? CGRect.zero
            let state = gesture.state.rawValue
            
            self.longPressedCallback((first, second), rect, state)
        }
        
        func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                               shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool
        {
            true
        }
    }
    
    func makeCoordinator() -> Background.Coordinator {
        Coordinator(tappedCallback: self.tappedCallback,
                    doubleTappedCallback: self.doubleTappedCallback,
                    longPressedCallback: self.longPressedCallback)
    }
    
    func updateUIView(_ uiView: UIView,
                      context: UIViewRepresentableContext<Background>) {}
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
            .environment(\.chartContext, LineChartContext())
            .frame(width: 300, height: 400)
            .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 16))
    }
}
