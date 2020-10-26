//
//  LineIndicatorView.swift
//  FioriCharts
//
//  Created by Xu, Sheng on 3/26/20.
//

import SwiftUI
import FioriSwiftUICore

struct SelectionItem: Identifiable {
    let categoryIndex: Int
    let xPosition: CGFloat
    let yPositions: [Int: CGFloat]
    let seriesIndexes: [Int]
    
    var id: Int {
        return categoryIndex
    }
}

struct LineIndicatorView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.layoutDirection) var layoutDirection
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(rect: proxy.frame(in: .local))
        }
    }
    
    func makeBody(rect: CGRect) -> some View {
        var selectedCategoryRange: ClosedRange<Int> = -1 ... -1
        var selectedSeriesRange: ClosedRange = 0 ... 0
        if let selections = model.selections {
            var seriesIndices: [Int] = []
            for (seriesIndex, catIndices) in selections {
                seriesIndices.append(seriesIndex)
                selectedCategoryRange = (catIndices.sorted().first ?? -1) ... (catIndices.sorted().last ?? -1)
            }
            seriesIndices.sort()
            selectedSeriesRange = (seriesIndices.first ?? 0) ... (seriesIndices.last ?? 0)
        }
        
        let count = model.numOfCategories()
        let secondarySeriesIndexes = model.indexesOfSecondaryValueAxis.sorted()
        let width = rect.size.width
        let startPosX = model.startPos.x * model.scale * width
        let unitWidth: CGFloat = max(width * model.scale / CGFloat(max(count - 1, 1)), ChartViewLayout.minUnitWidth)
        let startIndex = Int((startPosX / unitWidth).rounded(.up))
        let startOffset: CGFloat = (unitWidth - startPosX.truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
        
        let startSelectionPos: CGFloat = CGFloat(selectedCategoryRange.lowerBound) * unitWidth - startPosX
        let endSelectionPos: CGFloat = CGFloat(selectedCategoryRange.upperBound) * unitWidth - startPosX
        
        let displayRange = ChartUtility.displayRange(model)
        let seconaryDisplayRange = ChartUtility.displayRange(model, secondary: true)
        var selectionItems: [SelectionItem] = []
        let catIndexes: Set = [selectedCategoryRange.lowerBound, selectedCategoryRange.upperBound]
        for index in catIndexes {
            if index >= 0 && index < count {
                var yPos = [Int: CGFloat]()
                let xPos = rect.origin.x + startOffset + CGFloat(index - startIndex) * unitWidth
                
                for i in 0 ..< model.data.count {
                    let range = secondarySeriesIndexes.contains(i) ? seconaryDisplayRange : displayRange
                    
                    if let value = ChartUtility.dimensionValue(model, seriesIndex: i, categoryIndex: index) {
                        let y = rect.size.height - (CGFloat(value) - range.lowerBound) * rect.size.height / (range.upperBound - range.lowerBound) + rect.origin.y
                        if selectedSeriesRange.contains(i) {
                            yPos[i] = y
                        }
                    }
                }
                
                selectionItems.append(SelectionItem(categoryIndex: index, xPosition: xPos, yPositions: yPos, seriesIndexes: yPos.keys.sorted()))
            }
        }
        
        var data = [CGFloat?]()
        if catIndexes.count == 2 {
            for i in selectedCategoryRange.lowerBound ... selectedCategoryRange.upperBound {
                let val = ChartUtility.dimensionValue(model, seriesIndex: selectedSeriesRange.lowerBound, categoryIndex: i, dimensionIndex: 0)
                data.append(val)
            }
        }
        let baselinePosition = ChartUtility.xAxisBaselinePosition(model)
        let range = secondarySeriesIndexes.contains(selectedSeriesRange.lowerBound) ? seconaryDisplayRange : displayRange
        let selectionIndicatorColor: Color = .preferredColor(.primary2)
        let circleColor: Color = .preferredColor(.primary6)
        let extraSelectedPointDiameterWidth = ChartViewLayout.extraSelectedPointRadiusWidth * 2
        
        let extraSelectedPointAndBorderDiameterWidth = (ChartViewLayout.extraSelectedPointRadiusWidth + ChartViewLayout.extraSelectedPointWhiteBoderRadiusWidth) * 2
        
        return ZStack {
            // range selection ui
            if catIndexes.count == 2 {
                LinesShape(points: data,
                           displayRange: range,
                           layoutDirection: self.layoutDirection,
                           fill: true,
                           baselinePosition: baselinePosition,
                           startOffset: 0,
                           endOffset: 0)
                    .fill(self.model.seriesAttributes[selectedSeriesRange.lowerBound].palette.fillColor)
                    .opacity(0.4)
                    .frame(width: endSelectionPos - startSelectionPos, height: rect.size.height)
                    .position(x: (endSelectionPos + startSelectionPos) / 2.0, y: rect.size.height / 2.0)
                
                LinesShape(points: data,
                           displayRange: range,
                           layoutDirection: self.layoutDirection,
                           startOffset: 0,
                           endOffset: 0)
                    .stroke(self.model.seriesAttributes[selectedSeriesRange.lowerBound].palette.colors[0],
                            lineWidth: self.model.seriesAttributes[selectedSeriesRange.lowerBound].lineWidth)
                    .frame(width: endSelectionPos - startSelectionPos, height: rect.size.height)
                    .position(x: (endSelectionPos + startSelectionPos) / 2.0, y: rect.size.height / 2.0)
                
                PointsShape(points: data,
                            displayRange: range,
                            layoutDirection: self.layoutDirection,
                            radius: self.pointRadius(at: selectedSeriesRange.lowerBound),
                            gap: self.model.seriesAttributes[selectedSeriesRange.lowerBound].point.gap,
                            startOffset: 0,
                            endOffset: 0)
                    .fill(self.model.seriesAttributes[selectedSeriesRange.lowerBound].point.strokeColor)
                    .frame(width: endSelectionPos - startSelectionPos, height: rect.size.height)
                    .position(x: (endSelectionPos + startSelectionPos) / 2.0, y: rect.size.height / 2.0)
            }
            
            ForEach(selectionItems) { item in
                LineShape(pos1: CGPoint(x: item.xPosition, y: rect.origin.y),
                          pos2: CGPoint(x: item.xPosition, y: rect.origin.y + rect.size.height),
                          layoutDirection: self.layoutDirection)
                    .stroke(selectionIndicatorColor, lineWidth: 1)
                
                SelectionAnchorShape()
                    .rotation(Angle(degrees: 180))
                    .fill(selectionIndicatorColor)
                    .frame(width: 9, height: 4)
                    .position(x: item.xPosition, y: 2)
                
                SelectionAnchorShape()
                    .fill(selectionIndicatorColor)
                    .frame(width: 9, height: 4)
                    .position(x: item.xPosition, y: rect.origin.y + rect.size.height - 2)
                
                ForEach(item.seriesIndexes, id: \.self) { i in
                    ZStack {
                        Circle()
                            .fill(self.model.seriesAttributes[i].point.strokeColor)
                            .frame(width: self.model.seriesAttributes[i].point.diameter + extraSelectedPointDiameterWidth,
                                   height: self.model.seriesAttributes[i].point.diameter + extraSelectedPointDiameterWidth)
                            .position(CGPoint(x: item.xPosition, y: item.yPositions[i] ?? 0))
                        
                        Circle().stroke(circleColor, style: StrokeStyle(lineWidth: 4))
                            .frame(width: self.model.seriesAttributes[i].point.diameter + extraSelectedPointAndBorderDiameterWidth,
                                   height: self.model.seriesAttributes[i].point.diameter + extraSelectedPointAndBorderDiameterWidth)
                            .position(CGPoint(x: item.xPosition, y: item.yPositions[i] ?? 0))
                    }
                }
            }
        }
    }
    
    func pointRadius(at index: Int) -> CGFloat {
        let pointAttr = model.seriesAttributes[index].point
        
        return pointAttr.isHidden ? 0 : CGFloat(pointAttr.diameter/2)
    }
}

struct LineIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        LineIndicatorView()
            .environmentObject(Tests.lineModels[0])
            .frame(width: 300, height: 200, alignment: .topLeading)
            .padding(32)
            .previewLayout(.sizeThatFits)
    }
}
