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
    @Environment(\.axisDataSource) var axisDataSource
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
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
        let pd = axisDataSource.plotData(model)
        let selected = selectedCategoryRange.lowerBound >= 0 && selectedSeriesRange.lowerBound >= 0
        var x: CGFloat = 0
        var y: CGFloat = 0
        if selected {
            x = pd[selectedSeriesRange.lowerBound][selectedCategoryRange.lowerBound].pos.x * model.scale * rect.size.width - model.startPos.x
            y = (1 - pd[selectedSeriesRange.lowerBound][selectedCategoryRange.lowerBound].pos.y * model.scale) * rect.size.height + model.startPos.y
        }
        
        return ZStack {
            if selected {
                // selected bubbles
                ForEach(selectedCategoryRange, id: \.self) { categoryIndex in
                    Circle()
                        .fill(self.model.colorAt(seriesIndex: selectedSeriesRange.lowerBound, categoryIndex: categoryIndex))
                        .frame(width: self.model.chartType == .scatter ? 10 : pd[selectedSeriesRange.lowerBound][categoryIndex].rect.size.width * minLength,
                               height: self.model.chartType == .scatter ? 10 : pd[selectedSeriesRange.lowerBound][categoryIndex].rect.size.width * minLength)
                        .position(x: pd[selectedSeriesRange.lowerBound][categoryIndex].pos.x * self.model.scale * rect.size.width - self.model.startPos.x,
                                  y: (1 - pd[selectedSeriesRange.lowerBound][categoryIndex].pos.y * self.model.scale) * rect.size.height + self.model.startPos.y)
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
        let ds = BubbleAxisDataSource()
        
        return Group {
            ForEach(Tests.bubbleModels) {
                BubbleIndicatorView()
                .environmentObject($0)
                    .environment(\.axisDataSource, ds)
                    .frame(width: 330, height: 330, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
