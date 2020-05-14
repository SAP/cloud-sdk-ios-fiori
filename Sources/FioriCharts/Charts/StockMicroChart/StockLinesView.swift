//
//  StockLinesView.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct StockLinesView: View {
    @ObservedObject var model: ChartModel
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.layoutDirection) var layoutDirection
    
    public init(_ chartModel: ChartModel) {
        self.model = chartModel
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let displayRange = ChartUtility.displayRange(model)
        var noData = false
        var width = rect.size.width
        let height = rect.size.height
        let startPosInFloat = CGFloat(model.startPos)
        
        let unitWidth: CGFloat = width * model.scale / CGFloat(max(ChartUtility.numOfDataItems(model) - 1, 1))
        let startIndex = Int(startPosInFloat / unitWidth)
        
        var endIndex = Int(((startPosInFloat + width) / unitWidth).rounded(.up))
        let startOffset: CGFloat = -startPosInFloat.truncatingRemainder(dividingBy: unitWidth)
        
        var endOffset: CGFloat = (CGFloat(endIndex) * unitWidth - startPosInFloat - width).truncatingRemainder(dividingBy: unitWidth)
    
        if endIndex > ChartUtility.lastValidDimIndex(model) {
            endIndex = ChartUtility.lastValidDimIndex(model)
        }

        if startIndex > endIndex {
            noData = true
        }
        if ChartUtility.isIntraDay(model) {
            let count = ChartUtility.lastValidDimIndex(model)
            
            width =  min(CGFloat(count) * unitWidth - startPosInFloat, rect.size.width)
            endOffset = (CGFloat(endIndex) * unitWidth - startPosInFloat - width).truncatingRemainder(dividingBy: unitWidth)
        }
        
        let seriesIndex = model.currentSeriesIndex
        var data: [CGFloat?] = []
        if !noData {
            let curDisplayData = model.data[seriesIndex][startIndex...endIndex]
            data = curDisplayData.map { $0.first ?? 0 }
            
        }
        
        var isPriceGoingUp = true
        
        if let startPrice = ChartUtility.dimensionValue(model, categoryIndex: 0), let endPrice = ChartUtility.dimensionValue(model, categoryIndex: ChartUtility.lastValidDimIndex(model)) {
            if startPrice > endPrice {
                isPriceGoingUp = false
            }
        }
        
        let rgba = isPriceGoingUp ? model.seriesAttributes[seriesIndex].palette.colors[0].rgba(colorScheme) : model.seriesAttributes[seriesIndex].palette.colors[1].rgba(colorScheme)
        let strokeColor = Color(.sRGB, red: rgba.r, green: rgba.g, blue: rgba.b, opacity: rgba.a)
        let fillColor = Color(.sRGB, red: rgba.r, green: rgba.g, blue: rgba.b, opacity: rgba.a * 0.4)
        
        return ZStack {
            //model.backgroundColor.color(colorScheme)
            if !noData {
                ZStack {
                    HStack(spacing: 0) {
                        LinesShape(points: data,
                                   displayRange: displayRange,
                                   layoutDirection: self.layoutDirection,
                                   fill: true,
                                   startOffset: startOffset,
                                   endOffset: endOffset)
                            .fill(LinearGradient(gradient:
                                Gradient(colors: [fillColor, model.seriesAttributes[seriesIndex].palette.colors[4].color(self.colorScheme)]),
                                                 startPoint: .top,
                                                 endPoint: .bottom))
                            .frame(width: width, height: height)
                            .clipped()
                        Spacer(minLength: 0)
                    }.frame(width: rect.size.width, height: height)
                    
                    HStack(spacing: 0) {
                        LinesShape(points: data,
                                   displayRange: displayRange,
                                   layoutDirection: self.layoutDirection,
                                   startOffset: startOffset,
                                   endOffset: endOffset)
                            .stroke(strokeColor, lineWidth: model.seriesAttributes[seriesIndex].lineWidth)
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
                StockLinesView($0)
            }
            .frame(width: 300, height: 200)
            .previewLayout(.sizeThatFits)
        }
    }
}
