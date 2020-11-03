//
//  LinesView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/19/20.
//

import SwiftUI

struct LinesView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
    
    /// true is for Area Chart, false is for Line Chart
    let fill: Bool
    
    init(fill: Bool = false) {
        self.fill = fill
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        ZStack {
            self.makeLinesBody(in: rect, secondary: false)
            
            self.makeLinesBody(in: rect, secondary: true)
        }
    }
    
    func makeLinesBody(in rect: CGRect, secondary: Bool) -> some View {
        let displayRange = ChartUtility.displayRange(model, secondary: secondary)
        let (startIndex, endIndex, startOffset, endOffset) = chartContext.displayCategoryIndexesAndOffsets(model, rect: rect)
        
        if startIndex > endIndex {
            return AnyView(EmptyView())
        }
        
        let allIndexs = IndexSet(integersIn: 0 ..< model.data.count)
        let indexes: [Int] = secondary ? model.indexesOfSecondaryValueAxis.sorted() : model.indexesOfSecondaryValueAxis.symmetricDifference(allIndexs).sorted()
    
        let baselinePosition = ChartUtility.xAxisBaselinePosition(model)
        
        return AnyView(ZStack {
            ForEach(indexes, id: \.self) { i in
                ZStack {
                    LinesShape(model: self.model,
                                 seriesIndex: i,
                                 categoryIndexRange: startIndex ... endIndex,
                                 displayRange: displayRange,
                                 layoutDirection: self.layoutDirection,
                                 fill: self.fill,
                                 baselinePosition: baselinePosition,
                                 startOffset: startOffset,
                                 endOffset: endOffset)
                        .fill(self.model.seriesAttributes[i].palette.fillColor)
                        .opacity(self.fill ? 0.4 : 0)
                        .frame(width: rect.size.width, height: rect.size.height)
                        .clipped()

                    LinesShape(model: self.model,
                                 seriesIndex: i,
                                 categoryIndexRange: startIndex ... endIndex,
                                 displayRange: displayRange,
                                 layoutDirection: self.layoutDirection,
                                 startOffset: startOffset,
                                 endOffset: endOffset)
                        .stroke(self.model.seriesAttributes[i].palette.colors[0],
                                lineWidth: self.model.seriesAttributes[i].lineWidth)
                        .frame(width: rect.size.width, height: rect.size.height)
                        .clipped()

                    PointsShape(model: self.model,
                                  seriesIndex: i,
                                  categoryIndexRange: startIndex ... endIndex,
                                  displayRange: displayRange,
                                  layoutDirection: self.layoutDirection,
                                  radius: self.pointRadius(at: i),
                                  gap: self.model.seriesAttributes[i].point.gap,
                                  startOffset: startOffset,
                                  endOffset: endOffset)
                        .fill(self.model.seriesAttributes[i].point.strokeColor)
                }
            }
        })
    }
    
    func pointRadius(at index: Int) -> CGFloat {
        let pointAttr = model.seriesAttributes[index].point
        
        return pointAttr.isHidden ? 0 : CGFloat(pointAttr.diameter/2)
    }
}

struct LinesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ForEach(Tests.lineModels) {
                LinesView()
                    .environmentObject($0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
