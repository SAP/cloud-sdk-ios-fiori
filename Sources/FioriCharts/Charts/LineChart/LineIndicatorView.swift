import FioriThemeManager
import SwiftUI

/*
 Line, Stock and Combo chart use this to show selection UI
 */
struct LineIndicatorView: View {
    @EnvironmentObject var model: ChartModel
    @Environment(\.chartContext) var chartContext
    @Environment(\.layoutDirection) var layoutDirection
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let (lineIndicators, pointIndicators, rangeIndicator) = self.convertSelectionsToDisplayItems()
    
        return ZStack {
            // range indicators
            ForEach(0 ..< rangeIndicator.count, id: \.self) { index in
                LineRangeIndicatorView(seriesIndex: self.seriesIdFromKey(rangeIndicator[index]),
                                       startIndex: self.lowerBoundFromKey(rangeIndicator[index]),
                                       endIndex: self.upperBoundFromKey(rangeIndicator[index]),
                                       displayRange: self.displayRange(rangeIndicator[index]),
                                       lineWidth: self.lineWidth(rangeIndicator[index]),
                                       pointRadius: self.pointRadius(rangeIndicator[index], show: true),
                                       pointGap: self.pointGap(rangeIndicator[index]),
                                       lineFillColor: self.lineStrokeColor(rangeIndicator[index], stroke: false),
                                       lineStrokeColor: self.lineStrokeColor(rangeIndicator[index], stroke: true),
                                       pointStrokeColor: self.pointStrokeColor(rangeIndicator[index]),
                                       size: rect.size)
                    .frame(width: rect.size.width, height: rect.size.height)
            }.clipped()
            
            // Single line indicator
            ForEach(0 ..< lineIndicators.count, id: \.self) { index in
                LineLineIndicatorView(height: rect.size.height)
                    .frame(width: 9, height: rect.size.height)
                    .position(x: self.xPos(lineIndicators[index], rect: rect), y: rect.size.height / 2)
            }
            .clipShape(Rectangle()
                .size(width: rect.size.width + 9,
                      height: rect.size.height + 9)
                .offset(x: -4.5, y: -4.5))
            
            // point indicator
            ForEach(0 ..< pointIndicators.count, id: \.self) { index in
                LinePointIndicatorView(pointRadius: self.pointRadius(pointIndicators[index], show: true, selection: true),
                                       strokeColr: self.pointStrokeColor(pointIndicators[index]))
                    .position(self.pos(from: pointIndicators[index], rect: rect))
            }.clipShape(Rectangle()
                .size(width: rect.size.width + self.extraWidth(),
                      height: rect.size.height + self.extraWidth())
                .offset(x: -1 * self.extraWidth() / 2,
                        y: -1 * self.extraWidth() / 2))
        }
    }
    
    func extraWidth() -> CGFloat {
        var diameter = CGFloat(7)
        
        for seriesAttribute in self.model.seriesAttributes {
            diameter = max(diameter, seriesAttribute.point.diameter)
        }
        
        let extraSelectedPointAndBorderDiameter = (ChartViewLayout.extraSelectedPointRadiusWidth + ChartViewLayout.extraSelectedPointWhiteBoderRadiusWidth) * 2
        
        return diameter + extraSelectedPointAndBorderDiameter
    }
    
    /*
     selections = [0: [0, 1, 2, 7, 8, 10], 1: [3, 4, 5, 7, 9]]
     step 1:
     rangeSelections = [0: [ClosedRange(0...2), ClosedRange(7...8)], 1: [ClosedRange(3...5)]]
     singleSelections = [0: [10], 1: [7, 9]]
     
     step 2:
     singleLineIndicators = [0, 2, 3, 5, 7, 8, 9, 10],
     singlePointIndicators = ["0:0", "0:10", "0:2", "0:7", "0:8", "1:3", "1:5", "1:7", "1:9"],
     rangeIndicators = ["0:0:2", "0:7:8", "1:3:5"]
     */
    // swiftlint:disable cyclomatic_complexity
    func convertSelectionsToDisplayItems() -> ([Int], [String], [String]) {
        guard let selections = lineSelections(model) else {
            return ([], [], [])
        }

        var rangeSelections: [Int: [ClosedRange<Int>]] = [:]
        var singleSelections: [Int: [Int]] = [:]
        
        for (seriesId, catIds) in selections {
            var array1 = [ClosedRange<Int>]()
            var array2 = [Int]()
            
            // scan it
            var prevId = -1
            var startId = -1
            for catId in catIds {
                if prevId == -1 {
                    prevId = catId
                    startId = catId
                } else {
                    if catId == prevId + 1 {
                        prevId = catId
                    } else {
                        if prevId > startId {
                            array1.append(startId ... prevId)
                        } else {
                            array2.append(prevId)
                        }
                        
                        // start new search
                        prevId = catId
                        startId = catId
                    }
                }
            }
            
            if prevId != -1 {
                if prevId > startId {
                    array1.append(startId ... prevId)
                } else {
                    array2.append(prevId)
                }
            }
            
            if !array1.isEmpty {
                rangeSelections[seriesId] = array1
            }
            
            if !array2.isEmpty {
                singleSelections[seriesId] = array2
            }
        }

        if rangeSelections.isEmpty, singleSelections.isEmpty {
            return ([], [], [])
        }
        
        var singleLineIndicators = Set<Int>()
        var singlePointIndicators = [String]()
        var rangeIndicators = [String]()

        for (seriesId, crs) in rangeSelections {
            for cr in crs {
                singleLineIndicators.insert(cr.lowerBound)
                singleLineIndicators.insert(cr.upperBound)
                
                let key1 = String("\(seriesId):\(cr.lowerBound)")
                let key2 = String("\(seriesId):\(cr.upperBound)")
                singlePointIndicators.append(key1)
                singlePointIndicators.append(key2)

                let key = String("\(seriesId):\(cr.lowerBound):\(cr.upperBound)")
                rangeIndicators.append(key)
            }
        }

        for (seriesId, catIds) in singleSelections {
            singleLineIndicators.formUnion(catIds)
            
            for categoryId in catIds {
                let key = String("\(seriesId):\(categoryId)")
                singlePointIndicators.append(key)
            }
        }

        return (singleLineIndicators.sorted(), singlePointIndicators.sorted(), rangeIndicators.sorted())
    }

    // swiftlint:enable cyclomatic_complexity
    
    func lineSelections(_ model: ChartModel) -> [Int: [Int]]? {
        let lineSelections: [Int: [Int]]?
        
        if model.chartType == .combo {
            var tmpLineSelections = [Int: [Int]]()
            let allIndexs = IndexSet(integersIn: 0 ..< model.numOfSeries())
            let lineIndexes = model.indexesOfColumnSeries.symmetricDifference(allIndexs)
            
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
        
        return lineSelections
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
        if self.model.chartType == .stock {
            return ChartUtility.displayRange(self.model)
        } else {
            let seriesIndex = self.seriesIdFromKey(key)
            let secondarySeriesIndexes = self.model.indexesOfSecondaryValueAxis.sorted()
            if secondarySeriesIndexes.contains(seriesIndex) {
                return ChartUtility.displayRange(self.model, secondary: true)
            } else {
                return ChartUtility.displayRange(self.model)
            }
        }
    }
    
    func rangeSelectionWidth(_ key: String, rect: CGRect) -> CGFloat {
        let indices = key.split(separator: ":").map {
            Int($0) ?? 0
        }
        
        let low = indices.count >= 2 ? indices[1] : 0
        let upper = indices.count >= 3 ? indices[2] : 0
        
        return self.xPos(upper, rect: rect) - self.xPos(low, rect: rect)
    }
    
    func rangeSelectionPosition(_ key: String, rect: CGRect) -> CGFloat {
        let indices = key.split(separator: ":").map {
            Int($0) ?? 0
        }
        
        let low = indices.count >= 2 ? indices[1] : 0
        let upper = indices.count >= 3 ? indices[2] : 0
        
        return (self.xPos(upper, rect: rect) + self.xPos(low, rect: rect)) / 2
    }
    
    func xPos(_ categoryIndex: Int, rect: CGRect) -> CGFloat {
        let tmpScaleX = self.chartContext.scaleX(self.model, plotViewSize: rect.size)
        let tmpStartPosition = self.chartContext.startPosition(self.model, plotViewSize: rect.size)
        let startPosX = tmpStartPosition.x * tmpScaleX * rect.size.width

        if self.model.chartType == .combo {
            let pd = self.chartContext.plotData(self.model)
            let allIndexs = IndexSet(integersIn: 0 ..< self.model.numOfSeries())
            let lineIndexes = self.model.indexesOfColumnSeries.symmetricDifference(allIndexs).sorted()
            let seriesIndex = lineIndexes.isEmpty ? 0 : lineIndexes[0]
            
            if pd.isEmpty {
                return 0
            } else {
                return pd[categoryIndex][seriesIndex].pos.x * tmpScaleX * rect.size.width - startPosX
            }
        } else {
            let count = self.model.numOfCategories()
            let unitWidth: CGFloat = max(rect.size.width * tmpScaleX / CGFloat(max(count - 1, 1)), ChartViewLayout.minUnitWidth)
            
            return CGFloat(categoryIndex) * unitWidth - startPosX
        }
    }
    
    func pos(from key: String, rect: CGRect) -> CGPoint {
        let indices = key.split(separator: ":").map {
            Int($0) ?? 0
        }
        
        let seriesIndex = indices.isEmpty ? 0 : indices[0]
        let categoryIndex = indices.count >= 2 ? indices[1] : 0
        
        return self.pos(from: seriesIndex, categoryIndex: categoryIndex, rect: rect)
    }
    
    func pos(from seriesIndex: Int, categoryIndex: Int, rect: CGRect) -> CGPoint {
        let x = self.xPos(categoryIndex, rect: rect)
        
        let tmpScaleY = self.chartContext.scaleY(self.model, plotViewSize: rect.size)
        let tmpStartPosition = self.chartContext.startPosition(self.model, plotViewSize: rect.size)
        let startPosY = tmpStartPosition.y * tmpScaleY * rect.size.height
        
        var y: CGFloat = 0
        if self.model.chartType == .combo {
            let pd = self.chartContext.plotData(self.model)
            
            if !pd.isEmpty {
                y = (1.0 - pd[categoryIndex][seriesIndex].pos.y) * tmpScaleY * rect.size.height - startPosY
            }
        } else {
            let secondary = self.model.indexesOfSecondaryValueAxis.contains(seriesIndex)
            let displayRange = ChartUtility.displayRange(self.model, secondary: secondary)
            
            let range: CGFloat = abs(displayRange.upperBound - displayRange.lowerBound) <= 0.000001 ? 1 : displayRange.upperBound - displayRange.lowerBound
            
            if let value = ChartUtility.dimensionValue(model, seriesIndex: seriesIndex, categoryIndex: categoryIndex) {
                y = (1 - (value - displayRange.lowerBound) / range) * tmpScaleY * rect.size.height - startPosY
            }
        }
        
        return CGPoint(x: x, y: y)
    }
    
    func lineStrokeColor(_ key: String, stroke: Bool) -> Color {
        let seriesIndex = self.seriesIdFromKey(key)
        
        return self.lineStrokeColor(seriesIndex, stroke: stroke)
    }
    
    func lineStrokeColor(_ seriesIndex: Int, stroke: Bool) -> Color {
        if self.model.chartType == .stock {
            var isPriceGoingUp = true
            if let startPrice = ChartUtility.dimensionValue(model, categoryIndex: 0), let endPrice = ChartUtility.dimensionValue(model, categoryIndex: ChartUtility.lastValidDimIndex(model)) {
                if startPrice > endPrice {
                    isPriceGoingUp = false
                }
            }
            
            var strokeColor = Color.primary
            if self.model.seriesAttributes.count > seriesIndex {
                let attr = self.model.seriesAttributes[seriesIndex]
                
                strokeColor = isPriceGoingUp ? attr.palette.colors[0] : attr.palette.colors[1]
            }
            
            if stroke {
                return strokeColor
            }
            
            return strokeColor.opacity(0.4)
        } else {
            var strokeColor = Color.primary
            if self.model.seriesAttributes.count > seriesIndex {
                let attr = self.model.seriesAttributes[seriesIndex]
                
                if stroke {
                    strokeColor = attr.palette.colors[0]
                }
                
                strokeColor = attr.palette.fillColor
            }
            
            return strokeColor
        }
    }
    
    func pointStrokeColor(_ key: String) -> Color {
        let seriesIndex = self.seriesIdFromKey(key)
        
        return self.pointStrokeColor(seriesIndex)
    }
    
    func pointStrokeColor(_ seriesIndex: Int) -> Color {
        var strokeColor = Color.primary
        if self.model.seriesAttributes.count > seriesIndex {
            let point = self.model.seriesAttributes[seriesIndex].point
            strokeColor = point.strokeColor
        }
    
        if self.model.chartType == .stock {
            return self.lineStrokeColor(seriesIndex, stroke: true)
        } else {
            return strokeColor
        }
    }
    
    func lineWidth(_ key: String) -> CGFloat {
        let seriesIndex = self.seriesIdFromKey(key)
        
        var width: CGFloat = 1
        
        if self.model.seriesAttributes.count > seriesIndex {
            width = self.model.seriesAttributes[seriesIndex].lineWidth
        }
        
        return width
    }
    
    func pointGap(_ key: String) -> CGFloat {
        let seriesIndex = self.seriesIdFromKey(key)
        
        var gap: CGFloat = 2
        if self.model.seriesAttributes.count > seriesIndex {
            gap = self.model.seriesAttributes[seriesIndex].point.gap
        }
        
        return gap
    }
    
    func pointRadius(_ key: String, show: Bool, selection: Bool = false) -> CGFloat {
        let seriesIndex = self.seriesIdFromKey(key)
        
        return self.pointRadius(seriesIndex, show: show, selection: selection)
    }
    
    func pointRadius(_ seriesIndex: Int, show: Bool, selection: Bool = false) -> CGFloat {
        var diameter: CGFloat = 7
        var pointIsHidden = false
        
        if self.model.seriesAttributes.count > seriesIndex {
            let point = self.model.seriesAttributes[seriesIndex].point
            pointIsHidden = point.isHidden
            if selection {
                pointIsHidden = false
            }
            
            diameter = point.diameter
        }
        
        if show {
            return pointIsHidden ? 0 : max(3.5, diameter / 2.0)
        } else {
            return diameter / 2.0
        }
    }
}

struct LineIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        LineIndicatorView()
            .environmentObject(Tests.lineModels[0])
            .environment(\.chartContext, DefaultChartContext())
            .frame(width: 300, height: 200, alignment: .topLeading)
            .padding(32)
            .previewLayout(.sizeThatFits)
    }
}
