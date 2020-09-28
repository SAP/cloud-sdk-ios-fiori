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
    @Environment(\.axisDataSource) var axisDataSource
    
    let isShowBaselineOnly: Bool
    let isShowLabelsOnly: Bool
    
    init(isShowBaselineOnly: Bool = false, isShowLabelsOnly: Bool = false) {
        self.isShowBaselineOnly = isShowBaselineOnly
        self.isShowLabelsOnly = isShowLabelsOnly
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let xAxisLabels: [AxisTitle] = axisDataSource.xAxisLabels(model, rect: rect)
        
        var baselineYPos: CGFloat = model.categoryAxis.baseline.width / 2
        var labelYPos: CGFloat = model.categoryAxis.baseline.width + 3 + (rect.size.height - model.categoryAxis.baseline.width - 3) / 2
        let valueType = model.valueType
        if valueType == .allNegative && (model.chartType != .bar || model.chartType != .stackedBar) {
            labelYPos = (rect.size.height - model.categoryAxis.baseline.width - 3) / 2
            baselineYPos = rect.size.height - model.categoryAxis.baseline.width / 2
        }
        
        if isShowLabelsOnly {
            labelYPos = 3 + (rect.size.height - 3) / 2
        }
        
        let axis = model.chartType == .bar || model.chartType == .stackedBar ? model.numericAxis : model.categoryAxis

        return ZStack {
            if !xAxisLabels.isEmpty && axisDataSource.isEnoughSpaceToShowXAxisLables && !axis.labels.isHidden && !isShowBaselineOnly {
                ForEach(xAxisLabels) { label in
                    // category labels
                    Text(label.title)
                        .font(.system(size: axis.labels.fontSize))
                        .foregroundColor(axis.labels.color)
                        .frame(maxWidth: rect.size.width / 2)
                        .position(x: label.pos.x, y: labelYPos)
                }
            }
            
            // base line
            if !axis.baseline.isHidden && !isShowLabelsOnly {
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
                XAxisView()
                    .environmentObject($0)
                    .environment(\.axisDataSource, axisDataSource)
            }
            .frame(width: 300, height: 20, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
            
            ForEach(Tests.stockModels) {
                XAxisView()
                    .environmentObject($0)
                    .environment(\.axisDataSource, axisStockDataSource)
            }
            .frame(width: 300, height: 20, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
        }
        
    }
}
