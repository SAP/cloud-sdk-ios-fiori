//
//  BubbleView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 7/16/20.
//

import SwiftUI

struct BubbleView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.axisDataSource) var axisDataSource
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let pd = axisDataSource.plotData(model)
        let minLength = min(rect.size.width, rect.size.height) * model.scale
        
        var displayPlotData: [ChartPlotData] = []
        for category in pd {
            for item in category {
                if self.isInVisableArea(for: item, rect: rect) {
                    displayPlotData.append(item)
                }
            }
        }
        
        return ZStack {
            ForEach(displayPlotData, id: \.self) { item in
                Circle()
                    .fill(self.model.colorAt(seriesIndex: item.seriesIndex, categoryIndex: item.categoryIndex))
                    .opacity(self.model.selections != nil ? 0.25 : 0.8)
                    .frame(width: item.rect.size.width * minLength, height: item.rect.size.width * minLength)
                    .position(x: item.pos.x * self.model.scale * rect.size.width - self.model.startPos.x,
                              y: (1 - item.pos.y * self.model.scale) * rect.size.height + self.model.startPos.y)
            }
        }.clipped()
    }
    
    func isInVisableArea(for item: ChartPlotData, rect: CGRect) -> Bool {
        let x = item.pos.x * model.scale * rect.size.width - model.startPos.x
        let y = (1 - item.pos.y * model.scale) * rect.size.height + model.startPos.y
        
        if x >= 0 && x <= rect.size.width && y >= 0 && y <= rect.size.height {
            return true
        } else {
            return false
        }
    }
}

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        let ds = BubbleAxisDataSource()
        
        return Group {
            ForEach(Tests.bubbleModels) {
                BubbleView()
                    .environmentObject($0)
                    .environment(\.axisDataSource, ds)
                    .frame(width: 330, height: 330, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
