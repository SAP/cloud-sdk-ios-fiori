import SwiftUI

/***
 Supported gestures:
 1. DragGesture: pan the chart
 2. MagnificationGesture: pinch and zoom the chart
 3. UITapGestureRecognizer: single tap to do a selection
 4. UITapGestureRecognizer: double tap to cancel current selection
 5. ChartScrubGestureRecognizer: long pressed gesture to do single (one finger) or range selection (two fingers)
 */
struct GridLinesAndChartView<Content: View, Indicator: View>: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
  
    @State var lastScaleX: CGFloat = 1.0
    @State var lastScaleY: CGFloat = 1.0
    @State var lastCenterPosition: CGPoint? = nil
    
    /// Once one of gestures started then other two gestures are not allowed to take effect
    @State var isPanChartStarted = false
    @State var isMagnificationGestureStarted = false
    @State var isSelectionStarted = false
    
    var chartView: Content
    var indicatorView: Indicator
    /// set this to true if a explicit layout is needed
    @Binding var isLayoutNeeded: Bool
    
    init(chartView: Content, indicatorView: Indicator, isLayoutNeeded: Binding<Bool>, scaleX: CGFloat = 1.0, scaleY: CGFloat = 1.0, centerPosition: CGPoint? = nil) {
        self.chartView = chartView
        self.indicatorView = indicatorView
        self._isLayoutNeeded = isLayoutNeeded
        
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
        _ = self.chartContext.plotPath(self.model)
        
        /// the gesture to pan the chart
        let drag = DragGesture()
            .onChanged { value in
                if self.isSelectionStarted || self.isMagnificationGestureStarted {
                    return
                }
                
                if !self.isPanChartStarted {
                    self.isPanChartStarted = true
                }
                
                if self.isLayoutNeeded {
                    self.isLayoutNeeded = false
                }
                
                let scaleX = self.chartContext.scaleX(self.model, plotViewSize: rect.size)
                let scaleY = self.chartContext.scaleY(self.model, plotViewSize: rect.size)
                
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
                    self.model.yAxisLabels = [:]
                    self.model.secondaryYAxisLabels = [:]
                }
            }
            .onEnded { _ in
                self.adjustStartPosition(in: rect)
                self.lastCenterPosition = self.chartContext.centerPosition(self.model, plotViewSize: rect.size)
                
                // refresh the layout
                self.isLayoutNeeded = true
                self.isPanChartStarted = false
            }
        
        // pinch and zoom the chart
        let mag = MagnificationGesture()
            .onChanged { value in
                if !self.model.scaleXEnabled && !self.model.scaleYEnabled {
                    return
                }
                
                if self.isSelectionStarted || self.isPanChartStarted {
                    return
                }
                
                if !self.isMagnificationGestureStarted {
                    self.isMagnificationGestureStarted = true
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
                
                // refresh the layout
                self.isLayoutNeeded = true
            }
            .onEnded { _ in
                self.lastScaleX = self.model.scaleX
                self.lastScaleY = self.model.scaleY
                
                self.adjustStartPosition(in: rect)
                self.isMagnificationGestureStarted = false
            }

        return ZStack {
            XAxisGridlines(plotViewSize: rect.size)
            
            YAxisGridlines(plotViewSize: rect.size)
            
            self.chartView
                .opacity(self.alpha())
            
            self.indicatorView
            
            if self.model.userInteractionEnabled {
                Background(tappedCallback: { point, chartRect, _ in // single selection
                    if !self.model.selectionEnabled {
                        return
                    }
                    
                    let item = self.chartContext.closestSelectedPlotItem(self.model, atPoint: point, rect: chartRect, layoutDirection: self.layoutDirection)
                    ChartUtility.updateSelections(self.model, selectedPlotItems: [item], isClearSelectionIfSame: true)
                }, doubleTappedCallback: { _, _, _ in // cancel current selection
                    if !self.model.selectionEnabled {
                        return
                    }
                    
                    // clear selections
                    if self.model.selections != nil {
                        self.model.selections = nil
                    }
                }) { points, chartRect, state in // single or range selection
                    if !self.model.selectionEnabled || self.model.isBubbleType() {
                        return
                    }
                    
                    // if it is already in the process of Magnification gesture, then just ignore this
                    if self.isPanChartStarted || self.isMagnificationGestureStarted {
                        return
                    }
                    
                    if state == UIGestureRecognizer.State.began.rawValue || state == UIGestureRecognizer.State.changed.rawValue {
                        if !self.isSelectionStarted {
                            self.isSelectionStarted = true
                        }
                        
                        if points.count == 1 { // single selection
                            let item = self.chartContext.closestSelectedPlotItem(self.model, atPoint: points[0], rect: chartRect, layoutDirection: self.layoutDirection)
                            ChartUtility.updateSelections(self.model, selectedPlotItems: [item], isClearSelectionIfSame: false)
                        } else if points.count == 2 { // range selection
                            if self.model.selectionMode == .single || self.model.numOfSeries() == 1 || self.model.chartType == .stock {
                                let items = self.chartContext.closestSelectedPlotItems(self.model, atPoints: points,
                                                                                       rect: chartRect,
                                                                                       layoutDirection: self.layoutDirection)
                                
                                ChartUtility.updateSelections(self.model, selectedPlotItems: items, isClearSelectionIfSame: false)
                            }
                        }
                        
                    } else if state == UIGestureRecognizer.State.ended.rawValue || state == UIGestureRecognizer.State.cancelled.rawValue || state == UIGestureRecognizer.State.failed.rawValue {
                        self.isSelectionStarted = false
                    }
                }
                .gesture(drag)
                .gesture(mag)
            }
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
    var longPressedCallback: ([CGPoint], CGRect, Int) -> Void
    
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
        
        // long pressed gesture to do single and range selection
        let longPressedGesture = ChartScrubGestureRecognizer(target: context.coordinator,
                                                             action: #selector(Coordinator.longPressed(gesture:)))
        longPressedGesture.delegate = context.coordinator
        v.addGestureRecognizer(longPressedGesture)
        
        return v
    }
    
    class Coordinator: NSObject, UIGestureRecognizerDelegate {
        var tappedCallback: (CGPoint, CGRect, Int) -> Void
        var doubleTappedCallback: (CGPoint, CGRect, Int) -> Void
        var longPressedCallback: ([CGPoint], CGRect, Int) -> Void
        
        init(tappedCallback: @escaping ((CGPoint, CGRect, Int) -> Void),
             doubleTappedCallback: @escaping ((CGPoint, CGRect, Int) -> Void),
             longPressedCallback: @escaping (([CGPoint], CGRect, Int) -> Void))
        {
            self.tappedCallback = tappedCallback
            self.doubleTappedCallback = doubleTappedCallback
            self.longPressedCallback = longPressedCallback
        }
        
        @objc func tapped(gesture: UITapGestureRecognizer) {
            if gesture.numberOfTouches < 1 {
                return
            }
            
            let point = gesture.location(in: gesture.view)
            let rect = gesture.view?.frame ?? CGRect.zero
            let state = gesture.state.rawValue
            
            self.tappedCallback(point, rect, state)
        }
        
        @objc func doubleTapped(gesture: UITapGestureRecognizer) {
            if gesture.numberOfTouches < 1 {
                return
            }
            
            let point = gesture.location(in: gesture.view)
            let rect = gesture.view?.frame ?? CGRect.zero
            let state = gesture.state.rawValue
            
            self.doubleTappedCallback(point, rect, state)
        }
        
        @objc func longPressed(gesture: UILongPressGestureRecognizer) {
            if gesture.numberOfTouches < 1 {
                return
            }
            
            var points: [CGPoint] = []
            let first = gesture.location(ofTouch: 0, in: gesture.view)
            points.append(first)
            if gesture.numberOfTouches > 1 {
                let second = gesture.location(ofTouch: 1, in: gesture.view)
                points.append(second)
            }
            let rect = gesture.view?.frame ?? CGRect.zero
            let state = gesture.state.rawValue
            
            self.longPressedCallback(points, rect, state)
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

// Handle chart specific gestures that combines interaction for single and range selection and long press delay.
private class ChartScrubGestureRecognizer: UIGestureRecognizer {
    override public var state: UIGestureRecognizer.State {
        didSet {
            if self.state != oldValue, self.state != .possible {
                self.clearTimer()
            }
        }
    }
    
    // Delay for the gesture to begin.
    var minimumPressDuration = 0.5
    
    // Timer for delay.
    private var timer: Timer?
    
    // Timer callback.
    @objc private func triggerGestureBegan() {
        self.state = .began
    }
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        
        // Set up a timer for the delay if there isn't one already running.
        if self.timer == nil, self.state == .possible {
            self.timer = Timer.scheduledTimer(timeInterval: self.minimumPressDuration, target: self, selector: #selector(self.triggerGestureBegan), userInfo: nil, repeats: false)
        }
    }
    
    override public func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
    
        // Only change state if the gesture state has already changed to `.began`.
        if self.state == .began {
            self.state = .changed
        }
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        
        // End gesture if the active touches on the view are the same as the touches that are ending.
        // View == 2 && Gesture == 2 : A range selection ended.
        // View == 1 && Gesture == 1 : A single selection ended.
        // View == 2 && Gesture == 1 : A Range selection muted into a single selection.
        // View == 1 && Gesture == 2 : A single selection muted into a range selection.
        if numberOfTouches == touches.count {
            if self.state == .possible {
                self.state = .failed
            } else {
                self.state = .ended
            }
        } else if self.state == .began {
            self.state = .changed
        }
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesCancelled(touches, with: event)
        self.state = .cancelled
    }
    
    // Stop and remove the timer.
    private func clearTimer() {
        self.timer?.invalidate()
        self.timer = nil
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
                              indicatorView: LineIndicatorView(),
                              isLayoutNeeded: .constant(false))
            .environmentObject(Tests.lineModels[0])
            .environment(\.chartContext, LineChartContext())
            .frame(width: 300, height: 400)
            .padding(.init(top: 10, leading: 0, bottom: 0, trailing: 16))
    }
}
