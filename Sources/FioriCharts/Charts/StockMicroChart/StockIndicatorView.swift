//
//  StockIndicatorView.swift
//  Micro Charts
//
//  Created by Xu, Sheng on 1/9/20.
//  Copyright © 2020 sstadelman. All rights reserved.
//

import SwiftUI
import FioriSwiftUICore

struct StockIndicatorView: View {
    @ObservedObject var model: ChartModel
    @Environment(\.layoutDirection) var layoutDirection
    
    public init(_ model: ChartModel) {
        self.model = model
    }
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    // swiftlint:disable function_body_length
    // swiftlint:disable cyclomatic_complexity
    func makeBody(in rect: CGRect) -> some View {
        var selectedCategoryRange: ClosedRange<Int> = -1 ... -1
        var selectedSeriesRange: ClosedRange = model.indexOfStockSeries ... model.indexOfStockSeries
        if let tmp = model.selections {
            selectedCategoryRange = tmp[1]
            selectedSeriesRange = tmp[0]
        }
        
        let count = ChartUtility.numOfDataItems(model)
        let width = rect.size.width
        let unitWidth: CGFloat = width * model.scale / CGFloat(max(count - 1, 1))
        let startIndex = Int((CGFloat(model.startPos) / unitWidth).rounded(.up))
        let startOffset: CGFloat = (unitWidth - CGFloat(model.startPos).truncatingRemainder(dividingBy: unitWidth)).truncatingRemainder(dividingBy: unitWidth)
        
        let startSelectionPos: CGFloat = CGFloat(selectedCategoryRange.lowerBound) * unitWidth - CGFloat(model.startPos)
        let endSelectionPos: CGFloat = CGFloat(selectedCategoryRange.upperBound) * unitWidth - CGFloat(model.startPos)
        let range = ChartUtility.displayRange(model)
        var selectionItems: [SelectionItem] = []
        let catIndexes: Set = [selectedCategoryRange.lowerBound, selectedCategoryRange.upperBound]
        for index in catIndexes {
            if index >= 0 && index < count {
                var yPos = [Int: CGFloat]()
                let xPos = rect.origin.x + startOffset + CGFloat(index - startIndex) * unitWidth
                
                for i in 0 ..< model.data.count {
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
            let category = model.data[selectedSeriesRange.lowerBound]
            for i in selectedCategoryRange.lowerBound ... selectedCategoryRange.upperBound {
                if let val = category[i].first {
                    data.append(val)
                }
            }
        }
        let baselinePosition = ChartUtility.xAxisBaselinePosition(model)
        let seriesIndex = model.currentSeriesIndex
        var isPriceGoingUp = true
        if let startPrice = ChartUtility.dimensionValue(model, categoryIndex: 0), let endPrice = ChartUtility.dimensionValue(model, categoryIndex: ChartUtility.lastValidDimIndex(model)) {
            if startPrice > endPrice {
                isPriceGoingUp = false
            }
        }
        
        let strokeColor = isPriceGoingUp ? model.seriesAttributes[seriesIndex].palette.colors[0] : model.seriesAttributes[seriesIndex].palette.colors[1]
        let fillColor = strokeColor.opacity(0.4)
        let selectionIndicatorColor: Color = .preferredColor(forStyle: .primary2)
        let circleColor: Color = .preferredColor(forStyle: .primary6)
        
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
                    .fill(fillColor)
                    .opacity(0.4)
                    .frame(width: endSelectionPos - startSelectionPos, height: rect.size.height)
                    .position(x: (endSelectionPos + startSelectionPos) / 2.0, y: rect.size.height / 2.0)
            
                LinesShape(points: data,
                           displayRange: range,
                           layoutDirection: self.layoutDirection,
                           startOffset: 0,
                           endOffset: 0)
                    .stroke(strokeColor,
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
                    .fill(strokeColor)
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
                            .fill(strokeColor)
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
    }
    
    func pointRadius(at index: Int) -> CGFloat {
        let pointAttr = model.seriesAttributes[index].point
        
        return pointAttr.isHidden ? 0 : CGFloat(pointAttr.diameter/2)
    }
}

struct StockIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        StockIndicatorView(Tests.stockModels[1])
            .frame(width: 300, height: 200, alignment: .topLeading)
            .padding(32)
            .previewLayout(.sizeThatFits)
    }
}
