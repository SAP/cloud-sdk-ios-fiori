//
//  YAxisGridlines.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/23/20.
//

import SwiftUI

struct YAxisGridlines: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.layoutDirection) var layoutDirection
    
    weak var axisDataSource: AxisDataSource? = nil
    var displayRange: ClosedRange<CGFloat>
    
    init(displayRange: ClosedRange<CGFloat>, axisDataSource: AxisDataSource? = nil) {
        self.displayRange = displayRange
        self.axisDataSource = axisDataSource
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let allIndexs = IndexSet(integersIn: 0 ..< model.data.count)
        let indexes =  model.indexesOfSecondaryValueAxis.symmetricDifference(allIndexs).sorted()
        let secondary: Bool = indexes.isEmpty ? true : false
        
        var yAxisLabels: [AxisTitle] = []
        if let res = axisDataSource?.yAxisLabels(model, rect: rect, layoutDirection: layoutDirection, secondary: secondary) {
            yAxisLabels = res
        }
        
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
        return ZStack {
            if !model.numericAxis.gridlines.isHidden {
                ForEach(yAxisLabels) { label in
                    if !self.model.numericAxis.gridlines.isHidden {
                        // grid lines
                        LineShape(pos1: CGPoint(x: 0, y: label.pos.y),
                                  pos2: CGPoint(x: rect.size.width, y: label.pos.y))
                            .stroke(self.model.numericAxis.gridlines.color.color(self.colorScheme),
                                    style: StrokeStyle(lineWidth: self.model.numericAxis.gridlines.width,
                                                       dash: [self.model.numericAxis.gridlines.dashPatternLength, self.model.numericAxis.gridlines.dashPatternGap]))
                    }
                }
            }
        }
    }
}

struct YAxisGridlines_Previews: PreviewProvider {
    static var previews: some View {
        let axisDataSource = DefaultAxisDataSource()
        
        return YAxisGridlines(displayRange: 0...2000, axisDataSource: axisDataSource)
            .environmentObject(Tests.stockModels[1])
            .frame(width: 80, height: 200, alignment: .topLeading)
            .padding()
            .previewLayout(.sizeThatFits)
        
    }
}
