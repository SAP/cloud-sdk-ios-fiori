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
        var selectedCategoryRange: ClosedRange<Int> = -1 ... -1
        var selectedSeriesRange: ClosedRange<Int> = -1 ... -1
        if let selections = model.selections {
            var seriesIndices: [Int] = []
            for (seriesIndex, catIndices) in selections {
                seriesIndices.append(seriesIndex)
                selectedCategoryRange = (catIndices.sorted().first ?? -1) ... (catIndices.sorted().last ?? -1)
            }
            seriesIndices.sort()
            selectedSeriesRange = (seriesIndices.first ?? -1) ... (seriesIndices.last ?? -1)
        }
        
        let minLength = min(rect.size.width, rect.size.height) * model.scale
        let pd = chartContext.plotData(model)
        let selected = selectedCategoryRange.lowerBound >= 0 && selectedSeriesRange.lowerBound >= 0
        var x: CGFloat = 0
        var y: CGFloat = 0
        if selected {
            x = pd[selectedSeriesRange.lowerBound][selectedCategoryRange.lowerBound].pos.x * model.scale * rect.size.width - startPosX
            y = (1 - pd[selectedSeriesRange.lowerBound][selectedCategoryRange.lowerBound].pos.y * model.scale) * rect.size.height + startPosY
        }
        
        return ZStack {
            if selected {
                // selected bubbles
                ForEach(selectedCategoryRange, id: \.self) { categoryIndex in
                    Circle()
                        .fill(self.model.colorAt(seriesIndex: selectedSeriesRange.lowerBound, categoryIndex: categoryIndex))
                        .frame(width: self.model.chartType == .scatter ? 10 : pd[selectedSeriesRange.lowerBound][categoryIndex].rect.size.width * minLength,
                               height: self.model.chartType == .scatter ? 10 : pd[selectedSeriesRange.lowerBound][categoryIndex].rect.size.width * minLength)
                        .position(x: pd[selectedSeriesRange.lowerBound][categoryIndex].pos.x * self.model.scale * rect.size.width - startPosX,
                                  y: (1 - pd[selectedSeriesRange.lowerBound][categoryIndex].pos.y * self.model.scale) * rect.size.height + startPosY)
                }
                
                if selectedCategoryRange.count == 1 {
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
                }
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
