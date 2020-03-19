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
    
    @Environment(\.colorScheme) var colorScheme
    
    var rect: CGRect
    
    init(rect: CGRect, axisDataSource: AxisDataSource? = nil) {
        self.rect = rect
        self.axisDataSource = axisDataSource
    }
    
    var body: some View {
        var xAxisTitles: [AxisTitle] = []
        if let res = axisDataSource?.xAxisTitles(model, rect: rect) {
            xAxisTitles = res
        }

        return ZStack {
            if xAxisTitles.count > 0 && (!self.model.categoryAxis.gridlines.isHidden || !self.model.categoryAxis.labels.isHidden) {
                ForEach(xAxisTitles) { title in
                    // grid lines
                    if !self.model.categoryAxis.gridlines.isHidden {
                        LineShape(pos1: CGPoint(x: title.pos,
                                                y: 0),
                                  pos2: CGPoint(x: title.pos,
                                                y: self.rect.origin.y))
                            .stroke(self.model.categoryAxis.gridlines.color.color(self.colorScheme),
                                    style: StrokeStyle(lineWidth: CGFloat(self.model.categoryAxis.gridlines.width),
                                                       dash: [CGFloat(self.model.categoryAxis.gridlines.dashPatternLength), CGFloat(self.model.categoryAxis.gridlines.dashPatternGap)]))
                    }
                    
                    if !self.model.categoryAxis.labels.isHidden {
                        // category labels
                        Text(title.title)
                            .font(.system(size: CGFloat(self.model.categoryAxis.labels.fontSize)))
                            .foregroundColor(self.model.categoryAxis.labels.color.color(self.colorScheme))
                            .position(x: title.pos,
                                      y: self.rect.origin.y + self.rect.size.height / 2)
                    }
                }
            }
            
            // bottom solid line
            if !model.categoryAxis.baseline.isHidden {
                LineShape(pos1: CGPoint(x: rect.origin.x + rect.size.width, y: rect.origin.y),
                          pos2: CGPoint(x: rect.origin.x, y: rect.origin.y))
                    .stroke(model.categoryAxis.baseline.color.color(self.colorScheme),
                            style: StrokeStyle(
                                lineWidth: CGFloat(self.model.categoryAxis.baseline.width),
                                dash: [CGFloat(self.model.categoryAxis.baseline.dashPatternLength), CGFloat(self.model.categoryAxis.baseline.dashPatternGap)]))
            }
        }
    }
}

struct XAxisView_Previews: PreviewProvider {
    static var previews: some View {
        let axisDataSource = StockAxisDataSource()
        
        return Group {
            ForEach(Tests.stockModels) {
                XAxisView(rect: CGRect(x: 0, y: 180, width: 300, height: 20),
                          axisDataSource: axisDataSource).environmentObject($0)
            }
            .frame(width:300, height: 200, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
        }
        
    }
}
