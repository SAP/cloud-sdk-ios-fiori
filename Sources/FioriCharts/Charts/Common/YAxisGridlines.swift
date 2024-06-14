import SwiftUI

struct YAxisGridlines: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
    
    let plotViewSize: CGSize
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let allIndexs = IndexSet(integersIn: 0 ..< self.model.data.count)
        let indexes = self.model.indexesOfSecondaryValueAxis.symmetricDifference(allIndexs).sorted()
        let secondary: Bool = indexes.isEmpty ? true : false
        
        let labels: [AxisTitle] = self.chartContext.yAxisLabels(self.model, layoutDirection: self.layoutDirection, secondary: secondary, rect: rect, plotViewSize: self.plotViewSize)
        
        var indexToRemove = -1
        if self.model.chartType != .bar || self.model.chartType != .stackedBar {
            let displayRange = ChartUtility.displayRange(self.model, secondary: secondary)
            var valueToRemove: CGFloat = displayRange.lowerBound
            let valueType = self.model.valueType
            if valueType == .allNegative {
                valueToRemove = displayRange.upperBound
            } else if valueType == .mixed {
                valueToRemove = 0
            }
            
            for (i, label) in labels.enumerated() {
                if abs(valueToRemove.distance(to: label.value)) < 0.001 {
                    indexToRemove = i
                    break
                }
            }
        }
        
        var isShowLabels = [Bool]()
        var preYPos: CGFloat = -10000
        for label in labels {
            if label.pos.y >= -1, label.pos.y <= rect.size.height + 1, label.pos.y - preYPos > label.size.height + ChartViewLayout.minSpacingBtwYAxisLabels {
                isShowLabels.append(true)
                preYPos = label.pos.y
            } else {
                isShowLabels.append(false)
            }
        }
        
        if indexToRemove >= 0 && indexToRemove < labels.count {
            isShowLabels[indexToRemove] = false
        }
            
        let axis = self.model.chartType == .bar || self.model.chartType == .stackedBar ? self.model.categoryAxis : self.model.numericAxis
        let dash = [axis.gridlines.dashPatternLength, axis.gridlines.dashPatternGap]
        return ZStack {
            if !axis.gridlines.isHidden {
                ForEach(0 ..< labels.count, id: \.self) { index in
                    Group {
                        // grid lines
                        if isShowLabels[index] {
                            LineShape(pos1: CGPoint(x: 0, y: labels[index].pos.y),
                                      pos2: CGPoint(x: rect.size.width, y: labels[index].pos.y))
                                .stroke(axis.gridlines.color, style: StrokeStyle(lineWidth: axis.gridlines.width, dash: dash))
                        } else {
                            EmptyView()
                        }
                    }
                }
            }
        }
        .transaction { $0.animation = nil }
        .clipped()
    }
}

struct YAxisGridlines_Previews: PreviewProvider {
    static var previews: some View {
        YAxisGridlines(plotViewSize: CGSize(width: 300, height: 200))
            .environmentObject(Tests.stockModels[1])
            .environment(\.chartContext, StockChartContext())
            .frame(width: 80, height: 200, alignment: .topLeading)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
