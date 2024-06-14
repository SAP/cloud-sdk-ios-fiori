import SwiftUI

struct YAxisView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
    @State var yAxisExpanded: Bool = false
    
    let secondary: Bool
    let plotViewSize: CGSize
    
    init(secondary: Bool = false, plotViewSize: CGSize) {
        self.secondary = secondary
        self.plotViewSize = plotViewSize
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let labels: [AxisTitle] = self.chartContext.yAxisLabels(self.model, layoutDirection: self.layoutDirection, secondary: self.secondary, rect: rect, plotViewSize: self.plotViewSize)
    
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
        
        let axis = self.model.chartType == .bar || self.model.chartType == .stackedBar ? self.model.categoryAxis : (self.secondary ? self.model.secondaryNumericAxis : self.model.numericAxis)
        let baselineX: CGFloat
        if self.secondary {
            if self.layoutDirection == .leftToRight {
                baselineX = axis.baseline.width / 2
            } else {
                baselineX = -axis.baseline.width / 2
            }
        } else {
            if self.layoutDirection == .leftToRight {
                baselineX = rect.size.width + axis.baseline.width / 2
            } else {
                baselineX = rect.size.width - axis.baseline.width / 2
            }
        }
        
        return ZStack {
            if !axis.labels.isHidden {
                ForEach(0 ..< labels.count, id: \.self) { index in
                    // y axis lables
                    Group {
                        if isShowLabels[index] {
                            Text(labels[index].title)
                                .font(axis.labels.targetFont)
                                .foregroundColor(axis.labels.color)
                                .background(axis.labels.backgroundColor)
                                .position(x: labels[index].pos.x,
                                          y: labels[index].pos.y)
                                .frame(maxWidth: rect.size.width)
                                .lineLimit(1)
                                .truncationMode(.tail)
                        } else {
                            EmptyView()
                        }
                    }
                }
            }
            
            if !axis.baseline.isHidden {
                // left base line
                LineShape(pos1: CGPoint(x: 0, y: 0),
                          pos2: CGPoint(x: 0, y: rect.size.height + self.model.categoryAxis.baseline.width))
                    .stroke(axis.baseline.color,
                            style: StrokeStyle(lineWidth: axis.baseline.width,
                                               dash: [axis.baseline.dashPatternLength, axis.baseline.dashPatternGap]))
                    .frame(width: axis.baseline.width, height: rect.size.height)
                    .position(x: baselineX, y: rect.size.height / 2)
            }
        }
        .transaction { $0.animation = nil }
    }
}

struct YAxisView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.lineModels) {
                YAxisView(plotViewSize: CGSize(width: 300, height: 200))
                    .environmentObject($0)
                    .environment(\.chartContext, LineChartContext())
            }
            .frame(width: 80, height: 200, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
            
            ForEach(Tests.lineModels) {
                YAxisView(secondary: true, plotViewSize: CGSize(width: 300, height: 200))
                    .environmentObject($0)
                    .environment(\.chartContext, LineChartContext())
            }
            .frame(width: 80, height: 200, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
        }
    }
}
