//
//  XAxisGridlines.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/23/20.
//

import SwiftUI

struct XAxisGridlines: View {
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
        let labels: [AxisTitle] = chartContext.xAxisGridlines(model, rect: rect, plotViewSize: plotViewSize)
        var indexToRemove = -1
        if let first = labels.first, abs(first.pos.x) < 0.001 {
            indexToRemove = first.index
        }
        
        var isShowLabels = [Bool]()
        for label in labels {
            if label.pos.x >= -1 && label.pos.x <= rect.size.width + 1 {
                isShowLabels.append(true)
            } else {
                isShowLabels.append(false)
            }
        }
        if indexToRemove >= 0 && indexToRemove < labels.count {
            isShowLabels[indexToRemove] = false
        }

        let axis = model.chartType == .bar || model.chartType == .stackedBar ? model.numericAxis : model.categoryAxis
        let valueType = model.valueType
        let ticks = model.numericAxisTickValues
        let zeroX: CGFloat = rect.size.width * ticks.plotBaselinePosition
        let dash = [axis.gridlines.dashPatternLength, axis.gridlines.dashPatternGap]
        
        return ZStack {
            if !axis.gridlines.isHidden {
                ForEach(0..<labels.count, id: \.self) { index in
                    Group {
                        if isShowLabels[index] {
                            LineShape(pos1: .zero,
                                      pos2: CGPoint(x: 0, y: rect.size.height),
                                      layoutDirection: self.layoutDirection)
                                .stroke(axis.gridlines.color, style: StrokeStyle(lineWidth: axis.gridlines.width, dash: dash))
                                .offset(x: labels[index].pos.x)
                        } else {
                            EmptyView()
                        }
                    }
                }
            }
            
            // a vertical line between negative bars and positive bars in Bar Chart
            if model.chartType == .bar && valueType == .mixed {
                LineShape(pos1: .zero,
                      pos2: CGPoint(x: 0, y: rect.size.height),
                      layoutDirection: self.layoutDirection)
                .stroke(axis.gridlines.color,
                        style: StrokeStyle(lineWidth: axis.gridlines.width,
                                           dash: [axis.gridlines.dashPatternLength, 0]))
                .offset(x: zeroX)
            }
        }.animation(nil)
    }
    
    func dashGap(label: AxisTitle, gap: CGFloat) -> CGFloat {
        if model.chartType == .bar && abs(label.value) < 0.0001 {
            return 0
        } else {
            return gap
        }
    }
}

struct XAxisGridlines_Previews: PreviewProvider {
    static var previews: some View {
        return Group {
            ForEach(Tests.stockModels) {
                XAxisGridlines(plotViewSize: CGSize(width: 300, height: 200))
                    .environmentObject($0)
                    .environment(\.chartContext, StockChartContext())
            }
            .frame(width: 300, height: 200, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
        }
        
    }
}
