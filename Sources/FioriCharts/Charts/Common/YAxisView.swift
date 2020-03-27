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
    @Environment(\.layoutDirection) var layoutDirection
    
    weak var axisDataSource: AxisDataSource? = nil
    var displayRange: ClosedRange<CGFloat>
    
    init(displayRange: ClosedRange<CGFloat>, axisDataSource: AxisDataSource? = nil) {
        self.displayRange = displayRange
        self.axisDataSource = axisDataSource
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.view(in: proxy.frame(in: .local))
        }
    }
    
    func view(in rect: CGRect) -> some View {
        var yAxisLabels: [AxisTitle] = []
        if let res = axisDataSource?.yAxisLabels(model, rect: rect, displayRange: displayRange) {
            yAxisLabels = res
        }

        let baselineX = layoutDirection == .leftToRight ? (rect.size.width) : (rect.size.width - CGFloat(model.numericAxis.baseline.width))
        
        return ZStack {
            if !model.numericAxis.labels.isHidden {
                ForEach(yAxisLabels) { label in
                    // y axis lables
                    Text(label.title)
                        .fixedSize()
                        .font(.system(size: CGFloat(self.model.numericAxis.labels.fontSize)))
                        .foregroundColor(self.model.numericAxis.labels.color.color(self.colorScheme))
                        .position(x: rect.size.width / 2,
                                  y: label.pos)
                }
            }
            
            if !model.numericAxis.baseline.isHidden {
                // left base line
                LineShape(pos1: CGPoint(x: 0, y: 0),
                          pos2: CGPoint(x: 0, y: rect.size.height))
                    .stroke(model.numericAxis.baseline.color.color(self.colorScheme),
                            style: StrokeStyle(lineWidth: CGFloat(model.numericAxis.baseline.width),
                                               dash: [CGFloat(self.model.numericAxis.baseline.dashPatternLength), CGFloat(self.model.numericAxis.baseline.dashPatternGap)]))
                    .frame(width: CGFloat(model.numericAxis.baseline.width), height: rect.size.height)
                    .position(x: baselineX, y: rect.size.height / 2)
            }
        }
    }
}

struct YAxisView_Previews: PreviewProvider {
    static var previews: some View {
        let axisDataSource = DefaultAxisDataSource()
        
        return YAxisView(displayRange: 0...2000, axisDataSource: axisDataSource)
            .environmentObject(Tests.stockModels[1])
            .frame(width:80, height: 200, alignment: .topLeading)
            .padding()
            .previewLayout(.sizeThatFits)
        
    }
}
