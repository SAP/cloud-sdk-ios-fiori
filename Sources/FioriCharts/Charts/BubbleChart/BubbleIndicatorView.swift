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
        if let tmp = model.selections {
            selectedCategoryRange = tmp[1]
            selectedSeriesRange = tmp[0]
        }
        
        let minLength = min(rect.size.width, rect.size.height) * model.scale
        let pd = axisDataSource.plotData(model)
        let selected = selectedCategoryRange.lowerBound >= 0 && selectedSeriesRange.lowerBound >= 0
        var x: CGFloat = 0
        var y: CGFloat = 0
        if selected {
            x = pd[selectedSeriesRange.lowerBound][selectedCategoryRange.lowerBound].pos.x * model.scale * rect.size.width - CGFloat(model.startPos)
            y = (1 - pd[selectedSeriesRange.lowerBound][selectedCategoryRange.lowerBound].pos.y * model.scale) * rect.size.height + model.startPosY
        }
        return ZStack {
            if selected {
                // selected bubbles
                ForEach(selectedCategoryRange, id: \.self) { categoryIndex in
                    Circle()
                        .fill(self.model.colorAt(seriesIndex: selectedSeriesRange.lowerBound, categoryIndex: categoryIndex))
                        .frame(width: pd[selectedSeriesRange.lowerBound][categoryIndex].rect.size.width * minLength, height: pd[selectedSeriesRange.lowerBound][categoryIndex].rect.size.width * minLength)
                        .position(x: pd[selectedSeriesRange.lowerBound][categoryIndex].pos.x * self.model.scale * rect.size.width - CGFloat(self.model.startPos),
                                  y: (1 - pd[selectedSeriesRange.lowerBound][categoryIndex].pos.y * self.model.scale) * rect.size.height + self.model.startPosY)
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
        }
    }
}

struct BubbleIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleIndicatorView()
    }
}
