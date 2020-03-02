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
        var noData = false
        var width = rect.size.width
        let height = rect.size.height
        
        var endIndex = model.displayEndIndex
        if StockUtility.isIntraDay(model) {
            if endIndex >= StockUtility.lastValidDimIndex(model) {
                endIndex = StockUtility.lastValidDimIndex(model)
            }
            
            if model.displayStartIndex > endIndex {
                noData = true
            }
        }
        
        let range = model.ranges?[model.currentSeriesIndex] ?? 0...1
        var data: [Double] = []
        if !noData {
            width = width * CGFloat(endIndex - model.displayStartIndex) / CGFloat(model.displayEndIndex - model.displayStartIndex)
            
            let curDisplayData = model.data[model.currentSeriesIndex][model.displayStartIndex...endIndex]
            data = curDisplayData.map { $0.first ?? 0 }
            
        }
        
        return ZStack {
            Color(#colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)).frame(width: rect.size.width, height: height)
            
            if !noData {
                ZStack {
                    HStack(spacing: 0) {
                        LinesShape(points: data, displayRange: range, fill: true)
                            .fill(LinearGradient(gradient:
                                Gradient(colors: [Color(#colorLiteral(red: 0.4957013249, green: 0.9818227649, blue: 0.6320676684, alpha: 1)), Color(#colorLiteral(red: 0.9872599244, green: 0.992430985, blue: 0.9878047109, alpha: 1))]),
                                                 startPoint: .top,
                                                 endPoint: .bottom))
                            .frame(width: width, height: height)
                        Spacer(minLength: 0)
                    }.frame(width: rect.size.width, height: height)
                    
                    HStack(spacing: 0) {
                        LinesShape(points: data, displayRange: range)
                            .stroke(lineWidth: 2)
                            .foregroundColor(.green)
                            .frame(width: width, height: height)
                        Spacer(minLength: 0)
                    }.frame(width: rect.size.width, height: height)
                }
            }
        }
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
