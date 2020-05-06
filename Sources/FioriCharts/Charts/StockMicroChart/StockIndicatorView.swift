//
//  StockIndicatorView.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI

struct StockIndicatorView: View {
    @ObservedObject var model: ChartModel
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.layoutDirection) var layoutDirection
    
    public init(_ model: ChartModel) {
        self.model = model
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        var selectedCategoryRange: ClosedRange<Int> = -1 ... -1
        var priceStr: String = ""
        var closestPoint: CGPoint? = nil
        
        if let tmp = model.selectedCategoryInRange {
            selectedCategoryRange = tmp
        }
        
        let closestDataIndex = selectedCategoryRange.lowerBound
        let width = rect.size.width
        let unitWidth: CGFloat = width * model.scale / CGFloat(max(ChartUtility.numOfDataItems(model) - 1, 1))
        let startIndex = Int((CGFloat(model.startPos) / unitWidth).rounded(.up))
        let startOffset: CGFloat = (unitWidth - CGFloat(model.startPos).truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
        let x = rect.origin.x + startOffset + CGFloat(closestDataIndex - startIndex) * unitWidth
        
        if let price = ChartUtility.dimensionValue(model, categoryIndex: closestDataIndex) {
            let displayRange = ChartUtility.displayRange(model)
            let minVal = displayRange.lowerBound
            let maxVal = displayRange.upperBound
            
            let y = rect.size.height - (CGFloat(price) - minVal) * rect.size.height / max(maxVal - minVal, 1) + rect.origin.y
            
            closestPoint = CGPoint(x: x, y: y)
        
            priceStr = String(Double(price))
        }
        
        return ZStack {
            if closestDataIndex >= 0 {
                LineShape(pos1: CGPoint(x: x, y: rect.origin.y),
                          pos2: CGPoint(x: x, y: rect.origin.y + rect.size.height),
                          layoutDirection: layoutDirection)
                    .stroke(Palette.hexColor(for: .primary1).color(colorScheme), lineWidth: 1)
                
                if closestPoint != nil {
                    Text(priceStr)
                        .font(.caption)
                        .foregroundColor(Palette.hexColor(for: .primary1).color(colorScheme))
                        .position(x: x, y: rect.origin.y)
                    
                    IndicatorPoint().position(closestPoint!)
                }
            }
        }
    }
}

struct StockIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        StockIndicatorView(Tests.stockModels[1])
            .frame(width: 300, height: 200, alignment: .topLeading)
            .padding(32)
            .previewLayout(.sizeThatFits)
    }
}
