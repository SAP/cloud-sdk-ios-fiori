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
    @Environment(\.colorScheme) var colorScheme
    
    var rect: CGRect
    
    var body: some View {
        var noData = false
        var width = rect.size.width
        let height = rect.size.height
        let startPosInFloat = CGFloat(model.startPos)
        
        let unitWidth: CGFloat = width * model.scale / CGFloat(StockUtility.numOfDataItmes(model) - 1)
        let startIndex = Int(startPosInFloat / unitWidth)
        
        var endIndex = Int(((startPosInFloat + width) / unitWidth).rounded(.up))
        let startOffset: CGFloat = -startPosInFloat.truncatingRemainder(dividingBy: unitWidth)
        
        var endOffset: CGFloat = (CGFloat(endIndex) * unitWidth - startPosInFloat - width).truncatingRemainder(dividingBy: unitWidth)
    
        if endIndex > StockUtility.lastValidDimIndex(model) {
            endIndex = StockUtility.lastValidDimIndex(model)
        }

        if startIndex > endIndex {
            noData = true
        }
        if StockUtility.isIntraDay(model) {
            let count = StockUtility.lastValidDimIndex(model)
            
            width =  min(CGFloat(count) * unitWidth - startPosInFloat, rect.size.width)
            endOffset = (CGFloat(endIndex) * unitWidth - startPosInFloat - width).truncatingRemainder(dividingBy: unitWidth)
        }
        
        let range = model.ranges?[model.currentSeriesIndex] ?? 0...1
        var data: [Double] = []
        if !noData {
            let curDisplayData = model.data[model.currentSeriesIndex][startIndex...endIndex]
            data = curDisplayData.map { $0.first ?? 0 }
            
        }
        
        var isPriceGoingUp = true
        
        if let startPrice = StockUtility.dimensionValue(model, categoryIndex: 0), let endPrice = StockUtility.dimensionValue(model, categoryIndex: StockUtility.lastValidDimIndex(model)) {
            if startPrice > endPrice {
                isPriceGoingUp = false
            }
        }
        
        let strokeColor = isPriceGoingUp ? model.seriesAttributes.colors[0].color(colorScheme) : model.seriesAttributes.colors[1].color(colorScheme)
        let fillColor = isPriceGoingUp ? model.seriesAttributes.colors[2].color(colorScheme) : model.seriesAttributes.colors[3].color(colorScheme)
        
        return ZStack {        
            if !noData {
                ZStack {
                    HStack(spacing: 0) {
                        LinesShape(points: data, displayRange: range, fill: true, startOffset: startOffset, endOffset: endOffset)
                            .fill(LinearGradient(gradient:
                                Gradient(colors: [fillColor, model.seriesAttributes.colors[4].color(self.colorScheme)]),
                                                 startPoint: .top,
                                                 endPoint: .bottom))
                            .frame(width: width, height: height)
                            .clipped()
                        Spacer(minLength: 0)
                    }.frame(width: rect.size.width, height: height)
                    
                    HStack(spacing: 0) {
                        LinesShape(points: data, displayRange: range,startOffset: startOffset, endOffset: endOffset)
                            .stroke(strokeColor, lineWidth: CGFloat(model.seriesAttributes.lineWidth))
                            .frame(width: width, height: height)
                            .clipped()
                        Spacer(minLength: 0)
                    }.frame(width: rect.size.width, height: height)
                }
            }
        }
    }
}

struct StockLinesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.stockModels) {
                StockLinesView(rect: CGRect(x: 0, y: 0, width: 300, height: 200)).environmentObject($0)
            }
            .frame(width:300, height: 200)
            .previewLayout(.sizeThatFits)
        }
    }
}
