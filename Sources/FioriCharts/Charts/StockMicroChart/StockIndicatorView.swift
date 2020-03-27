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
            self.content(in: proxy.frame(in: .local))
        }
    }
    
    func content(in rect: CGRect) -> some View {
        var selectedCategoryRange: ClosedRange<Int> = -1 ... -1
        var priceStr: String = ""
//        var dateStr: String = ""
        var closestPoint: CGPoint = .zero
        
        if let tmp = model.selectedCategoryInRange {
            selectedCategoryRange = tmp
        }
        
        let closestDataIndex = selectedCategoryRange.lowerBound
        
//        if let date = ChartUtility.categoryValueInDate(model, categoryIndex: closestDataIndex),
        if let price = ChartUtility.dimensionValue(model, categoryIndex: closestDataIndex) {
            let width = rect.size.width
            let unitWidth: CGFloat = width * model.scale / CGFloat(ChartUtility.numOfDataItmes(model) - 1)
            let startIndex = Int((CGFloat(model.startPos) / unitWidth).rounded(.up))
            let startOffset: CGFloat = (unitWidth - CGFloat(model.startPos).truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
            let displayRange = ChartUtility.displayRange(model)
            let minVal = displayRange.lowerBound
            let maxVal = displayRange.upperBound
            
            let x = rect.origin.x + startOffset + CGFloat(closestDataIndex - startIndex) * unitWidth
            let y = rect.size.height - (CGFloat(price) - minVal) * rect.size.height / (maxVal - minVal) + rect.origin.y
            
            closestPoint = CGPoint(x: x, y: y)
            
//            let hour = Calendar.current.component(.hour, from: date)
//            let df = DateFormatter()
//            df.dateStyle = .medium
//            if hour == 0 {
//                df.timeStyle = .none
//            }
//            else {
//                df.timeStyle = .medium
//            }
//
//            dateStr = df.string(from: date)
            priceStr = String(price)
        }
        
        return ZStack {
            if closestDataIndex >= 0 {
                LineShape(pos1: CGPoint(x: closestPoint.x, y: rect.origin.y),
                          pos2: CGPoint(x: closestPoint.x, y: rect.origin.y + rect.size.height),
                          layoutDirection: layoutDirection)
                    .stroke(Palette.hexColor(for: .primary1).color(colorScheme), lineWidth: 1)
                
                Text(priceStr)
                    .font(.caption)
//                    .padding(.horizontal, 8)
//                    .padding(.vertical, 4)
//                    .background(Color.gray)
//                    .cornerRadius(4)
                    .foregroundColor(Palette.hexColor(for: .primary1).color(colorScheme))
//                    .shadow(color: .gray, radius: 6, x: 0, y: 6)
                    .position(x: closestPoint.x, y: rect.origin.y)
                
                /*Text(dateStr)
                    .font(.caption)
//                    .padding(.horizontal, 8)
//                    .padding(.vertical, 4)
//                    .background(Color.gray)
//                    .cornerRadius(4)
                    .foregroundColor(Palette.hexColor(for: .primary1).color(colorScheme))
//                    .shadow(color: .gray, radius: 6, x: 0, y: 6)
                    .position(x: closestPoint.x, y: rect.origin.y + rect.size.height)
                */
                IndicatorPoint().position(closestPoint)
            }
        }
    }
}

struct StockIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        StockIndicatorView(Tests.stockModels[1])
            .frame(width:300, height: 200, alignment: .topLeading)
            .padding(32)
            .previewLayout(.sizeThatFits)
    }
}
