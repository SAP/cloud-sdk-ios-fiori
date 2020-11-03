//
//  StockLinesView.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct StockLinesView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    //swiftlint:disable function_body_length
    func makeBody(in rect: CGRect) -> some View {
        let displayRange = ChartUtility.displayRange(model)
        var noData = false
        var width = rect.size.width
        let height = rect.size.height
        let startPosX = model.startPos.x * model.scale * rect.size.width
        let unitWidth: CGFloat = max(width * model.scale / CGFloat(max(ChartUtility.numOfDataItems(model) - 1, 1)), ChartViewLayout.minUnitWidth)
        let startIndex = Int(startPosX / unitWidth)
        
        var endIndex = Int(((startPosX + width) / unitWidth).rounded(.up))
        let startOffset: CGFloat = -startPosX.truncatingRemainder(dividingBy: unitWidth)
        
        if endIndex > ChartUtility.lastValidDimIndex(model) {
            endIndex = ChartUtility.lastValidDimIndex(model)
        }
        var endOffset: CGFloat = (CGFloat(endIndex) * unitWidth - startPosX - width).truncatingRemainder(dividingBy: unitWidth)
    
        if startIndex > endIndex {
            noData = true
            width = 0
        }
        if ChartUtility.isIntraDay(model) && !noData {
            let count = ChartUtility.lastValidDimIndex(model)
            
            width =  min(CGFloat(count) * unitWidth - startPosX, rect.size.width)
            if width < 0 {
                width = 0
                noData = true
            }
            
            endOffset = (CGFloat(endIndex) * unitWidth - startPosX - width).truncatingRemainder(dividingBy: unitWidth)
        }
        
        let seriesIndex = model.currentSeriesIndex
        
        var isPriceGoingUp = true
        if let startPrice = ChartUtility.dimensionValue(model, categoryIndex: 0), let endPrice = ChartUtility.dimensionValue(model, categoryIndex: ChartUtility.lastValidDimIndex(model)) {
            if startPrice > endPrice {
                isPriceGoingUp = false
            }
        }
        
        let strokeColor = isPriceGoingUp ? model.seriesAttributes[seriesIndex].palette.colors[0] : model.seriesAttributes[seriesIndex].palette.colors[1]
        let fillColor = strokeColor.opacity(0.4)
        let gradientColor = strokeColor.opacity(0.0)
        
        return ZStack {
            if !noData {
                HStack(spacing: 0) {
                    LinesShape(model: model,
                               seriesIndex: seriesIndex,
                               categoryIndexRange: startIndex ... endIndex,
                               displayRange: displayRange,
                               layoutDirection: self.layoutDirection,
                               fill: true,
                               startOffset: startOffset,
                               endOffset: endOffset)
                        .fill(LinearGradient(gradient:
                                                Gradient(colors: [fillColor, gradientColor]),
                                             startPoint: .top,
                                             endPoint: .bottom))
                        .frame(width: width, height: height)
                        .clipped()
                    
                    Spacer(minLength: 0)
                }.frame(width: rect.size.width, height: height)
                
                HStack(spacing: 0) {
                    LinesShape(model: model,
                               seriesIndex: seriesIndex,
                               categoryIndexRange: startIndex ... endIndex,
                               displayRange: displayRange,
                               layoutDirection: self.layoutDirection,
                               startOffset: startOffset,
                               endOffset: endOffset)
                        .stroke(strokeColor, lineWidth: model.seriesAttributes[seriesIndex].lineWidth)
                        .frame(width: width, height: height)
                        .clipped()
                    
                    Spacer(minLength: 0)
                }.frame(width: rect.size.width, height: height)
                
                HStack(spacing: 0) {
                    PointsShape(model: model,
                                seriesIndex: seriesIndex,
                                categoryIndexRange: startIndex ... endIndex,
                                displayRange: displayRange,
                                layoutDirection: self.layoutDirection,
                                radius: self.pointRadius(at: seriesIndex),
                                gap: self.model.seriesAttributes[seriesIndex].point.gap,
                                startOffset: startOffset,
                                endOffset: endOffset)
                        .fill(strokeColor)
                        .frame(width: width, height: height)
                        .clipShape(Rectangle()
                                    .size(width: width + self.pointRadius(at: seriesIndex) * 2 + 5, height: rect.size.height + self.pointRadius(at: seriesIndex) * 2 + 5)
                                    .offset(x: -1 * self.pointRadius(at: seriesIndex), y: -1 * self.pointRadius(at: seriesIndex)))
                    
                    Spacer(minLength: 0)
                }.frame(width: rect.size.width, height: height)
            }
        }
    }
    
    func pointRadius(at index: Int) -> CGFloat {
        let pointAttr = model.seriesAttributes[index].point
        
        return pointAttr.isHidden ? 0 : CGFloat(pointAttr.diameter/2)
    }
}

struct StockLinesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.stockModels) {
                StockLinesView()
                    .environmentObject($0)
            }
            .frame(width: 300, height: 200)
            .previewLayout(.sizeThatFits)
        }
    }
}
