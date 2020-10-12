//
//  BubbleIndicatorView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 7/16/20.
//

import SwiftUI

struct BubbleIndicatorView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.layoutDirection) var layoutDirection
    @Environment(\.chartContext) var chartContext
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let startPosX = model.startPos.x * model.scale * rect.size.width
        let startPosY = model.startPos.y * model.scale * rect.size.height
        
        var selections: [Int: [Int]] = [:]
        if let tmpSelections = model.selections {
            selections = tmpSelections
        }
        
        let minLength = min(rect.size.width, rect.size.height) * model.scale
        let pd = chartContext.plotData(model)
        let singleSelected = selections.count == 1 && selections.first?.value.count == 1
        var x: CGFloat = 0
        var y: CGFloat = 0
        if singleSelected {
            let seriesIndex = selections.first?.key ?? 0
            let categoryIndex = selections[seriesIndex]?.first ?? 0
            x = pd[seriesIndex][categoryIndex].pos.x * model.scale * rect.size.width - startPosX
            y = (1 - pd[seriesIndex][categoryIndex].pos.y * model.scale) * rect.size.height + startPosY
        }
        
        let seriesIndices = selections.keys.reversed()
        
        return ZStack {
            ForEach(seriesIndices, id: \.self) { seriesIndex in
                ForEach(selections[seriesIndex] ?? [], id: \.self) { categoryIndex in
                    Circle()
                        .fill(self.model.colorAt(seriesIndex: seriesIndex, categoryIndex: categoryIndex))
                        .frame(width: self.model.chartType == .scatter ? 10 : pd[seriesIndex][categoryIndex].rect.size.width * minLength,
                               height: self.model.chartType == .scatter ? 10 : pd[seriesIndex][categoryIndex].rect.size.width * minLength)
                        .position(x: pd[seriesIndex][categoryIndex].pos.x * self.model.scale * rect.size.width - startPosX,
                                  y: (1 - pd[seriesIndex][categoryIndex].pos.y * self.model.scale) * rect.size.height + startPosY)
                }
            }
            
            if singleSelected {
                // horizontal line
                LineShape(pos1: CGPoint(x: 0, y: y),
                          pos2: CGPoint(x: rect.size.width, y: y),
                          layoutDirection: layoutDirection)
                    .stroke(Color.preferredColor(.primary3), lineWidth: 1)
                
                // vertical line
                LineShape(pos1: CGPoint(x: x, y: 0),
                          pos2: CGPoint(x: x, y: rect.size.height),
                          layoutDirection: layoutDirection)
                    .stroke(Color.preferredColor(.primary3), lineWidth: 1)
                //                }
            }
        }.clipped()
    }
}

struct BubbleIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        let ds = BubbleChartContext()
        
        return Group {
            ForEach(Tests.bubbleModels) {
                BubbleIndicatorView()
                .environmentObject($0)
                    .environment(\.chartContext, ds)
                    .frame(width: 330, height: 330, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
