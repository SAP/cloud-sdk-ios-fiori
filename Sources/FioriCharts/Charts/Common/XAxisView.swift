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
        
        var baselineYPos: CGFloat = 0
        var labelYPos: CGFloat = rect.size.height / 2
        let valueType = model.valueType
        if valueType == .allNegative {
            labelYPos = rect.size.height / 2
            baselineYPos = rect.size.height
        }
        
        return ZStack {
            if !xAxisLabels.isEmpty && !self.model.categoryAxis.labels.isHidden {
                ForEach(xAxisLabels) { title in
                    if !self.model.categoryAxis.labels.isHidden {
                        // category labels
                        Text(title.title)
                            .font(.system(size: self.model.categoryAxis.labels.fontSize))
                            .foregroundColor(self.model.categoryAxis.labels.color.color(self.colorScheme))
                            .frame(maxWidth: rect.size.width / 2)
                            .position(x: title.pos.x, y: labelYPos)

                            //.modifier(SizeModifier())
                    }
                }
            }
            
            // base line
            if !model.categoryAxis.baseline.isHidden {
                LineShape(pos1: .zero,
                          pos2: CGPoint(x: rect.size.width, y: 0))
                    .offset(x: 0, y: baselineYPos)
                    .stroke(model.categoryAxis.baseline.color.color(self.colorScheme),
                            style: StrokeStyle(
                                lineWidth: self.model.categoryAxis.baseline.width,
                                dash: [self.model.categoryAxis.baseline.dashPatternLength, self.model.categoryAxis.baseline.dashPatternGap]))
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
