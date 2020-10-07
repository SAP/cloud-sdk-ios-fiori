//
//  YAxisGridlines.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/23/20.
//

import SwiftUI

struct YAxisGridlines: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let allIndexs = IndexSet(integersIn: 0 ..< model.data.count)
        let indexes =  model.indexesOfSecondaryValueAxis.symmetricDifference(allIndexs).sorted()
        let secondary: Bool = indexes.isEmpty ? true : false
        
        var yAxisLabels: [AxisTitle] = chartContext.yAxisLabels(model, rect: rect, layoutDirection: layoutDirection, secondary: secondary)
        
        if model.chartType != .bar || model.chartType != .stackedBar {
            let displayRange = ChartUtility.displayRange(model, secondary: secondary)
            var valueToRemove: CGFloat = displayRange.lowerBound
            let valueType = model.valueType
            if valueType == .allNegative {
                valueToRemove = displayRange.upperBound
            } else if valueType == .mixed {
                valueToRemove = 0
            }
            
            var indexToRemove = -1
            for (i, label) in yAxisLabels.enumerated() {
                if abs(valueToRemove.distance(to: label.value)) < 0.001 {
                    indexToRemove = i
                    break
                }
            }
            if indexToRemove >= 0 {
                yAxisLabels.remove(at: indexToRemove)
            }
        }
        
        let axis = model.chartType == .bar || model.chartType == .stackedBar ? model.categoryAxis : model.numericAxis
        
        return ZStack {
            if !axis.gridlines.isHidden {
                ForEach(yAxisLabels) { label in
                    if !axis.gridlines.isHidden {
                        // grid lines
                        LineShape(pos1: CGPoint(x: 0, y: label.pos.y),
                                  pos2: CGPoint(x: rect.size.width, y: label.pos.y))
                            .stroke(axis.gridlines.color,
                                    style: StrokeStyle(lineWidth: axis.gridlines.width,
                                                       dash: [axis.gridlines.dashPatternLength, axis.gridlines.dashPatternGap]))
                    }
                }
            }
        }
    }
}

struct YAxisGridlines_Previews: PreviewProvider {
    static var previews: some View {
        let chartContext = DefaultChartContext()
        
        return YAxisGridlines()
            .environmentObject(Tests.stockModels[1])
            .environment(\.chartContext, chartContext)
            .frame(width: 80, height: 200, alignment: .topLeading)
            .padding()
            .previewLayout(.sizeThatFits)
        
    }
}
