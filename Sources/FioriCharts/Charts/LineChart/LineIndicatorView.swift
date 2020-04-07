//
//  LineIndicatorView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/26/20.
//

import SwiftUI

struct LineIndicatorView: View {
    @ObservedObject var model: ChartModel
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.layoutDirection) var layoutDirection
    
    public init(_ model: ChartModel) {
        self.model = model
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.content(rect: proxy.frame(in: .local))
        }
    }
    
    func content(rect: CGRect) -> some View {
        var selectedCategoryRange: ClosedRange<Int> = -1 ... -1
        var x: CGFloat = 0
        var yPos: [CGFloat] = []
        
        if let tmp = model.selectedCategoryInRange {
            selectedCategoryRange = tmp
        }
        
        let closestDataIndex = selectedCategoryRange.lowerBound
        let count = ChartUtility.numOfDataItmes(model)
        
        if closestDataIndex >= 0 && closestDataIndex < count {
            let width = rect.size.width
            let unitWidth: CGFloat = width * model.scale / CGFloat(count - 1)
            let startIndex = Int((CGFloat(model.startPos) / unitWidth).rounded(.up))
            let startOffset: CGFloat = (unitWidth - CGFloat(model.startPos).truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
            let displayRange = ChartUtility.displayRange(model)
            let minVal = displayRange.lowerBound
            let maxVal = displayRange.upperBound
            
            x = rect.origin.x + startOffset + CGFloat(closestDataIndex - startIndex) * unitWidth
            
            for i in 0 ..< model.data.count {
                if let value = ChartUtility.dimensionValue(model, seriesIndex: i, categoryIndex: closestDataIndex) {
                    
                    let y = rect.size.height - (CGFloat(value) - minVal) * rect.size.height / (maxVal - minVal) + rect.origin.y
                    yPos.append(y)
                }
            }
        }
        
        return ZStack {
            if closestDataIndex >= 0 {
                LineShape(pos1: CGPoint(x: x, y: rect.origin.y),
                          pos2: CGPoint(x: x, y: rect.origin.y + rect.size.height),
                          layoutDirection: layoutDirection)
                    .stroke(Palette.hexColor(for: .primary1).color(colorScheme), lineWidth: 1)
                
                ForEach(0 ..< model.data.count) { i in
                    Circle()
                        .fill(self.model.seriesAttributes[i].point.strokeColor.color(self.colorScheme))
                        .frame(width: CGFloat(self.model.seriesAttributes[i].point.diameter + 4), height: CGFloat(self.model.seriesAttributes[i].point.diameter + 4))
                        .position(CGPoint(x: x, y: yPos[i]))
                }
            }
        }
    }
}

struct LineIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        LineIndicatorView(Tests.lineModels[0])
            .frame(width: 300, height: 200, alignment: .topLeading)
            .padding(32)
            .previewLayout(.sizeThatFits)
    }
}
