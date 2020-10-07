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
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        var xAxisLabels: [AxisTitle] = chartContext.xAxisGridlines(model, rect: rect)
        
        if let first = xAxisLabels.first, abs(first.pos.x) < 0.001 {
            xAxisLabels.removeFirst()
        }
        
        let axis = model.chartType == .bar || model.chartType == .stackedBar ? model.numericAxis : model.categoryAxis
        let valueType = model.valueType
        let ticks = model.numericAxisTickValues
        let zeroX: CGFloat = rect.size.width * ticks.plotBaselinePosition
        
        return ZStack {
            if !xAxisLabels.isEmpty && !axis.gridlines.isHidden {
                ForEach(xAxisLabels) { title in
                    // grid lines
                    if !axis.gridlines.isHidden {
                        LineShape(pos1: .zero,
                                  pos2: CGPoint(x: 0, y: rect.size.height),
                                  layoutDirection: self.layoutDirection)
                            .stroke(axis.gridlines.color,
                                    style: StrokeStyle(lineWidth: axis.gridlines.width,
                                                       dash: [axis.gridlines.dashPatternLength, axis.gridlines.dashPatternGap]))
                            .offset(x: title.pos.x)
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
        }
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
        let chartContext = StockChartContext()
        
        return Group {
            ForEach(Tests.stockModels) {
                XAxisGridlines()
                    .environmentObject($0)
                    .environment(\.chartContext, chartContext)
            }
            .frame(width: 300, height: 200, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
        }
        
    }
}
