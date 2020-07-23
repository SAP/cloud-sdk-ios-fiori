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
        
        return ZStack {
            ForEach(pd, id: \.self) { category in
                ForEach(category, id: \.self) { item in
                    Circle()
                        .fill(self.model.colorAt(seriesIndex: item.seriesIndex, categoryIndex: item.categoryIndex))
                        .frame(width: item.rect.size.width * minLength, height: item.rect.size.width * minLength)
                        .position(x: item.pos.x * self.model.scale * rect.size.width - self.model.startPos.x,
                                  y: (1 - item.pos.y * self.model.scale) * rect.size.height + self.model.startPos.y)
                }
            }
        }.clipped()
    }
}

//struct BubbleView_Previews: PreviewProvider {
//    static var previews: some View {
//        BubbleView()
//    }
//}
