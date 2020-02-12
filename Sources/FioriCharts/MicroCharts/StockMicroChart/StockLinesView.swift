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
    
    var rect: CGRect
    
    var body: some View {
        //Text("hello")
        var noData = false
        let width = rect.size.width
        let height = rect.size.height
        
        var endIndex = model.displayEndIndex
        if StockUtility.isItADayModeAndNotClosed(model) {
            if model.displayStartIndex >= model.data[model.selectedSeriesIndex!].count {
                noData = true
            }
            if endIndex >= model.data[model.selectedSeriesIndex!].count {
                endIndex = model.data[model.selectedSeriesIndex!].count - 1
            }
        }
        
        var linePath = Path()
        var path = Path()
        
        if !noData {
            let stockLineWidth = calStockLinesWidth(width, realEndIndex: endIndex)
            let minVal = CGFloat(model.ranges![model.selectedSeriesIndex!].lowerBound)
            let maxVal = CGFloat(model.ranges![model.selectedSeriesIndex!].upperBound)
            
            let curDisplayData = model.data[model.selectedSeriesIndex!][model.displayStartIndex...endIndex]
            let data = curDisplayData.map { (dimensionData) -> CGFloat in
                var tmpVal: CGFloat = 0
                if let val = dimensionData.value {
                    tmpVal = CGFloat(val)
                }
                else if let vals = dimensionData.values {
                    tmpVal = CGFloat(vals.first ?? 0)
                }
                
                return height - (tmpVal - minVal) * height / (maxVal - minVal) + rect.origin.y
            }
            
//            let normalizedData = data.map {
//                height - ($0 - minVal) * height / (maxVal - minVal) + rect.origin.y
//            }
            
            let count = data.count
            let xStep = stockLineWidth / CGFloat((count - 1))
            var x: CGFloat = rect.origin.x
            
            
            linePath.move(to: CGPoint(x: x, y: data.first!))
            
            for y in data.dropFirst() {
                x += xStep
                linePath.addLine(to: CGPoint(x: x, y: y))
            }
            
            
            // move to left bottom corner
            path.move(to: CGPoint(x: rect.origin.x, y: rect.origin.y + height))
            // move to left top point
            path.addLine(to: CGPoint(x: rect.origin.x, y: data.first!))
            path.addPath(linePath)
            // move to right bottom corner
            path.addLine(to: CGPoint(x: x, y: rect.origin.y + height))
            // move to left bottom corner
            path.addLine(to: CGPoint(x: rect.origin.x, y: rect.origin.y + height))
            path.closeSubpath()
        }
        
        return ZStack {
            Color(#colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1))
            //Color.red
            
            if !noData {
                ZStack {
                    // stock color gradient
                    path.fill(LinearGradient(gradient:
                        Gradient(colors: [Color(#colorLiteral(red: 0.4957013249, green: 0.9818227649, blue: 0.6320676684, alpha: 1)), Color(#colorLiteral(red: 0.9872599244, green: 0.992430985, blue: 0.9878047109, alpha: 1))]),
                            startPoint: .top, endPoint: .bottom))
                    
                    // stock solid line
                    linePath.stroke(lineWidth: 3).foregroundColor(.green)
                    //.animation(.easeOut(duration: 1.2))
                }
            }
        }
    }
    
    func calStockLinesWidth(_ width: CGFloat, realEndIndex: Int) -> CGFloat {
        if StockUtility.isItADayModeAndNotClosed(model) {
            let tmp = CGFloat(realEndIndex - model.displayStartIndex + 1) / CGFloat(model.displayEndIndex - model.displayStartIndex + 1) * width
            
            return (tmp > width) ? width : tmp
        }
        
        return width
    }
}

struct StockLinesView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(Tests.stockModels) {
            StockLinesView(rect: CGRect(x: 0, y: 0, width: 300, height: 200)).environmentObject(StockUtility.preprocessModel($0))
        }
        .frame(width:300, height: 200)
        .previewLayout(.sizeThatFits)
    }
}
