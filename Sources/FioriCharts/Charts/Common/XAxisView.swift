import SwiftUI

struct XAxisView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    
    let isShowBaselineOnly: Bool
    let isShowLabelsOnly: Bool
    let plotViewSize: CGSize
    
    init(isShowBaselineOnly: Bool = false, isShowLabelsOnly: Bool = false, plotViewSize: CGSize) {
        self.isShowBaselineOnly = isShowBaselineOnly
        self.isShowLabelsOnly = isShowLabelsOnly
        self.plotViewSize = plotViewSize
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let labels: [AxisTitle] = self.chartContext.xAxisLabels(self.model, rect: rect, plotViewSize: self.plotViewSize)
        var isShowLabels = [Bool]()
        for label in labels {
            if label.pos.x >= -1, label.pos.x <= rect.size.width + 1 {
                isShowLabels.append(true)
            } else {
                isShowLabels.append(false)
            }
        }
        
        var baselineYPos: CGFloat = self.model.categoryAxis.baseline.width / 2
        var labelYPos: CGFloat = self.model.categoryAxis.baseline.width + 3 + (rect.size.height - self.model.categoryAxis.baseline.width - 3) / 2
        let valueType = self.model.valueType
        if valueType == .allNegative && (self.model.chartType != .bar || self.model.chartType != .stackedBar) {
            labelYPos = (rect.size.height - self.model.categoryAxis.baseline.width - 3) / 2
            baselineYPos = rect.size.height - self.model.categoryAxis.baseline.width / 2
        }
        
        if self.isShowLabelsOnly {
            labelYPos = 3 + (rect.size.height - 3) / 2
        }
        
        let axis = self.model.chartType == .bar || self.model.chartType == .stackedBar ? self.model.numericAxis : self.model.categoryAxis
        let isEnoughSpaceToShowXAxisLables = self.isEnoughSpaceToShowXAxisLables(labels: labels)
        
        return ZStack {
            if isEnoughSpaceToShowXAxisLables, !axis.labels.isHidden, !self.isShowBaselineOnly {
                ForEach(0 ..< labels.count, id: \.self) { index in
                    Group {
                        if isShowLabels[index] {
                            Text(labels[index].title)
                                .font(.fiori(fixedSize: axis.labels.fontSize))
                                .foregroundColor(axis.labels.color)
                                .frame(maxWidth: rect.size.width / 2)
                                .position(x: labels[index].pos.x, y: labelYPos)
                        } else {
                            EmptyView()
                        }
                    }
                }
            }
            
            // base line
            if !axis.baseline.isHidden, !self.isShowLabelsOnly {
                LineShape(pos1: .zero,
                          pos2: CGPoint(x: rect.size.width, y: 0))
                    .offset(x: 0, y: baselineYPos)
                    .stroke(axis.baseline.color,
                            style: StrokeStyle(
                                lineWidth: axis.baseline.width,
                                dash: [axis.baseline.dashPatternLength, axis.baseline.dashPatternGap]
                            ))
            }
        }
        .animation(nil)
    }
    
    func isEnoughSpaceToShowXAxisLables(labels: [AxisTitle]) -> Bool {
        if self.plotViewSize.width <= 0 || self.plotViewSize.height <= 0 {
            return false
        }
        
        var totalWidth: CGFloat = 0
        var prevXPos: CGFloat = -100000
        var prevLabelWidth: CGFloat = 0
        if labels.isEmpty {
            return true
        }
        
        for label in labels {
            if label.pos.x < 0 || label.pos.x > self.plotViewSize.width {
                continue
            }
            let size: CGSize = label.size
            
            // check if the gap btw two adjacent labels is greater than 4pt
            if label.pos.x < prevXPos + prevLabelWidth / 2.0 + size.width / 2.0 + ChartViewLayout.minSpacingBtwXAxisLabels {
                totalWidth += self.plotViewSize.width
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
        if self.model.chartType != .stock, self.model.categoryAxis.labelLayoutStyle == .allOrNothing, totalWidth > self.plotViewSize.width {
            return false
        } else {
            return true
        }
    }
}

struct XAxisView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.lineModels) {
                XAxisView(plotViewSize: CGSize(width: 300, height: 200))
                    .environmentObject($0)
                    .environment(\.chartContext, LineChartContext())
            }
            .frame(width: 300, height: 20, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
            
            ForEach(Tests.stockModels) {
                XAxisView(plotViewSize: CGSize(width: 300, height: 200))
                    .environmentObject($0)
                    .environment(\.chartContext, StockChartContext())
            }
            .frame(width: 300, height: 20, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
        }
    }
}
