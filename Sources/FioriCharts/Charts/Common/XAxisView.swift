//
//  XAxisView.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct XAxisView: View {
    @EnvironmentObject var model: ChartModel
    weak var axisDataSource: AxisDataSource? = nil
    
    @State private var xAxisSize: CGSize = CGSize(width: 0, height: 24)
    
    init(axisDataSource: AxisDataSource? = nil) {
        self.axisDataSource = axisDataSource
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        var xAxisLabels: [AxisTitle] = []
        if let res = axisDataSource?.xAxisLabels(model, rect: rect) {
            xAxisLabels = res
        }
        
        var baselineYPos: CGFloat = model.categoryAxis.baseline.width / 2
        var labelYPos: CGFloat = model.categoryAxis.baseline.width + 3 + (rect.size.height - model.categoryAxis.baseline.width - 3) / 2
        let valueType = model.valueType
        if valueType == .allNegative && (model.chartType != .bar || model.chartType != .stackedBar) {
            labelYPos = (rect.size.height - model.categoryAxis.baseline.width - 3) / 2
            baselineYPos = rect.size.height - model.categoryAxis.baseline.width / 2
        }
        
        let axis = model.chartType == .bar || model.chartType == .stackedBar ? model.numericAxis : model.categoryAxis
        
        return ZStack {
            if !xAxisLabels.isEmpty && (axisDataSource?.isEnoughSpaceToShowXAxisLables ?? true) && !axis.labels.isHidden {
                ForEach(xAxisLabels) { title in
                    if !axis.labels.isHidden {
                        // category labels
                        Text(title.title)
                            .font(.system(size: axis.labels.fontSize))
                            .foregroundColor(axis.labels.color)
                            .frame(maxWidth: rect.size.width / 2)
                            .position(x: title.pos.x, y: labelYPos)
                    }
                }
            }
            
            // base line
            if !axis.baseline.isHidden {
                LineShape(pos1: .zero,
                          pos2: CGPoint(x: rect.size.width, y: 0))
                    .offset(x: 0, y: baselineYPos)
                    .stroke(axis.baseline.color,
                            style: StrokeStyle(
                                lineWidth: axis.baseline.width,
                                dash: [axis.baseline.dashPatternLength, axis.baseline.dashPatternGap]))
            }
        }
    }
}

struct XAxisView_Previews: PreviewProvider {
    static var previews: some View {
        let axisStockDataSource = StockAxisDataSource()
        let axisDataSource = DefaultAxisDataSource()
        
        return Group {
            ForEach(Tests.lineModels) {
                XAxisView(axisDataSource: axisDataSource).environmentObject($0)
            }
            .frame(width: 300, height: 20, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
            
            ForEach(Tests.stockModels) {
                XAxisView(axisDataSource: axisStockDataSource).environmentObject($0)
            }
            .frame(width: 300, height: 20, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
        }
        
    }
}
