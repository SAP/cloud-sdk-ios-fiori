//
//  LinesView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/19/20.
//

import SwiftUI

struct LinesView: View {
    @ObservedObject var model: ChartModel
    @Environment(\.colorScheme) var colorScheme
    
    public init(_ chartModel: ChartModel) {
        self.model = chartModel
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.chartView(in: geometry.frame(in: .local))
        }
    }
    
    func chartView(in rect: CGRect) -> some View {
        let displayRange = StockUtility.displayRange(model)
        var noData = false
        let width = rect.size.width
        let startPosInFloat = CGFloat(model.startPos)
        
        let unitWidth: CGFloat = width * model.scale / CGFloat(StockUtility.numOfDataItmes(model) - 1)
        let startIndex = Int(startPosInFloat / unitWidth)
        
        var endIndex = Int(((startPosInFloat + width) / unitWidth).rounded(.up))
        let startOffset: CGFloat = -startPosInFloat.truncatingRemainder(dividingBy: unitWidth)
        
        let endOffset: CGFloat = (CGFloat(endIndex) * unitWidth - startPosInFloat - width).truncatingRemainder(dividingBy: unitWidth)
    
        if endIndex > StockUtility.lastValidDimIndex(model) {
            endIndex = StockUtility.lastValidDimIndex(model)
        }

        if startIndex > endIndex {
            noData = true
        }
        
        var data: [[Double]] = []
        if !noData {
            for category in model.data {
                var s: [Double] = []
                for i in startIndex...endIndex {
                    if let val = category[i].first {
                        s.append(val)
                    }
                }
                data.append(s)
            }
        }
        
        return ZStack {
            ForEach(0 ..< data.count) { i in
                LinesShape(points: data[i],
                           displayRange: displayRange,
                           startOffset: startOffset,
                           endOffset: endOffset)
                    .stroke(self.model.seriesAttributes.colors[i].color(self.colorScheme),
                            lineWidth: CGFloat(self.model.seriesAttributes.lineWidth))
            }
        }
    }
}

struct LinesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.lineModels) {
                LinesView($0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
