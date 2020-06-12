//
//  LinesView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/19/20.
//

import SwiftUI

struct LinesView: View {
    @ObservedObject var model: ChartModel
    @Environment(\.axisDataSource) var axisDataSource
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.layoutDirection) var layoutDirection
    @State var fill: Bool = false
    
    public init(_ chartModel: ChartModel, fill: Bool = false) {
        self.model = chartModel
        self._fill = State(initialValue: fill)
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
        var noData = false
        let (startIndex, endIndex, startOffset, endOffset) = axisDataSource.displayCategoryIndexesAndOffsets(model, rect: rect)
        
        if startIndex > endIndex {
            noData = true
        }
        
        let allIndexs = IndexSet(integersIn: 0 ..< model.data.count)
        let indexes: [Int] = secondary ? model.indexesOfSecondaryValueAxis.sorted() : model.indexesOfSecondaryValueAxis.symmetricDifference(allIndexs).sorted()
        
        if indexes.isEmpty {
            noData = true
        }
        
        var data = [Int: [CGFloat?]]()
        if !noData {
            for i in indexes {
                let category = model.data[i]
                var s: [CGFloat?] = []
                for i in startIndex...endIndex {
                    if let val = category[i].first {
                        s.append(val)
                    }
                }
                data[i] = s
            }
        }
        let baselinePosition = ChartUtility.xAxisBaselinePosition(model)
        
        return ZStack {
            ForEach(indexes, id: \.self) { i in
                ZStack {
                    LinesShape(points: data[i] ?? [],
                               displayRange: displayRange,
                               layoutDirection: self.layoutDirection,
                               fill: self.fill,
                               baselinePosition: baselinePosition,
                               startOffset: startOffset,
                               endOffset: endOffset)
                        .fill(self.model.seriesAttributes[i].palette.fillColor.color(self.colorScheme))
                        .opacity(self.fill ? 0.4 : 0)
                        .frame(width: rect.size.width, height: rect.size.height)
                        .clipped()
                    
                    LinesShape(points: data[i] ?? [],
                               displayRange: displayRange,
                               layoutDirection: self.layoutDirection,
                               startOffset: startOffset,
                               endOffset: endOffset)
                        .stroke(self.model.seriesAttributes[i].palette.colors[0].color(self.colorScheme),
                                lineWidth: self.model.seriesAttributes[i].lineWidth)
                        .frame(width: rect.size.width, height: rect.size.height)
                        .clipped()
                    
                    PointsShape(points: data[i] ?? [],
                                displayRange: displayRange,
                                layoutDirection: self.layoutDirection,
                                radius: self.pointRadius(at: i),
                                gap: self.model.seriesAttributes[i].point.gap,
                                startOffset: startOffset,
                                endOffset: endOffset)
                        .fill(self.model.seriesAttributes[i].point.strokeColor.color(self.colorScheme))
                }
            }
        }
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
                LinesView($0)
                    .frame(width: 330, height: 220, alignment: .topLeading)
                    .previewLayout(.sizeThatFits)
            }
        }
    }
}
