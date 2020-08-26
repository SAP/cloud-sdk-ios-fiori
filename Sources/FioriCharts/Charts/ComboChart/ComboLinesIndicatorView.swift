//
//  ComboLinesIndicatorView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 7/1/20.
//

import SwiftUI

struct ComboLinesIndicatorView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.axisDataSource) var axisDataSource
    @Environment(\.layoutDirection) var layoutDirection
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(rect: proxy.frame(in: .local))
        }
    }
    
    //swiftlint:disable function_body_length
    //swiftlint:disable cyclomatic_complexity
    func makeBody(rect: CGRect) -> some View {
        let allIndexs = IndexSet(integersIn: 0 ..< model.data.count)
        let lineIndexes =  model.indexesOfColumnSeries.symmetricDifference(allIndexs)
        
        var selectedCategoryRange: ClosedRange<Int> = -1 ... -1
        var selectedSeriesIndexes: [Int] = []
        if let selections = model.selections {
            var seriesIndices: [Int] = []
            for (seriesIndex, catIndices) in selections {
                seriesIndices.append(seriesIndex)
                selectedCategoryRange = (catIndices.sorted().first ?? -1) ... (catIndices.sorted().last ?? -1)
            }
            seriesIndices.sort()
            selectedSeriesIndexes = seriesIndices.filter({ (index) -> Bool in
                if lineIndexes.contains(index) {
                    return true
                }
                
                return false
            })
        }
        
        // none of line series has been selected
        if selectedSeriesIndexes.isEmpty {
            return AnyView(EmptyView())
        }
        
        let count = ChartUtility.numOfDataItems(model)
        let selectedSeriesIndex = selectedSeriesIndexes.first ?? 0
        let pd = axisDataSource.plotData(model)
        var selectionItems: [SelectionItem] = []
        let catIndexes: Set = [selectedCategoryRange.lowerBound, selectedCategoryRange.upperBound]
        for index in catIndexes {
            if index >= 0 && index < count {
                var yPos = [Int: CGFloat]()
                var xPos: CGFloat = 0
                
                for i in 0 ..< model.data.count {
                    if selectedSeriesIndexes.contains(i) {
                        xPos = pd[index][i].pos.x * model.scale * rect.size.width - model.startPos.x
                        yPos[i] = (1.0 - pd[index][i].pos.y) * rect.size.height
                    }
                }
                
                selectionItems.append(SelectionItem(categoryIndex: index, xPosition: xPos, yPositions: yPos, seriesIndexes: yPos.keys.sorted()))
            }
        }
        
        var data = [CGFloat?]()
        if catIndexes.count == 2 {
            let category = model.data[selectedSeriesIndex]
            for i in selectedCategoryRange.lowerBound ... selectedCategoryRange.upperBound {
                if let val = category[i].first {
                    data.append(val)
                }
            }
        }
        
        let startSelectionPos = pd[selectedCategoryRange.lowerBound][selectedSeriesIndex].pos.x * model.scale * rect.size.width - model.startPos.x
        let endSelectionPos = pd[selectedCategoryRange.upperBound][selectedSeriesIndex].pos.x * model.scale * rect.size.width - model.startPos.x
        let baselinePosition = ChartUtility.xAxisBaselinePosition(model)
        let isSecondary = model.indexesOfSecondaryValueAxis.contains(selectedSeriesIndex)
        let range = ChartUtility.displayRange(model, secondary: isSecondary)
        let selectionIndicatorColor: Color = .preferredColor(.primary2)
        let circleColor: Color = .preferredColor(.primary6)
        
        return AnyView(
            ZStack {
                // range selection ui
                if catIndexes.count == 2 {
                    // fill area
                    LinesShape(points: data,
                               displayRange: range,
                               layoutDirection: self.layoutDirection,
                               fill: true,
                               baselinePosition: baselinePosition,
                               startOffset: 0,
                               endOffset: 0)
                        .fill(self.model.seriesAttributes[selectedSeriesIndex].palette.fillColor)
                        .opacity(0.4)
                        .frame(width: endSelectionPos - startSelectionPos, height: rect.size.height)
                        .position(x: (endSelectionPos + startSelectionPos) / 2.0, y: rect.size.height / 2.0)
                    
                    // lines
                    LinesShape(points: data,
                               displayRange: range,
                               layoutDirection: self.layoutDirection,
                               startOffset: 0,
                               endOffset: 0)
                        .stroke(self.model.seriesAttributes[selectedSeriesIndex].palette.colors[0],
                                lineWidth: self.model.seriesAttributes[selectedSeriesIndex].lineWidth)
                        .frame(width: endSelectionPos - startSelectionPos, height: rect.size.height)
                        .position(x: (endSelectionPos + startSelectionPos) / 2.0, y: rect.size.height / 2.0)
                    
                    // points
                    PointsShape(points: data,
                                displayRange: range,
                                layoutDirection: self.layoutDirection,
                                radius: self.pointRadius(at: selectedSeriesIndex),
                                gap: self.model.seriesAttributes[selectedSeriesIndex].point.gap,
                                startOffset: 0,
                                endOffset: 0)
                        .fill(self.model.seriesAttributes[selectedSeriesIndex].point.strokeColor)
                        .frame(width: endSelectionPos - startSelectionPos, height: rect.size.height)
                        .position(x: (endSelectionPos + startSelectionPos) / 2.0, y: rect.size.height / 2.0)
                }
                
                ForEach(selectionItems) { item in
                    // Anchor Line
                    LineShape(pos1: CGPoint(x: item.xPosition, y: rect.origin.y),
                              pos2: CGPoint(x: item.xPosition, y: rect.origin.y + rect.size.height),
                              layoutDirection: self.layoutDirection)
                        .stroke(selectionIndicatorColor, lineWidth: 1)
                    
                    // top Anchor Shape
                    SelectionAnchorShape()
                        .rotation(Angle(degrees: 180))
                        .fill(selectionIndicatorColor)
                        .frame(width: 9, height: 4)
                        .position(x: item.xPosition, y: 2)
                    
                    // bottom Anchor Shape
                    SelectionAnchorShape()
                        .fill(selectionIndicatorColor)
                        .frame(width: 9, height: 4)
                        .position(x: item.xPosition, y: rect.origin.y + rect.size.height - 2)
                    
                    // selected circles
                    ForEach(item.seriesIndexes, id: \.self) { i in
                        ZStack {
                            Circle()
                                .fill(self.model.seriesAttributes[i].point.strokeColor)
                                .frame(width: self.model.seriesAttributes[i].point.diameter + 5.0,
                                       height: self.model.seriesAttributes[i].point.diameter + 5.0)
                                .position(CGPoint(x: item.xPosition, y: item.yPositions[i] ?? 0))
                            
                            Circle().stroke(circleColor, style: StrokeStyle(lineWidth: 4))
                                .frame(width: self.model.seriesAttributes[i].point.diameter + 9.0,
                                       height: self.model.seriesAttributes[i].point.diameter + 9.0)
                                .position(CGPoint(x: item.xPosition, y: item.yPositions[i] ?? 0))
                        }
                    }
                }
            }
        )
    }
    
    func pointRadius(at index: Int) -> CGFloat {
        let pointAttr = model.seriesAttributes[index].point
        
        return pointAttr.isHidden ? 0 : CGFloat(pointAttr.diameter/2)
    }
}

struct ComboLinesIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        let axisDataSource = ComboAxisDataSource()
        
        return ComboLinesIndicatorView()
            .environmentObject(Tests.comboModels[0])
            .environment(\.axisDataSource, axisDataSource)
            .frame(width: 300, height: 200)
    }
}
