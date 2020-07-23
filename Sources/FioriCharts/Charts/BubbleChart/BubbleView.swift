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
                        .opacity(self.alpha(for: item))
                        .frame(width: item.rect.size.width * minLength, height: item.rect.size.width * minLength)
                        .position(x: item.pos.x * self.model.scale * rect.size.width - self.model.startPos.x,
                                  y: (1 - item.pos.y * self.model.scale) * rect.size.height + self.model.startPos.y)
                }
            }
        }.clipped()
    }
    
    func alpha(for item: ChartPlotData) -> Double {
        if let tmp = model.selections {
            let selectedSeriesRange = tmp[0]
            
            if selectedSeriesRange.contains(item.seriesIndex) {
                //print("BubbleView: alpha = 0.66")
                return 0.66
            } else {
                //print("BubbleView: alpha = 0.25")
                return 0.25
            }
        } else {
            //print("BubbleView: alpha = 0.8")
            return 0.8
        }
    }
}

//struct BubbleView_Previews: PreviewProvider {
//    static var previews: some View {
//        BubbleView()
//    }
//}
