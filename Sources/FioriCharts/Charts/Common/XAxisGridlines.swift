//
//  XAxisGridlines.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/23/20.
//

import SwiftUI

struct XAxisGridlines: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.axisDataSource) var axisDataSource
    @Environment(\.layoutDirection) var layoutDirection

    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        var xAxisLabels: [AxisTitle] = axisDataSource.xAxisGridlines(model, rect: rect)
        
        if let first = xAxisLabels.first, abs(first.pos.x) < 0.001 {
            xAxisLabels.removeFirst()
        }
        
        return ZStack {
            if !xAxisLabels.isEmpty && !self.model.categoryAxis.gridlines.isHidden {
                ForEach(xAxisLabels) { title in
                    // grid lines
                    if !self.model.categoryAxis.gridlines.isHidden {
                        LineShape(pos1: .zero,
                                  pos2: CGPoint(x: 0, y: rect.size.height),
                                  layoutDirection: self.layoutDirection)
                            .stroke(self.model.categoryAxis.gridlines.color,
                                    style: StrokeStyle(lineWidth: self.model.categoryAxis.gridlines.width,
                                                       dash: [self.model.categoryAxis.gridlines.dashPatternLength, self.model.categoryAxis.gridlines.dashPatternGap]))
                            .offset(x: title.pos.x)
                    }
                }
            }
        }
    }
}

struct XAxisGridlines_Previews: PreviewProvider {
    static var previews: some View {
        let axisDataSource = StockAxisDataSource()
        
        return Group {
            ForEach(Tests.stockModels) {
                XAxisGridlines()
                    .environmentObject($0)
                    .environment(\.axisDataSource, axisDataSource)
            }
            .frame(width: 300, height: 200, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
        }
        
    }
}
