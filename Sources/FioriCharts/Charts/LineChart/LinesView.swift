//
//  LinesView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/19/20.
//

import SwiftUI

struct LinesView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
    
    /// true is for Area Chart, false is for Line Chart
    let fill: Bool
    
    init(fill: Bool = false) {
        self.fill = fill
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let allIndexs = 0 ..< model.numOfSeries()
        let width = rect.size.width
    
        // calculate CGAffineTransform for layoutDirection
        let mirror = layoutDirection == .rightToLeft ? CGAffineTransform(a: -1, b: 0, c: 0, d: 1, tx: width, ty: 0) : CGAffineTransform.identity

        let translateX: CGFloat
        let startPosition = chartContext.startPosition(model, plotViewSize: rect.size)
        let scaleX = chartContext.scaleX(model, plotViewSize: rect.size)
        let scaleY = chartContext.scaleY(model, plotViewSize: rect.size)
        
        let categoryIndexRange = chartContext.displayCategoryIndexes(model, rect: rect)
        
        // calculate CGAffineTransform for layoutDirection
        if layoutDirection == .rightToLeft {
            translateX = -(1 - 1 / scaleX - startPosition.x) * scaleX * width
        } else {
            translateX = -startPosition.x * scaleX * width
        }
        let translateY = -startPosition.y * scaleY * rect.size.height

        return ZStack {
            ForEach(allIndexs, id: \.self) { seriesIndex in
                ZStack {
                    if self.fill {
                        LineChartSeriesFillShape(path: self.model.path, seriesIndex: seriesIndex, startIndex: min(categoryIndexRange.lowerBound + 1, categoryIndexRange.upperBound), endIndex: categoryIndexRange.upperBound)
                            .transform(mirror)   // apply layoutDirection
                            .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                            .transform(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                            .fill(self.model.seriesAttributes[seriesIndex].palette.fillColor)
                            .opacity(0.4)
                            .frame(width: rect.size.width, height: rect.size.height)
                            .clipped()
                    }
                    
                    LineChartSeriesLineShape(path: self.model.path, seriesIndex: seriesIndex, startIndex: min(categoryIndexRange.lowerBound + 1, categoryIndexRange.upperBound), endIndex: categoryIndexRange.upperBound)
                        .transform(mirror)   // apply layoutDirection
                        .transform(CGAffineTransform(scaleX: scaleX, y: scaleY)) // apply zoom
                        .transform(CGAffineTransform(translationX: translateX, y: translateY)) // aplly pan
                        .stroke(self.model.seriesAttributes[seriesIndex].palette.colors[0],
                                lineWidth: self.model.seriesAttributes[seriesIndex].lineWidth)
                        .frame(width: rect.size.width, height: rect.size.height)
                        .clipped()
                    
                    if !self.model.seriesAttributes[seriesIndex].point.isHidden {
                        PointsShape(model: self.model,
                                    chartContext: self.chartContext,
                                    seriesIndex: seriesIndex,
                                    categoryIndexRange: categoryIndexRange,
                                    layoutDirection: self.layoutDirection)
                            .fill(self.model.seriesAttributes[seriesIndex].point.strokeColor)
                            .frame(width: rect.size.width, height: rect.size.height)
                            .clipShape(Rectangle()
                                        .size(width: width + self.pointRadius(at: seriesIndex) * 2 + 5,
                                              height: rect.size.height + self.pointRadius(at: seriesIndex) * 2 + 5)
                                        .offset(x: -1 * self.pointRadius(at: seriesIndex),
                                                y: -1 * self.pointRadius(at: seriesIndex)))
                    }
                }
            }
        }
    }
    
    func pointRadius(at index: Int) -> CGFloat {
        let pointAttr = model.seriesAttributes[index].point
        
        return CGFloat(pointAttr.diameter/2)
    }
}

struct LinesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.lineModels) {
                LinesView()
                    .environmentObject($0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
                
                LinesView()
                    .environmentObject($0)
                    .environment(\.layoutDirection, .rightToLeft)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
