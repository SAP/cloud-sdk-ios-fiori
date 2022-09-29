import SwiftUI

struct ChartContentEnvironmentKey: EnvironmentKey {
    static let defaultValue: ChartContext = DefaultChartContext()
}

extension EnvironmentValues {
    var chartContext: ChartContext {
        get {
            self[ChartContentEnvironmentKey.self]
        }
        
        set {
            self[ChartContentEnvironmentKey.self] = newValue
        }
    }
}

struct XYAxisChart<Content: View, Indicator: View>: View {
    @ObservedObject var model: ChartModel
    @Environment(\.layoutDirection) var layoutDirection
    @State var yAxisExpanded: Bool = false
    
    /// GridLinesAndChartView set this to true when chart panning is ended or chart magnification is in progress
    @State var isLayoutNeeded = false
    
    /// cache layout info
    @State var _xAxisRect: CGRect = .zero
    @State var _xAxisLabelsRect: CGRect = .zero
    @State var _yAxisRect: CGRect = .zero
    @State var _secondaryYAxisRect: CGRect = .zero
    @State var _chartRect: CGRect = .zero
    @State var _insets = EdgeInsets()
    @State var lastViewSize = CGSize.zero
    
    var chartView: Content
    var indicatorView: Indicator
    var chartContext: ChartContext
    
    init(model: ChartModel, chartContext: ChartContext, chartView: Content, indicatorView: Indicator) {
        self.model = model
        self.chartView = chartView
        self.indicatorView = indicatorView
        self.chartContext = chartContext
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
        .contentShape(Rectangle())
        .clipped()
        .environmentObject(model)
        .environment(\.chartContext, chartContext)
    }
    
    func makeBody(in rect: CGRect) -> some View {
        var xAxisRect = self._xAxisRect, xAxisLabelsRect = self._xAxisLabelsRect, yAxisRect = self._yAxisRect, secondaryYAxisRect = self._secondaryYAxisRect, chartRect = self._chartRect
        var insets = self._insets
        
        /// check if layout is needed
        if self.isLayoutNeeded || self.lastViewSize == .zero || abs(self.lastViewSize.width - rect.size.width) > 1 || abs(self.lastViewSize.height - rect.size.height) > 1 {
            let tmpResults = self.layout(in: rect)
            xAxisRect = tmpResults.xAxisRect
            xAxisLabelsRect = tmpResults.xAxisLabelsRect
            yAxisRect = tmpResults.yAxisRect
            secondaryYAxisRect = tmpResults.secondaryYAxisRect
            chartRect = tmpResults.chartRect
            insets = tmpResults.insets
            
            DispatchQueue.main.async {
                if xAxisRect != self._chartRect {
                    self._xAxisRect = xAxisRect
                }
                if self._xAxisLabelsRect != xAxisLabelsRect {
                    self._xAxisLabelsRect = xAxisLabelsRect
                }
                if self._yAxisRect != yAxisRect {
                    self._yAxisRect = yAxisRect
                }
                if self._secondaryYAxisRect != secondaryYAxisRect {
                    self._secondaryYAxisRect = secondaryYAxisRect
                }
                if self._chartRect != chartRect {
                    self._chartRect = chartRect
                }
                if self._insets != insets {
                    self._insets = insets
                }
                if self.lastViewSize != rect.size {
                    self.lastViewSize = rect.size
                }
                if self.isLayoutNeeded {
                    self.isLayoutNeeded = false
                }
            }
        }
        
        let doubleTapGesture = TapGesture(count: 2).onEnded {
            self.yAxisExpanded.toggle()
        }
        
        let gridLinesAndChartView = GridLinesAndChartView(chartView: chartView,
                                                          indicatorView: indicatorView,
                                                          isLayoutNeeded: $isLayoutNeeded,
                                                          scaleX: model.scaleX,
                                                          scaleY: self.model.scaleY,
                                                          centerPosition: nil)
            .frame(width: chartRect.width, height: chartRect.height)
            .zIndex(3)
        
        return VStack(alignment: .leading) {
            Spacer().frame(height: insets.top)
            
            HStack(alignment: .top, spacing: 0) {
                Spacer().frame(width: insets.leading)
                
                // primary numerix axis
                VStack {
                    Spacer().frame(height: yAxisRect.origin.y)
                
                    if yAxisRect.width > 0 {
                        if model.userInteractionEnabled {
                            YAxisView(plotViewSize: chartRect.size)
                                .frame(height: yAxisRect.size.height)
                                .contentShape(Rectangle())
                                .gesture(doubleTapGesture)
                        } else {
                            YAxisView(plotViewSize: chartRect.size)
                                .frame(height: yAxisRect.size.height)
                                .contentShape(Rectangle())
                        }
                    }
                    
                    Spacer(minLength: 0)
                }.frame(width: yAxisRect.size.width, height: max(0, rect.size.height - insets.top - insets.bottom))
                
                // plot view
                VStack(alignment: .leading, spacing: 0) {
                    if model.chartType == .bar || model.chartType == .stackedBar || model.valueType == .allPositive {
                        gridLinesAndChartView
                        
                        XAxisView(plotViewSize: chartRect.size)
                            .frame(width: xAxisRect.width, height: xAxisRect.height)
                    } else if model.valueType == .allNegative {
                        XAxisView(isShowBaselineOnly: model.xAxisLabelsPosition == .fixedBottom ? true : false, plotViewSize: chartRect.size)
                            .frame(height: xAxisRect.height)
                        
                        gridLinesAndChartView
                        
                        if model.xAxisLabelsPosition == .fixedBottom {
                            XAxisView(isShowLabelsOnly: true, plotViewSize: chartRect.size)
                                .frame(height: xAxisLabelsRect.height)
                        }
                    } else {
                        ZStack {
                            XAxisView(isShowBaselineOnly: model.xAxisLabelsPosition == .fixedBottom ? true : false, plotViewSize: chartRect.size)
                                .frame(width: xAxisRect.width, height: xAxisRect.height)
                                .position(x: xAxisRect.size.width / 2, y: xAxisRect.origin.y + xAxisRect.size.height / 2)
                            
                            gridLinesAndChartView
                        }.zIndex(3)
                        
                        if model.xAxisLabelsPosition == .fixedBottom {
                            XAxisView(isShowLabelsOnly: true, plotViewSize: chartRect.size)
                                .frame(height: xAxisLabelsRect.height)
                        }
                    }
                }.zIndex(2)
                
                // secondary numerix axis
                VStack(spacing: 0) {
                    Spacer().frame(height: secondaryYAxisRect.origin.y)
                
                    if secondaryYAxisRect.width > 0 {
                        YAxisView(secondary: true, plotViewSize: chartRect.size)
                            .frame(height: secondaryYAxisRect.size.height)
                            .zIndex(2)
                    }
                    
                    Spacer(minLength: 0)
                }.frame(width: secondaryYAxisRect.size.width, height: max(0, rect.size.height - insets.top - insets.bottom))
                
                Spacer().frame(width: insets.trailing)
            }
            
            Spacer().frame(height: insets.bottom)
        }
    }
    
    func layoutBarType(in rect: CGRect) -> (xAxisRect: CGRect, xAxisLabelsRect: CGRect, yAxisRect: CGRect, secondaryYAxisRect: CGRect, chartRect: CGRect, insets: EdgeInsets) {
        let (yAxisWidth, topPadding, yAxisBottom) = self.yAxisLabelsSizeForBarType(rect.size)
        
        let (xAxisLabelsHeight, xAxisLeading, xAxisTrailing) = self.xAxisLabelsSizeForBarType(CGRect(origin: .zero, size: CGSize(width: rect.size.width - yAxisWidth, height: rect.size.height)))
        
        let xAxisBaselineHeight = self.model.numericAxis.baseline.isHidden ? 0 : min(self.model.numericAxis.baseline.width, rect.size.height)
        let xAxisHeight = min(xAxisBaselineHeight + xAxisLabelsHeight, rect.size.height)
        let bottomPadding = xAxisHeight > yAxisBottom ? 0 : yAxisBottom - xAxisHeight
        let trailingPadding = xAxisTrailing
        let leadingPadding = yAxisWidth > xAxisLeading ? 0 : xAxisLeading - yAxisWidth
        
        let chartWidth = max(rect.size.width - yAxisWidth - leadingPadding - trailingPadding, 0)
        let chartHeight = max(rect.size.height - xAxisHeight - topPadding - bottomPadding, 0)
        
        let yAxisRect = CGRect(x: 0, y: 0, width: yAxisWidth, height: chartHeight)
        let secondaryYAxisRect = CGRect.zero
        let chartRect = CGRect(x: 0, y: 0, width: chartWidth, height: chartHeight)
        let xAxisRect = CGRect(x: 0, y: 0, width: chartWidth, height: xAxisHeight)
        let xAxisLabelsRect = CGRect.zero
        
        return (xAxisRect, xAxisLabelsRect, yAxisRect, secondaryYAxisRect, chartRect, EdgeInsets(top: topPadding, leading: leadingPadding, bottom: bottomPadding, trailing: trailingPadding))
    }
    
    func layoutBubbleType(in rect: CGRect) -> (xAxisRect: CGRect, xAxisLabelsRect: CGRect, yAxisRect: CGRect, secondaryYAxisRect: CGRect, chartRect: CGRect, insets: EdgeInsets) {
        let (yAxisWidth, topPadding, yAxisBottom) = self.yAxisLabelsSize(rect.size)
        
        let (xAxisLabelsHeight, xAxisLeading, xAxisTrailing) = self.xAxisLabelsSize(CGRect(origin: .zero, size: CGSize(width: rect.size.width - yAxisWidth, height: rect.size.height)))
        
        let xAxisBaselineHeight = self.model.categoryAxis.baseline.isHidden ? 0 : min(self.model.categoryAxis.baseline.width, rect.size.height)
        let xAxisHeight = min(xAxisBaselineHeight + xAxisLabelsHeight, rect.size.height)
        
        let bottomPadding = xAxisHeight > yAxisBottom ? 0 : yAxisBottom - xAxisHeight
        
        let trailingPadding = xAxisTrailing
        let leadingPadding = yAxisWidth > xAxisLeading ? 0 : xAxisLeading - yAxisWidth
        
        let chartWidth = max(rect.size.width - yAxisWidth - leadingPadding - trailingPadding, 0)
        let chartHeight = max(rect.size.height - xAxisHeight - topPadding - bottomPadding, 0)
        
        let yAxisRect = CGRect(x: 0, y: 0, width: yAxisWidth, height: chartHeight)
        let secondaryYAxisRect = CGRect.zero
        let chartRect = CGRect(x: 0, y: 0, width: chartWidth, height: chartHeight)
        let xAxisRect = CGRect(x: 0, y: 0, width: chartWidth, height: xAxisHeight)
        let xAxisLabelsRect = CGRect.zero
        
        return (xAxisRect, xAxisLabelsRect, yAxisRect, secondaryYAxisRect, chartRect, EdgeInsets(top: topPadding, leading: leadingPadding, bottom: bottomPadding, trailing: trailingPadding))
    }
    
    func layoutLineStockColumnCombo(in rect: CGRect) -> (xAxisRect: CGRect, xAxisLabelsRect: CGRect, yAxisRect: CGRect, secondaryYAxisRect: CGRect, chartRect: CGRect, insets: EdgeInsets) {
        let (yAxisWidth, _, _) = self.yAxisLabelsSize(rect.size)
        let (secondaryYAxisWidth, _, _) = self.yAxisLabelsSize(rect.size, secondary: true)
        
        let (xAxisLabelsHeight, tmpXAxisLeading, tmpXAxisTrailing) = self.xAxisLabelsSize(CGRect(origin: .zero, size: CGSize(width: rect.size.width - yAxisWidth - secondaryYAxisWidth, height: rect.size.height)))
        let paddingForPoints = self.horizontalPaddingForSeriesPoints()
        let xAxisLeading = max(tmpXAxisLeading, paddingForPoints)
        let xAxisTrailing = max(tmpXAxisTrailing, paddingForPoints)
        
        let xAxisBaselineHeight = self.model.categoryAxis.baseline.isHidden ? 0 : min(self.model.categoryAxis.baseline.width, rect.size.height)
        let xAxisHeight = min(xAxisBaselineHeight + xAxisLabelsHeight, rect.size.height)
        
        //
        let (_, yAxisTop, yAxisBottom) = self.yAxisLabelsSize(CGSize(width: rect.size.width, height: rect.size.height - xAxisHeight))
        let (_, secondaryYAxisTop, secondaryYAxisBottom) = self.yAxisLabelsSize(CGSize(width: rect.size.width, height: rect.size.height - xAxisHeight), secondary: true)
        
        let valueType = self.model.valueType
        let topPadding, bottomPadding: CGFloat
        
        if valueType == .allNegative {
            if self.model.xAxisLabelsPosition == .dynamic {
                topPadding = xAxisHeight > max(yAxisTop, secondaryYAxisTop) ? 0 : max(yAxisTop, secondaryYAxisTop) - xAxisHeight
            } else {
                topPadding = xAxisBaselineHeight > max(yAxisTop, secondaryYAxisTop) ? 0 : max(yAxisTop, secondaryYAxisTop) - xAxisBaselineHeight
            }
        } else {
            topPadding = max(yAxisTop, secondaryYAxisTop)
        }
        
        if valueType == .allPositive {
            bottomPadding = xAxisHeight > max(yAxisBottom, secondaryYAxisBottom) ? 0 : max(yAxisBottom, secondaryYAxisBottom) - xAxisHeight
        } else {
            if self.model.xAxisLabelsPosition == .fixedBottom {
                bottomPadding = xAxisLabelsHeight > max(yAxisBottom, secondaryYAxisBottom) ? 0 : max(yAxisBottom, secondaryYAxisBottom) - xAxisLabelsHeight
            } else {
                bottomPadding = max(yAxisBottom, secondaryYAxisBottom)
            }
        }
        
        let trailingPadding = secondaryYAxisWidth > xAxisTrailing ? 0 : xAxisTrailing - secondaryYAxisWidth
        let leadingPadding = yAxisWidth > xAxisLeading ? 0 : xAxisLeading - yAxisWidth
        
        let chartWidth = max(rect.size.width - yAxisWidth - secondaryYAxisWidth - leadingPadding - trailingPadding, 0)
        var chartHeight = max(rect.size.height - xAxisHeight - topPadding - bottomPadding, 0)
        
        var xAxisRect, xAxisLabelsRect, yAxisRect, secondaryYAxisRect, chartRect: CGRect
        
        switch valueType {
        case .allPositive:
            yAxisRect = CGRect(x: 0, y: 0, width: yAxisWidth, height: chartHeight)
            secondaryYAxisRect = CGRect(x: 0, y: 0, width: secondaryYAxisWidth, height: chartHeight)
            chartRect = CGRect(x: 0, y: 0, width: chartWidth, height: chartHeight)
            xAxisRect = CGRect(x: 0, y: 0, width: chartWidth, height: xAxisHeight)
            xAxisLabelsRect = .zero
        case .allNegative:
            if self.model.xAxisLabelsPosition == .dynamic {
                yAxisRect = CGRect(x: 0, y: xAxisHeight, width: yAxisWidth, height: chartHeight)
                secondaryYAxisRect = CGRect(x: 0, y: xAxisHeight, width: secondaryYAxisWidth, height: chartHeight)
                xAxisRect = CGRect(x: 0, y: 0, width: chartWidth, height: xAxisHeight)
                chartRect = CGRect(x: 0, y: 0, width: chartWidth, height: chartHeight)
                xAxisLabelsRect = .zero
            } else {
                yAxisRect = CGRect(x: 0, y: xAxisBaselineHeight, width: yAxisWidth, height: chartHeight)
                secondaryYAxisRect = CGRect(x: 0, y: xAxisBaselineHeight, width: secondaryYAxisWidth, height: chartHeight)
                xAxisRect = CGRect(x: 0, y: 0, width: chartWidth, height: xAxisBaselineHeight)
                chartRect = CGRect(x: 0, y: 0, width: chartWidth, height: chartHeight)
                xAxisLabelsRect = CGRect(x: yAxisWidth, y: rect.size.height - xAxisLabelsHeight, width: chartWidth, height: xAxisLabelsHeight)
            }
        case .mixed:
            if self.model.xAxisLabelsPosition == .dynamic {
                chartHeight = max(rect.size.height - topPadding - bottomPadding, 0)
                
                yAxisRect = CGRect(x: 0, y: 0, width: yAxisWidth, height: chartHeight)
                secondaryYAxisRect = CGRect(x: 0, y: 0, width: secondaryYAxisWidth, height: chartHeight)
                chartRect = CGRect(x: yAxisWidth, y: 0, width: chartWidth, height: chartHeight)
            } else {
                chartHeight = max(rect.size.height - xAxisLabelsHeight - topPadding - bottomPadding, 0)
                yAxisRect = CGRect(x: 0, y: 0, width: yAxisWidth, height: chartHeight)
                secondaryYAxisRect = CGRect(x: 0, y: 0, width: secondaryYAxisWidth, height: chartHeight)
                chartRect = CGRect(x: 0, y: 0, width: chartWidth, height: chartHeight)
            }
            var baselineYPos: CGFloat = rect.size.height - xAxisHeight
            var useSecondary = false
            if yAxisWidth == 0 {
                useSecondary = true
            }
            let yAxisLabels = self.chartContext.yAxisLabels(self.model, layoutDirection: self.layoutDirection, secondary: useSecondary, rect: chartRect, plotViewSize: rect.size)
            for label in yAxisLabels {
                if abs(label.value) < 0.001 {
                    baselineYPos = label.pos.y
                    break
                }
            }
            
            if self.model.xAxisLabelsPosition == .dynamic {
                xAxisRect = CGRect(x: 0, y: baselineYPos, width: chartWidth, height: xAxisHeight)
                xAxisLabelsRect = .zero
            } else {
                xAxisRect = CGRect(x: 0, y: baselineYPos, width: chartWidth, height: xAxisBaselineHeight)
                xAxisLabelsRect = CGRect(x: 0, y: 0, width: chartWidth, height: xAxisLabelsHeight)
            }
        }
        
        return (xAxisRect, xAxisLabelsRect, yAxisRect, secondaryYAxisRect, chartRect, EdgeInsets(top: topPadding, leading: leadingPadding, bottom: bottomPadding, trailing: trailingPadding))
    }

    func layout(in rect: CGRect) -> (xAxisRect: CGRect, xAxisLabelsRect: CGRect, yAxisRect: CGRect, secondaryYAxisRect: CGRect, chartRect: CGRect, insets: EdgeInsets) {
        if self.model.isBarType() {
            return self.layoutBarType(in: rect)
        } else if self.model.isBubbleType() {
            return self.layoutBubbleType(in: rect)
        } else {
            return self.layoutLineStockColumnCombo(in: rect)
        }
    }
    
    /*
      height: required height
      leading: required leading padding for labels
      trailing: required trailing padding for labels
      point: required padding for series points
     */
    func xAxisLabelsSizeForBarType(_ rect: CGRect) -> (height: CGFloat, leading: CGFloat, trailing: CGFloat) {
        if rect.size.width <= 0 || rect.size.height <= 0 {
            return (0, 0, 0)
        }
        
        if self.model.numericAxis.labels.isHidden {
            return (self.model.numericAxis.gridlines.isHidden ? 0 : self.model.numericAxis.gridlines.width, 0, 0)
        }
        
        var leading: CGFloat = 0
        var trailing: CGFloat = 0
        var height: CGFloat = 16
        let tmpLabels = self.chartContext.xAxisLabels(self.model)
        let labels = tmpLabels.map { label in
            AxisTitle(index: label.index, value: label.value, title: label.title, pos: CGPoint(x: label.pos.x * rect.size.width, y: label.pos.y), size: label.size)
        }
        
        let requiredWidth = ChartUtility.requiredWidthToShowXAxisLables(self.model, labels: labels)

        if labels.isEmpty {
            return (0, 0, 0)
        }
        
        // not enough width to show x axis labels
        if requiredWidth > rect.size.width, !self.model.scaleXEnabled {
            return (0, 0, 0)
        }
        
        for label in labels {
            if label.pos.x < 0 || label.pos.x > rect.size.width {
                continue
            }
            let size: CGSize = label.size
            
            if label.pos.x - size.width / 2 < 0 {
                leading = max(leading, abs(label.pos.x - size.width / 2))
            }
            
            if label.pos.x + size.width / 2 > rect.size.width {
                trailing = max(trailing, abs(label.pos.x + size.width / 2 - rect.size.width))
            }
            
            // spacing btw baseline and labels are 3pt
            height = max(height, size.height)
        }

        let finalHeight = height > 0 ? min(height + 3, rect.size.height) : 0
        
        return (finalHeight, leading, trailing)
    }
    
    /*
      height: required height
      leading: required leading padding for labels
      trailing: required trailing padding for labels
      point: required padding for series points
     */
    func xAxisLabelsSize(_ rect: CGRect) -> (height: CGFloat, leading: CGFloat, trailing: CGFloat) {
        if rect.size.width <= 0 || rect.size.height <= 0 {
            return (0, 0, 0)
        }
        
        if self.model.categoryAxis.labels.isHidden {
            return (self.model.categoryAxis.gridlines.isHidden ? 0 : self.model.categoryAxis.gridlines.width, 0, 0)
        }
        
        var leading: CGFloat = 0
        var trailing: CGFloat = 0
        var height: CGFloat = 16
        let tmpLabels = self.model.chartType == .stock ? self.chartContext.xAxisLabels(self.model, rect: rect, plotViewSize: rect.size) : self.chartContext.xAxisLabels(self.model)
        var requiredWidth: CGFloat = 0
        var labels = tmpLabels
        if labels.isEmpty {
            return (0, 0, 0)
        }
        
        if self.model.chartType != .stock, self.model.categoryAxis.labelLayoutStyle == .allOrNothing, !self.model.scaleXEnabled {
            let tmpLabelsChanged = tmpLabels.map { label in
                AxisTitle(index: label.index, value: label.value, title: label.title, pos: CGPoint(x: label.pos.x * rect.size.width, y: label.pos.y), size: label.size)
            }
            requiredWidth = ChartUtility.requiredWidthToShowXAxisLables(self.model, labels: tmpLabelsChanged)
            if requiredWidth > rect.size.width {
                // check current status
                let curLabels = self.chartContext.xAxisLabels(self.model, rect: rect, plotViewSize: rect.size)
                    .compactMap { label -> AxisTitle? in
                        if label.pos.x >= 0, label.pos.x <= rect.size.width {
                            return label
                        } else {
                            return nil
                        }
                    }
                
                requiredWidth = ChartUtility.requiredWidthToShowXAxisLables(self.model, labels: curLabels)
                if requiredWidth > rect.size.width {
                    return (0, 0, 0)
                }
            }
        }

        if self.model.categoryAxis.labelLayoutStyle == .range {
            labels = []
            
            if !tmpLabels.isEmpty {
                labels.append(tmpLabels[0])
            }
            
            if tmpLabels.count > 1 {
                labels.append(tmpLabels[tmpLabels.count - 1])
            }
        }

        for label in labels {
            if label.pos.x < 0 || label.pos.x > rect.size.width {
                continue
            }
            let size: CGSize = label.size
            
            // spacing btw baseline and labels are 3pt
            height = max(height, size.height)
        }
        
        // find out leading and trailing padding
        if self.model.categoryAxis.labelLayoutStyle == .allOrNothing, self.model.isLineType() || self.model.isBubbleType() {
            if self.model.chartType == .stock {
                leading = max(0, labels[0].size.width / 2 - labels[0].pos.x)
            } else {
                leading = labels[0].size.width / 2
            }
            
            if labels.count > 1 {
                if self.model.chartType == .stock {
                    // pos is in point unit [0, rect.size.width]
                    trailing = max(0, labels[labels.count - 1].size.width / 2 + labels[labels.count - 1].pos.x - rect.size.width)
                } else {
                    // pos is in [0, 1]
                    trailing = labels[labels.count - 1].size.width / 2
                }
            }
        }

        let finalHeight = height > 0 ? min(height + 3, rect.size.height) : 0
        
        return (finalHeight, leading, trailing)
    }
    
    /**
     Minimum: 20px from left edge of content area
     Maximum: 35% of content area
     Expanded State: when the y-axis label area its at its maximum width and values are still truncated, the user can double tap the y-axis label area to expand the y-axis label area to the right. This will increase the width of the labels up to 60% of the content area. Double tapping the expanded y-axis label area will return it to its maximum.
     */
    func yAxisLabelsSizeForBarType(_ size: CGSize) -> (width: CGFloat, top: CGFloat, bottom: CGFloat) {
        if size.width <= 0 || size.height <= 0 {
            return (0, 0, 0)
        }
        
        let axis = self.model.categoryAxis
        if axis.labels.isHidden {
            return (axis.gridlines.isHidden ? 0 : axis.gridlines.width, 0, 0)
        }

        // min width is 20
        var width: CGFloat = ChartViewLayout.minYAxisViewWidth
        var top: CGFloat = 0
        var bottom: CGFloat = 0
        
        let labels = self.chartContext.yAxisLabels(self.model, layoutDirection: self.layoutDirection, secondary: false)
        
        for label in labels {
            // spacing btw baseline and labels are 3pt
            width = max(width, label.size.width + axis.baseline.width + ChartViewLayout.minSpacingBtwYAxisLabelAndBaseline)
        }
        
        if !labels.isEmpty {
            let value = labels[0].pos.y * size.height - labels[0].size.height / 2
            if value < 0 {
                top = abs(value)
            }
        }
        
        if labels.count > 1 {
            let value = labels[labels.count - 1].pos.y * size.height + labels[labels.count - 1].size.height / 2 - size.height
            if value > 0 {
                bottom = value
            }
        }
        
        if width > size.width * ChartViewLayout.maxYAxisViewWidthRatio, !self.yAxisExpanded {
            width = size.width * ChartViewLayout.maxYAxisViewWidthRatio
        } else if width > size.width * ChartViewLayout.maxExpandedYAxisViewWidthRatio, self.yAxisExpanded {
            width = size.width * ChartViewLayout.maxExpandedYAxisViewWidthRatio
        }
        
        return (width, top, bottom)
    }
    
    /**
     Minimum: 20px from left edge of content area
     Maximum: 35% of content area
     Expanded State: when the y-axis label area its at its maximum width and values are still truncated, the user can double tap the y-axis label area to expand the y-axis label area to the right. This will increase the width of the labels up to 60% of the content area. Double tapping the expanded y-axis label area will return it to its maximum.
     */
    func yAxisLabelsSize(_ size: CGSize, secondary: Bool = false) -> (width: CGFloat, top: CGFloat, bottom: CGFloat) {
        if size.width <= 0 || size.height <= 0 || (secondary && !self.model.supportSecondaryNumericAxis()) {
            return (0, 0, 0)
        }
        
        let allIndexs = IndexSet(integersIn: 0 ..< self.model.data.count)
        var indexes: [Int] = allIndexs.sorted()
        
        // For clustered line, area and combo charts this is the secondary Y axis.
        if self.model.chartType == .line || self.model.chartType == .area || self.model.chartType == .combo {
            indexes = secondary ? self.model.indexesOfSecondaryValueAxis.sorted() : self.model.indexesOfSecondaryValueAxis.symmetricDifference(allIndexs).sorted()
        } else {
            if secondary {
                return (0, 0, 0)
            }
        }
        
        let axis = secondary ? self.model.secondaryNumericAxis : self.model.numericAxis
        
        if indexes.isEmpty {
            return (0, 0, 0)
        }
        
        let paddingForSeriesPoints = self.verticalPaddingForSeriesPoints(for: size)
        
        if axis.labels.isHidden {
            return (axis.gridlines.isHidden ? 0 : axis.gridlines.width, paddingForSeriesPoints.top, paddingForSeriesPoints.bottom)
        }

        // min width is 20
        var width: CGFloat = ChartViewLayout.minYAxisViewWidth
        var top: CGFloat = 0
        var bottom: CGFloat = 0
        
        let labels = self.chartContext.yAxisLabels(self.model, layoutDirection: self.layoutDirection, secondary: secondary)
        
        for label in labels {
            let size = label.size

            // spacing btw baseline and labels are 3pt
            width = max(width, size.width + axis.baseline.width + ChartViewLayout.minSpacingBtwYAxisLabelAndBaseline)
        }
        
        if !labels.isEmpty {
            top = max(0, labels[0].size.height / 2 - labels[0].pos.y * size.height)
        }
        
        if labels.count > 1 {
            bottom = max(0, labels[labels.count - 1].size.height / 2 - (1 - labels[labels.count - 1].pos.y) * size.height)
        }
        
        if secondary, width > size.width * ChartViewLayout.maxSecondaryYAxisViewWidthRatio {
            width = size.width * ChartViewLayout.maxSecondaryYAxisViewWidthRatio
        } else if !secondary, width > size.width * ChartViewLayout.maxYAxisViewWidthRatio, !self.yAxisExpanded {
            width = size.width * ChartViewLayout.maxYAxisViewWidthRatio
        } else if !secondary, width > size.width * ChartViewLayout.maxExpandedYAxisViewWidthRatio, self.yAxisExpanded {
            width = size.width * ChartViewLayout.maxExpandedYAxisViewWidthRatio
        }
        
        return (width, max(top, paddingForSeriesPoints.top), max(bottom, paddingForSeriesPoints.bottom))
    }
    
    func horizontalPaddingForSeriesPoints() -> CGFloat {
        // no need to consider combo chart since it is displayed in certer of a category
        if !self.model.isLineType() {
            return 0
        }
        
        var padding: CGFloat = 0
        let seriesIndices: [Int] = self.model.chartType == .stock ? [self.model.indexOfStockSeries] : Array(0 ..< self.model.numOfSeries())
        for seriesIndex in seriesIndices {
            if !self.model.seriesAttributes[seriesIndex].point.isHidden {
                padding = max(padding, self.model.seriesAttributes[seriesIndex].point.diameter / 2)
            }
        }
        
        if self.model.userInteractionEnabled && self.model.selectionEnabled {
            padding += ChartViewLayout.extraSelectedPointRadiusWidth + ChartViewLayout.extraSelectedPointWhiteBoderRadiusWidth
        }
        
        return padding
    }
    
    func verticalPaddingForSeriesPoints(for size: CGSize) -> (top: CGFloat, bottom: CGFloat) {
        if !(self.model.isLineType() || self.model.chartType == .combo) || size.width == 0 || size.height == 0 {
            return (0, 0)
        }
        
        var maxPointRadius: CGFloat = 0
        var maxPointRadiusForSecondary: CGFloat = 0
        let seriesIndices: [Int] = self.model.chartType == .stock ? [self.model.indexOfStockSeries] : Array(0 ..< self.model.numOfSeries())
        for seriesIndex in seriesIndices {
            var secondary = false
            if self.model.chartType != .stock, self.model.indexesOfSecondaryValueAxis.contains(seriesIndex) {
                secondary = true
            }
            if self.model.chartType == .combo {
                // line series
                if !self.model.indexesOfColumnSeries.contains(seriesIndex), !self.model.seriesAttributes[seriesIndex].point.isHidden || self.model.userInteractionEnabled && self.model.selectionEnabled {
                    let value = max(maxPointRadius, model.seriesAttributes[seriesIndex].point.diameter / 2)
                    if secondary {
                        maxPointRadiusForSecondary = value
                    } else {
                        maxPointRadius = value
                    }
                }
            } else {
                if !self.model.seriesAttributes[seriesIndex].point.isHidden || (self.model.userInteractionEnabled && self.model.selectionEnabled) {
                    let value = max(maxPointRadius, model.seriesAttributes[seriesIndex].point.diameter / 2)
                    if secondary {
                        maxPointRadiusForSecondary = value
                    } else {
                        maxPointRadius = value
                    }
                }
            }
        }
        
        if maxPointRadius == 0, maxPointRadiusForSecondary == 0 {
            return (0, 0)
        }
        
        if self.model.userInteractionEnabled, self.model.selectionEnabled {
            maxPointRadius += ChartViewLayout.extraSelectedPointRadiusWidth + ChartViewLayout.extraSelectedPointWhiteBoderRadiusWidth
            maxPointRadiusForSecondary += ChartViewLayout.extraSelectedPointRadiusWidth + ChartViewLayout.extraSelectedPointWhiteBoderRadiusWidth
        }
        
        var topPadding: CGFloat = 0
        var bottomPadding: CGFloat = 0
        let natv = self.model.numericAxisTickValues
        
        if natv.plotRange > 0 {
            let topDistance = abs(natv.plotMaximum - natv.dataMaximum) * size.height / natv.plotRange
            // top padding
            topPadding = maxPointRadius - topDistance
            
            let bottomDistance = abs(natv.dataMinimum - natv.plotMinimum) * size.height / natv.plotRange
            // bottom padding
            bottomPadding = maxPointRadius - bottomDistance
        }
        
        if self.model.chartType != .stock, !self.model.indexesOfSecondaryValueAxis.isEmpty {
            let snatv = self.model.secondaryNumericAxisTickValues
            let topDistance = abs(snatv.plotMaximum - snatv.dataMaximum) * size.height / snatv.plotRange
            // top padding
            topPadding = max(topPadding, maxPointRadiusForSecondary - topDistance)
            
            let bottomDistance = abs(snatv.dataMinimum - snatv.plotMinimum) * size.height / snatv.plotRange
            // bottom padding
            bottomPadding = max(bottomPadding, maxPointRadiusForSecondary - bottomDistance)
        }
        
        return (topPadding, bottomPadding)
    }
}

struct XYAxisChart_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            XYAxisChart(model: Tests.lineModels[0],
                        chartContext: LineChartContext(),
                        chartView: LinesView(),
                        indicatorView: LineIndicatorView())
                .environmentObject(Tests.lineModels[0])
                .frame(width: 300, height: 400)

            XYAxisChart(model: Tests.lineModels[1],
                        chartContext: LineChartContext(),
                        chartView: LinesView(),
                        indicatorView: LineIndicatorView())
                .environmentObject(Tests.lineModels[0])
                .frame(width: 300, height: 400)

            XYAxisChart(model: Tests.lineModels[2],
                        chartContext: LineChartContext(),
                        chartView: LinesView(),
                        indicatorView: LineIndicatorView())
                .environmentObject(Tests.lineModels[0])
                .frame(width: 300, height: 400)
            
            XYAxisChart(model: Tests.lineModels[3],
                        chartContext: LineChartContext(),
                        chartView: LinesView(),
                        indicatorView: LineIndicatorView())
                .environmentObject(Tests.lineModels[0])
                .frame(width: 300, height: 400)
            
            XYAxisChart(model: Tests.lineModels[4],
                        chartContext: LineChartContext(),
                        chartView: LinesView(),
                        indicatorView: LineIndicatorView())
                .environmentObject(Tests.lineModels[0])
                .frame(width: 300, height: 400)
        }
    }
}
