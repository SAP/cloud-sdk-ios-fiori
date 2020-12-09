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
    
    // swiftlint:disable force_unwrapping
    func makeBody(in rect: CGRect) -> some View {
        let startPosition = chartContext.startPosition(model, plotViewSize: rect.size)
        let startPosX = startPosition.x * model.scaleX * rect.size.width
        let startPosY = startPosition.y * model.scaleX * rect.size.height
        
        var selections: [Int: [Int]] = [:]
        if let tmpSelections = model.selections {
            selections = tmpSelections
        }
        
        let minLength = min(rect.size.width, rect.size.height) * model.scaleX
        let pd = chartContext.plotData(model)
        let singleSelected = selections.count == 1 && selections.first?.value.count == 1
        var x: CGFloat = 0
        var y: CGFloat = 0
        if singleSelected {
            let seriesIndex = selections.first?.key ?? 0
            let categoryIndex = selections[seriesIndex]?.first ?? 0
            x = pd[seriesIndex][categoryIndex].pos.x * model.scaleX * rect.size.width - startPosX
            y = (1 - pd[seriesIndex][categoryIndex].pos.y) * model.scaleX * rect.size.height - startPosY
        }
        
        let seriesIndices = selections.keys.reversed()
        
        return ZStack {
            ForEach(0 ..< seriesIndices.count, id: \.self) { index in
                ForEach(selections[seriesIndices[index]]!, id: \.self) { categoryIndex in
                    Circle()
                        .fill(self.model.colorAt(seriesIndex: seriesIndices[index], categoryIndex: categoryIndex))
                        .frame(width: self.model.chartType == .scatter ? 10 : pd[seriesIndices[index]][categoryIndex].rect.size.width * minLength,
                               height: self.model.chartType == .scatter ? 10 : pd[seriesIndices[index]][categoryIndex].rect.size.width * minLength)
                        .position(x: pd[seriesIndices[index]][categoryIndex].pos.x * self.model.scaleX * rect.size.width - startPosX,
                                  y: (1 - pd[seriesIndices[index]][categoryIndex].pos.y) * self.model.scaleX * rect.size.height - startPosY)
                }
            }
            
            // draw cross lines for single selection only
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
            } else {
                EmptyView()
            }
        }.clipped()
    }
}

struct BubbleIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.bubbleModels) {
                BubbleIndicatorView()
                    .environmentObject($0)
                    .environment(\.chartContext, BubbleChartContext())
                    .frame(width: 330, height: 330, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
