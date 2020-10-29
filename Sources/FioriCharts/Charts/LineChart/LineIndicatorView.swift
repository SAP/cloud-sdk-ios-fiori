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

/*
 Line, Stock and Combo chart use this to show selection UI
 */

struct LineIndicatorView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(rect: proxy.frame(in: .local))
        }
    }
    
    //swiftlint:disable function_body_length
    //swiftlint:disable force_unwrapping
    func makeBody(rect: CGRect) -> some View {
        let lineSelections: [Int: [Int]]?
        
        if model.chartType == .combo {
            var tmpLineSelections = [Int: [Int]]()
            let allIndexs = IndexSet(integersIn: 0 ..< model.numOfSeries())
            let lineIndexes =  model.indexesOfColumnSeries.symmetricDifference(allIndexs)
            
            if let tmpSelections = model.selections {
                for (seriesId, sel) in tmpSelections {
                    if lineIndexes.contains(seriesId) {
                        tmpLineSelections[seriesId] = sel
                    }
                }
            }
            
            // set result
            if tmpLineSelections.isEmpty {
                lineSelections = nil
            } else {
                lineSelections = tmpLineSelections
            }
        } else {
            lineSelections = model.selections
        }
        
        let (rangeSelections, singleSelections) = ChartUtility.convertSelections(lineSelections)
        if rangeSelections.isEmpty && singleSelections.isEmpty {
            return AnyView(EmptyView())
        }
            
        var singleLineIndicators = Set<Int>()
        var singlePointIndicators = [String]()
        var data: [String: [CGFloat?]] = [:]
        for (seriesId, crs) in rangeSelections {
            for cr in crs {
                var tmpData = [CGFloat?]()
                singleLineIndicators.insert(cr.lowerBound)
                singleLineIndicators.insert(cr.upperBound)
                let key1 = String("\(seriesId):\(cr.lowerBound)")
                let key2 = String("\(seriesId):\(cr.upperBound)")
                singlePointIndicators.append(key1)
                singlePointIndicators.append(key2)
                
                for i in cr {
                    let val = ChartUtility.dimensionValue(model, seriesIndex: seriesId, categoryIndex: i, dimensionIndex: 0)
                    tmpData.append(val)
                }
                
                let key = String("\(seriesId):\(cr.lowerBound):\(cr.upperBound)")
                data[key] = tmpData
            }
        }
        
        for (seriesId, cats) in singleSelections {
            for i in cats {
                singleLineIndicators.insert(i)
                let key = String("\(seriesId):\(i)")
                singlePointIndicators.append(key)
            }
        }
        
        let baselinePosition = ChartUtility.xAxisBaselinePosition(model)
        let selectionIndicatorColor: Color = .preferredColor(.primary2)
        let circleColor: Color = .preferredColor(.primary6)
        let extraSelectedPointDiameterWidth = ChartViewLayout.extraSelectedPointRadiusWidth * 2
        let extraSelectedPointAndBorderDiameterWidth = (ChartViewLayout.extraSelectedPointRadiusWidth + ChartViewLayout.extraSelectedPointWhiteBoderRadiusWidth) * 2
        
        return AnyView(ZStack {
            // range selection ui
            ForEach(data.keys.sorted(), id: \.self) { key in
                ZStack {
                    LinesShape(points: data[key]!,
                               displayRange: self.displayRange(key),
                               layoutDirection: self.layoutDirection,
                               fill: true,
                               baselinePosition: baselinePosition,
                               startOffset: 0,
                               endOffset: 0)
                        .fill(self.lineStrokeColor(key, stroke: false))
                        .opacity(0.4)
                        .frame(width: self.rangeSelectionWidth(key, rect: rect), height: rect.size.height)
                        .position(x: self.rangeSelectionPosition(key, rect: rect), y: rect.size.height / 2.0)
                    
                    LinesShape(points: data[key]!,
                               displayRange: self.displayRange(key),
                               layoutDirection: self.layoutDirection,
                               startOffset: 0,
                               endOffset: 0)
                        .stroke(self.lineStrokeColor(key, stroke: true),
                                lineWidth: self.lineWidth(key))
                        .frame(width: self.rangeSelectionWidth(key, rect: rect), height: rect.size.height)
                        .position(x: self.rangeSelectionPosition(key, rect: rect), y: rect.size.height / 2.0)
                    
                    PointsShape(points: data[key]!,
                                displayRange: self.displayRange(key),
                                layoutDirection: self.layoutDirection,
                                radius: self.pointRadius(key, show: true),
                                gap: self.pointGap(key),
                                startOffset: 0,
                                endOffset: 0)
                        .fill(self.pointStrokeColor(key))
                        .frame(width: self.rangeSelectionWidth(key, rect: rect), height: rect.size.height)
                        .position(x: self.rangeSelectionPosition(key, rect: rect), y: rect.size.height / 2.0)
                }
            }
            
            // Single line indicator
            ForEach(singleLineIndicators.sorted(), id: \.self) { catIndex in
                ZStack {
                    LineShape(pos1: CGPoint(x: self.xPos(catIndex, rect: rect),
                                            y: rect.origin.y),
                              pos2: CGPoint(x: self.xPos(catIndex, rect: rect),
                                            y: rect.origin.y + rect.size.height),
                              layoutDirection: self.layoutDirection)
                        .stroke(selectionIndicatorColor, lineWidth: 1)
                    
                    SelectionAnchorShape()
                        .rotation(Angle(degrees: 180))
                        .fill(selectionIndicatorColor)
                        .frame(width: 9, height: 4)
                        .position(x: self.xPos(catIndex, rect: rect), y: 2)

                    SelectionAnchorShape()
                        .fill(selectionIndicatorColor)
                        .frame(width: 9, height: 4)
                        .position(x: self.xPos(catIndex, rect: rect), y: rect.origin.y + rect.size.height - 2)
                }
            }
            
            // point indicator
            ForEach(singlePointIndicators.sorted(), id: \.self) { key in
                ZStack {
                    Circle()
                        .fill(self.pointStrokeColor(key))
                        .frame(width: self.pointRadius(key, show: false) * 2 + extraSelectedPointDiameterWidth,
                               height: self.pointRadius(key, show: false) * 2 + extraSelectedPointDiameterWidth)
                        .position(self.pos(from: key, rect: rect))
                    
                    Circle().stroke(circleColor, style: StrokeStyle(lineWidth: 4))
                        .frame(width: self.pointRadius(key, show: false) * 2 + extraSelectedPointAndBorderDiameterWidth,
                               height: self.pointRadius(key, show: false) * 2 + extraSelectedPointAndBorderDiameterWidth)
                        .position(self.pos(from: key, rect: rect))
                }
            }
        })
    }
    
    func seriesIdFromKey(_ key: String) -> Int {
        let indices = key.split(separator: ":").map {
            Int($0) ?? 0
        }
        
        return indices.isEmpty ? 0 : indices[0]
    }
    
    func lowerBoundFromKey(_ key: String) -> Int {
        let indices = key.split(separator: ":").map {
            Int($0) ?? 0
        }
        
        return indices.count >= 2 ? indices[1] : 0
    }
    
    func upperBoundFromKey(_ key: String) -> Int {
        let indices = key.split(separator: ":").map {
            Int($0) ?? 0
        }
        
        return indices.count >= 3 ? indices[2] : 0
    }
    
    func displayRange(_ key: String) -> ClosedRange<CGFloat> {
        if model.chartType == .stock {
            return ChartUtility.displayRange(model)
        } else {
            let seriesIndex = seriesIdFromKey(key)
            let secondarySeriesIndexes = model.indexesOfSecondaryValueAxis.sorted()
            if secondarySeriesIndexes.contains(seriesIndex) {
                return ChartUtility.displayRange(model, secondary: true)
            } else {
                return ChartUtility.displayRange(model)
            }
        }
    }
    
    func rangeSelectionWidth(_ key: String, rect: CGRect) -> CGFloat {
        let indices = key.split(separator: ":").map {
            Int($0) ?? 0
        }
        
        let low = indices.count >= 2 ? indices[1] : 0
        let upper = indices.count >= 3 ? indices[2] : 0
        
        return xPos(upper, rect: rect) - xPos(low, rect: rect)
    }
    
    func rangeSelectionPosition(_ key: String, rect: CGRect) -> CGFloat {
        let indices = key.split(separator: ":").map {
            Int($0) ?? 0
        }
        
        let low = indices.count >= 2 ? indices[1] : 0
        let upper = indices.count >= 3 ? indices[2] : 0
        
        return (xPos(upper, rect: rect) + xPos(low, rect: rect)) / 2
    }
    
    func xPos(_ categoryIndex: Int, rect: CGRect) -> CGFloat {
        let startPosX = model.startPos.x * model.scale * rect.size.width
        
        if model.chartType == .combo {
            let pd = chartContext.plotData(model)
            let allIndexs = IndexSet(integersIn: 0 ..< model.numOfSeries())
            let lineIndexes =  model.indexesOfColumnSeries.symmetricDifference(allIndexs).sorted()
            let seriesIndex = lineIndexes.isEmpty ? 0 : lineIndexes[0]
            
            if pd.isEmpty {
                return 0
            } else {
                return pd[categoryIndex][seriesIndex].pos.x * model.scale * rect.size.width - startPosX
            }
        } else {
            let count = model.chartType == .stock ? ChartUtility.numOfDataItems(model) : model.numOfCategories()
            let unitWidth: CGFloat = max(rect.size.width * model.scale / CGFloat(max(count - 1, 1)), ChartViewLayout.minUnitWidth)
            
            return CGFloat(categoryIndex) * unitWidth - startPosX
        }
    }
    
    func pos(from key: String, rect: CGRect) -> CGPoint {
        let indices = key.split(separator: ":").map {
            Int($0) ?? 0
        }
        
        let seriesIndex = indices.isEmpty ? 0 : indices[0]
        let categoryIndex = indices.count >= 2 ? indices[1] : 0
        
        let x = xPos(categoryIndex, rect: rect)
        
        var y: CGFloat = 0
        if model.chartType == .combo {
            let pd = chartContext.plotData(model)
            
            if !pd.isEmpty {
                y = (1.0 - pd[categoryIndex][seriesIndex].pos.y) * rect.size.height
            }
        } else {
            let secondarySeriesIndexes = model.indexesOfSecondaryValueAxis.sorted()
            let displayRange = ChartUtility.displayRange(model)
            let seconaryDisplayRange = ChartUtility.displayRange(model, secondary: true)
            let range = secondarySeriesIndexes.contains(seriesIndex) ? seconaryDisplayRange : displayRange

            if let value = ChartUtility.dimensionValue(model, seriesIndex: seriesIndex, categoryIndex: categoryIndex) {
                y = rect.size.height - (CGFloat(value) - range.lowerBound) * rect.size.height / (range.upperBound - range.lowerBound) + rect.origin.y
            }
        }
        
        return CGPoint(x: x, y: y)
    }
    
    func lineStrokeColor(_ key: String, stroke: Bool) -> Color {
        let seriesIndex = seriesIdFromKey(key)
        
        if model.chartType == .stock {
            var isPriceGoingUp = true
            if let startPrice = ChartUtility.dimensionValue(model, categoryIndex: 0), let endPrice = ChartUtility.dimensionValue(model, categoryIndex: ChartUtility.lastValidDimIndex(model)) {
                if startPrice > endPrice {
                    isPriceGoingUp = false
                }
            }
            
            var strokeColor = Color.primary
            if model.seriesAttributes.count > seriesIndex {
                let attr = model.seriesAttributes[seriesIndex]
                
                strokeColor = isPriceGoingUp ? attr.palette.colors[0] : attr.palette.colors[1]
            }
            
            if stroke {
                return strokeColor
            }
            
            return strokeColor.opacity(0.4)
        } else {
            var strokeColor = Color.primary
            if model.seriesAttributes.count > seriesIndex {
                let attr = model.seriesAttributes[seriesIndex]
                
                if stroke {
                    strokeColor = attr.palette.colors[0]
                }
                
                strokeColor = attr.palette.fillColor
            }
            
            return strokeColor
        }
    }
    
    func pointStrokeColor(_ key: String) -> Color {
        let seriesIndex = seriesIdFromKey(key)
        
        var strokeColor = Color.primary
        if model.seriesAttributes.count > seriesIndex {
            let point = model.seriesAttributes[seriesIndex].point
            strokeColor = point.strokeColor
        }
    
        if model.chartType == .stock {
            return lineStrokeColor(key, stroke: true)
        } else {
            return strokeColor
        }
    }
    
    func lineWidth(_ key: String) -> CGFloat {
        let seriesIndex = seriesIdFromKey(key)
        
        var width: CGFloat = 1
        
        if model.seriesAttributes.count > seriesIndex {
            width = model.seriesAttributes[seriesIndex].lineWidth
        }
        
        return width
    }
    
    func pointGap(_ key: String) -> CGFloat {
        let seriesIndex = seriesIdFromKey(key)
        
        var gap: CGFloat = 2
        if model.seriesAttributes.count > seriesIndex {
            gap = model.seriesAttributes[seriesIndex].point.gap
        }
        
        return gap
    }
    
    func pointRadius(_ key: String, show: Bool) -> CGFloat {
        let seriesIndex = seriesIdFromKey(key)
        
        var diameter: CGFloat = 7
        var pointIsHidden = false
        
        if model.seriesAttributes.count > seriesIndex {
            let point = model.seriesAttributes[seriesIndex].point
            pointIsHidden = point.isHidden
            diameter = point.diameter
        }
        
        if show {
            return pointIsHidden ? 0 : diameter/2.0
        } else {
            return diameter/2.0
        }
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
