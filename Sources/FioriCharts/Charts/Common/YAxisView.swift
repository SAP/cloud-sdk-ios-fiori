//
//  YAxisView.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct YAxisView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.colorScheme) var colorScheme
    weak var axisDataSource: AxisDataSource? = nil
    
    var rect: CGRect
    var chartWidth: CGFloat
    
    init(rect: CGRect, chartWidth: CGFloat, axisDataSource: AxisDataSource? = nil) {
        self.rect = rect
        self.chartWidth = chartWidth
        self.axisDataSource = axisDataSource
    }
    
    var body: some View {
        let minVal = CGFloat(model.ranges?[model.currentSeriesIndex].lowerBound ?? 0)
        let yAxisLabelsCount = max(1, model.numberOfGridlines)
        
        var yAxisLabels: [AxisTitle] = []
        if let res = axisDataSource?.yAxisTitles(model, rect: rect) {
            yAxisLabels = res
        }
        let startValTitle = axisDataSource?.axisView(model, formattedStringForValue: Double(minVal)) ?? ""
        
        let x = rect.origin.x + rect.size.width
        let stepHeight = self.rect.size.height / CGFloat(yAxisLabelsCount)
        
        return ZStack {
            if !model.numericAxis.labels.isHidden || !model.numericAxis.gridlines.isHidden {
                ForEach(yAxisLabels) { label in
                    if !self.model.numericAxis.labels.isHidden {
                        // y axis lables
                        Text(label.title)
                            .font(.system(size: CGFloat(self.model.numericAxis.labels.fontSize)))
                            .foregroundColor(self.model.numericAxis.labels.color.color(self.colorScheme))
                            .position(x: self.rect.origin.x + self.rect.size.width / 2,
                                      y: self.rect.origin.y + CGFloat(label.index) * stepHeight)
                    }
                    
                    if !self.model.numericAxis.gridlines.isHidden {
                        // grid lines
                        LineShape(pos1: CGPoint(x: x, y: self.rect.origin.y + CGFloat(label.index) * stepHeight),
                                  pos2: CGPoint(x: x + self.chartWidth, y: self.rect.origin.y + CGFloat(label.index) * stepHeight))
                            .stroke(self.model.numericAxis.gridlines.color.color(self.colorScheme),
                                    style: StrokeStyle(lineWidth: CGFloat(self.model.numericAxis.gridlines.width),
                                                       dash: [CGFloat(self.model.numericAxis.gridlines.dashPatternLength), CGFloat(self.model.numericAxis.gridlines.dashPatternGap)]))
                    }
                }
            }
            
            // start value label
            if !self.model.numericAxis.labels.isHidden {
                Text(startValTitle)
                    .font(.system(size: CGFloat(self.model.numericAxis.labels.fontSize)))
                    .foregroundColor(self.model.numericAxis.labels.color.color(self.colorScheme))
                    .position(x: self.rect.origin.x + self.rect.size.width / 2,
                              y: self.rect.origin.y + self.rect.size.height)
            }
            
            if !model.numericAxis.baseline.isHidden {
                // left base line
                LineShape(pos1: CGPoint(x: x, y: rect.size.height),
                          pos2: CGPoint(x: x, y: rect.origin.y))
                    .stroke(model.numericAxis.baseline.color.color(self.colorScheme),
                            style: StrokeStyle(lineWidth: CGFloat(model.numericAxis.baseline.width),
                                               dash: [CGFloat(self.model.numericAxis.baseline.dashPatternLength), CGFloat(self.model.numericAxis.baseline.dashPatternGap)]))
            }
        }
    }
    
    func formatYAxisTitle(value: CGFloat, total: Int) -> String {
        let minVal = model.ranges?[model.currentSeriesIndex].lowerBound ?? 0
        let maxVal = model.ranges?[model.currentSeriesIndex].upperBound ?? 0
        let range = CGFloat(maxVal - minVal) / CGFloat(total)
        
        let dataPrecision = (range >= 1) ? "%.0f" : (minVal >= 0.1 ? "%.1f" : "%.2f")
        
        return String(format: dataPrecision, value)
    }
}

struct YAxisView_Previews: PreviewProvider {
    static var previews: some View {
        let axisDataSource = DefaultAxisDataSource()
        
        return YAxisView(rect: CGRect(x: 0, y: 0, width: 40, height: 400),
                         chartWidth: 160, axisDataSource: axisDataSource)
            .environmentObject(Tests.stockModels[1])
            .frame(width:300, height: 400, alignment: .topLeading)
            .padding()
            .previewLayout(.sizeThatFits)
        
    }
}
