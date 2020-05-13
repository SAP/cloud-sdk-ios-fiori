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
    let secondary: Bool
    
    init(axisDataSource: AxisDataSource? = nil, secondary: Bool = false) {
        self.axisDataSource = axisDataSource
        self.secondary = secondary
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        var yAxisLabels: [AxisTitle] = []
        if let res = axisDataSource?.yAxisLabels(model, rect: rect, layoutDirection: layoutDirection, secondary: secondary) {
            yAxisLabels = res
        }

        let axis = secondary ? model.secondaryNumericAxis : model.numericAxis
        let baselineX: CGFloat
        if secondary {
            if layoutDirection == .leftToRight {
                baselineX = axis.baseline.width / 2
            } else {
                baselineX = -axis.baseline.width / 2
            }
        } else {
            if layoutDirection == .leftToRight {
                baselineX = rect.size.width + axis.baseline.width / 2
            } else {
                baselineX = rect.size.width - axis.baseline.width / 2
            }
        }
        
        return ZStack {
            if !axis.labels.isHidden {
                ForEach(yAxisLabels) { label in
                    // y axis lables
                    Text(label.title)
                        .fixedSize()
                        .font(.system(size: axis.labels.fontSize))
                        .foregroundColor(axis.labels.color.color(self.colorScheme))
                        .position(x: label.pos.x,
                                  y: label.pos.y)
                }
            }
            
            if !axis.baseline.isHidden {
                // left base line
                LineShape(pos1: CGPoint(x: 0, y: 0),
                          pos2: CGPoint(x: 0, y: rect.size.height + model.categoryAxis.baseline.width))
                    .stroke(axis.baseline.color.color(self.colorScheme),
                            style: StrokeStyle(lineWidth: axis.baseline.width,
                                               dash: [axis.baseline.dashPatternLength, axis.baseline.dashPatternGap]))
                    .frame(width: axis.baseline.width, height: rect.size.height)
                    .position(x: baselineX, y: rect.size.height / 2)
            }
        }
    }
}

struct YAxisView_Previews: PreviewProvider {
    static var previews: some View {
        let axisDataSource = DefaultAxisDataSource()
        
        return Group {
            ForEach(Tests.lineModels) {
                YAxisView(axisDataSource: axisDataSource)
                    .environmentObject($0)
            }
            .frame(width: 80, height: 200, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
            
            ForEach(Tests.lineModels) {
                YAxisView(axisDataSource: axisDataSource, secondary: true)
                    .environmentObject($0)
            }
            .frame(width: 80, height: 200, alignment: .topLeading)
            .previewLayout(.sizeThatFits)
            
        }
//        return YAxisView(axisDataSource: axisDataSource)
//            .environmentObject(Tests.stockModels[1])
//            .frame(width: 80, height: 200, alignment: .topLeading)
//            .padding()
//            .previewLayout(.sizeThatFits)
        
    }
}
