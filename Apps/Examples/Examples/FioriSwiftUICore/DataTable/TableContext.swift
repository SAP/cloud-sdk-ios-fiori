import Foundation
import SwiftUI

protocol TableContext: AnyObject {
    func scaleX(_ model: TableModel, rect: CGRect) -> CGFloat
    
    func scaleY(_ model: TableModel, rect: CGRect) -> CGFloat
    
    func startPosition(_ model: TableModel, rect: CGRect) -> CGPoint
    
    func centerPosition(_ model: TableModel, rect: CGRect) -> CGPoint
    
    func dataItemsForRow(_ model: TableModel, at index: Int) -> [TableDataItem]
    
    func dataItemsForTable(_ model: TableModel) -> [[TableDataItem]]
    
    func dataItemsForTable(_ model: TableModel, rect: CGRect) -> [[TableDataItem]]
    
    func getPosForSeperationLines(_ model: TableModel, rect: CGRect) -> [(CGPoint, CGPoint)]
    
    func snapTableToPoint(_ model: TableModel, at x: CGFloat) -> CGFloat
    
    func heightForRowAt(_ model: TableModel, _ index: Int) -> CGFloat
    
    func columnWidth(_ model: TableModel) -> CGFloat
    
    func rowHeight(_ model: TableModel) -> CGFloat
    
    func readableScale(_ model: TableModel, rect: CGRect, _ isXAxis: Bool) -> CGFloat
    
    func actualSizeForTable(_ model: TableModel, _ rect: CGRect) -> CGSize
    
    func maxItemSize(_ items: [[TableDataItem]]) -> CGSize
    
    func getListItems(_ model: TableModel) -> [TableListItem]
}

class DefaultTableContext: TableContext {
    func getListItems(_ model: TableModel) -> [TableListItem] {
        let tableItems = self.dataItemsForTable(model)
        var items: [TableListItem] = []
        for (index, rowItems) in tableItems.enumerated() {
            let firstItem = rowItems.first
            var image: Image?
            switch firstItem?.value {
            case .image(let value):
                image = value
            default:
                image = nil
            }
            let titles: [String] = rowItems.compactMap { (item) -> String? in
                switch item.value {
                case .text(let value):
                    return value
                default:
                    return nil
                }
            }
            let combined = TableListItem(index: index, image: image, titles: Array(titles.prefix(3)))
            items.append(combined)
        }
        return items
    }

    func updatedItemsPos(_ model: TableModel) -> [[TableDataItem]] {
        let numberOfColumns = model.numberOfDataInRow()
        let numberOfRows = model.numberOfDataInColumn()
        let actualSize = model.actualTableViewSize
        
//        let isCompact = model.deviceMode == .iphonePortraitOrIpadSplit
//        let columnGap: CGFloat = isCompact ? TableViewLayout.columnGapInCompact : TableViewLayout.columnGapInRegualr

        var items = model.allDataItems
        
        for i in 0 ..< numberOfRows {
            for j in 0 ..< numberOfColumns {
                var item = items[i][j]
                let widthSoFar = model.columnWidths[0 ..< j].reduce(0, +)
//                let currentWidth = model.columnWidths[j] - columnGap
                let posX = widthSoFar / actualSize.width
                item.x(posX)
                item.y(item.pos.y)
                
                items[i][j] = item
            }
        }
        return items
    }
    
    func columnWidths(_ model: TableModel, _ rect: CGRect) -> [CGFloat] {
        guard model.columnWidths.isEmpty else {
            return model.columnWidths
        }
        
        let numberOfColumns = model.numberOfDataInRow()
        let numberOfRows = model.numberOfDataInColumn()
        var columnWidths: [CGFloat] = []
        for j in 0 ..< numberOfColumns {
            var maxItemWidth: CGFloat = .leastNonzeroMagnitude

            for i in 0 ..< numberOfRows {
                let currentItem = model.allDataItems[i][j]
                let currentItemWidth: CGFloat = self.widthForColumn(currentItem.size, model.deviceMode, rect)
                maxItemWidth = max(maxItemWidth, currentItemWidth)
            }
            columnWidths.append(maxItemWidth)
        }
        
        model.columnWidths = columnWidths
        return columnWidths
    }
    
    func widthForColumn(_ itemSize: CGSize, _ deviceMode: DeviceMode, _ rect: CGRect) -> CGFloat {
        let isCompact = deviceMode == .iphonePortraitOrIpadSplit
        
        let maxColumnWidth: CGFloat = rect.size.width * TableViewLayout.maxColumnWidth
        let minColumnWidth: CGFloat = rect.size.width * TableViewLayout.minColumnWidth
        
        let columnPaddings: CGFloat = isCompact ? TableViewLayout.leadingTrailingPaddingInCompact : TableViewLayout.leadingTrailingPaddingInRegular
        
        let idealItemWidth: CGFloat = itemSize.width + columnPaddings * 2
        
        let columnWidth: CGFloat = min(maxColumnWidth, max(minColumnWidth, idealItemWidth))
        
        return columnWidth
    }

    func maxItemSize(_ items: [[TableDataItem]]) -> CGSize {
        var width: CGFloat = .leastNonzeroMagnitude
        var height: CGFloat = .leastNonzeroMagnitude
        for i in 0 ..< items.count {
            for j in 0 ..< items[i].count {
                width = max(items[i][j].size.width, width)
                height = max(items[i][j].size.height, height)
            }
        }
        return CGSize(width: width, height: height)
    }
    
    func actualSizeForTable(_ model: TableModel, _ rect: CGRect) -> CGSize {
        guard model.actualTableViewSize == .zero else {
            return model.actualTableViewSize
        }
        
        let isCompact = model.deviceMode == .ipadRegular
        
        let numberOfColumns = model.numberOfDataInRow()
        let numberOfRows = model.numberOfDataInColumn()

        let columnHeight: CGFloat = model.maxItemSize.height + TableViewLayout.topAndBottomPaddings * 2
        
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        model.columnWidths = []
        
        for i in 0 ..< numberOfColumns {
            //            let columnWidth: CGFloat = min(maxColumnWidth, max(minColumnWidth, model.maxItemSize.width * model.weightForColumns[i])) + TableViewLayout.columnGapInCompact
            let columnWidth = self.columnWidths(model, rect)[i]
            model.columnWidths.append(columnWidth)
            width += columnWidth
        }
        
        let paddings = isCompact ? TableViewLayout.leadingMarginInCompact : TableViewLayout.leadingMarginInRegular
//        width += 44
        height = CGFloat(numberOfRows) * columnHeight
        
        model.displayingItemSize = CGSize(width: model.maxItemSize.width, height: columnHeight)
        model.actualTableViewSize = CGSize(width: width, height: height)
        
        return model.actualTableViewSize
    }
    
    func columnWidth(_ model: TableModel) -> CGFloat {
        let count = model.numberOfDataInRow()
        let unitWidth: CGFloat = max(1 / CGFloat(max(count - 1, 1)), TableViewLayout.minUnitWidth)
        
        return unitWidth
    }
    
    func rowHeight(_ model: TableModel) -> CGFloat {
        let count = model.numberOfDataInColumn()
        let unitHeight: CGFloat = max(1 / CGFloat(max(count - 1, 1)), TableViewLayout.minUnitHeight)
        
        return unitHeight
    }
    
    func heightForRowAt(_ model: TableModel, _ index: Int) -> CGFloat {
        let rows = model.allDataItems
        guard index >= 0, index + 1 < rows.count else {
            return self.heightForRowAt(model, index - 1)
        }
        guard let firstRowItem = rows[index].first, let secondRowItem = rows[index + 1].first else {
            return 0
        }
        
        let height = secondRowItem.pos.y - firstRowItem.pos.y
        return height
    }
    
    func getPosForSeperationLines(_ model: TableModel, rect: CGRect) -> [(CGPoint, CGPoint)] {
        let rows = model.displayingItems
        var res: [(CGPoint, CGPoint)] = []
        
        guard rows.count > 0 else {
            return res
        }
        
        for i in 0 ..< rows.count - 1 {
            if let firstRowItem = rows[i].first, let secondRowItem = rows[i + 1].first {
                let x: CGFloat = firstRowItem.pos.x - firstRowItem.size.width * 2
                let y = (firstRowItem.pos.y + secondRowItem.pos.y) / 2
                let firstPos = CGPoint(x: x, y: y)
                let secondPos = CGPoint(x: rect.maxX + firstRowItem.size.width, y: y)
                
                res.append((firstPos, secondPos))
            }
        }
        return res
    }
    
    func snapTableToPoint(_ model: TableModel, at x: CGFloat) -> CGFloat {
        let maxDataCount = model.numberOfDataInRow()
        let unitWidth: CGFloat = max(1 / CGFloat(max(maxDataCount - 1, 1)), TableViewLayout.minUnitWidth)
        let categoryIndex = Int(x / unitWidth + 0.5).clamp(low: 0, high: maxDataCount)
        let clusteredX = unitWidth * CGFloat(categoryIndex)

        return clusteredX
    }
    
    func initItems(_ model: TableModel) -> [[TableDataItem]] {
        var res: [[TableDataItem]] = []
        if model.allDataItems.isEmpty {
            res = self.dataItemsForTable(model)
            model.allDataItems = res
            if model.maxItemSize == .zero {
                model.maxItemSize = self.maxItemSize(res)
            }
            model.allDataItems = res
        } else {
            res = model.allDataItems
        }
        return res
    }
    
    func dataItemsForTable(_ model: TableModel, rect: CGRect) -> [[TableDataItem]] {
        var res = self.initItems(model)
        
//        if model.actualTableViewSize == .zero {
//            model.actualTableViewSize = self.actualSizeForTable(model, rect)
//        }
        model.actualTableViewSize = self.actualSizeForTable(model, rect)
        res = self.updatedItemsPos(model)
        
        let maxDataCountInRow = model.numberOfDataInRow()
        let width: CGFloat = rect.width
        
        let tmpScaleX = self.scaleX(model, rect: rect)
        let tmpStartPositionInRow = self.startPosition(model, rect: rect)
        let startPosX = tmpStartPositionInRow.x * tmpScaleX * width
        let unitWidth: CGFloat = max(width * tmpScaleX / CGFloat(max(maxDataCountInRow - 1, 1)), TableViewLayout.minUnitWidth)
        var startIndexInRow = Int(((startPosX - width) / unitWidth).rounded(.up)).clamp(low: 0, high: maxDataCountInRow - 1)
        let endIndexInRow = Int(((startPosX + width) / unitWidth).rounded(.up)).clamp(low: startIndexInRow, high: maxDataCountInRow - 1)
        if startIndexInRow != 0 {
            startIndexInRow -= 1
        }
        let catIndexRangeInRow = startIndexInRow ... endIndexInRow
        
        let maxDataCountInColumn = model.numberOfDataInColumn()
        let height = rect.height
        
        let tmpScaleY = self.scaleY(model, rect: rect)
        let tmpStartPositionInColumn = self.startPosition(model, rect: rect)
        let startPosY = tmpStartPositionInColumn.y * tmpScaleY * height
        let unitHeight: CGFloat = max(height * tmpScaleY / CGFloat(max(maxDataCountInColumn - 1, 1)), TableViewLayout.minUnitHeight)
        let startIndexInColumn = Int(((startPosY - height) / unitHeight).rounded(.up)).clamp(low: 0, high: maxDataCountInColumn - 1)
        let endIndexInColumn = Int(((startPosY + height) / unitHeight).rounded(.up)).clamp(low: startIndexInColumn, high: maxDataCountInColumn - 1)
        
        // get actual displaying data for rows
        let catIndexRangeInColumn = startIndexInColumn ... endIndexInColumn
        
        var result: [[TableDataItem]] = []
        
        let isCompact = model.deviceMode == .iphonePortraitOrIpadSplit
        let leadingMargin = isCompact ? TableViewLayout.leadingMarginInCompact : TableViewLayout.leadingMarginInRegular
        
        let columnGap = isCompact ? TableViewLayout.columnGapInCompact : TableViewLayout.columnGapInRegualr
        let columnPadding: CGFloat = isCompact ? TableViewLayout.leadingTrailingPaddingInCompact : TableViewLayout.leadingTrailingPaddingInRegular
        let firstColumnWidth: CGFloat = (model.columnWidths.first ?? 0) / 2 - columnPadding
        
        if catIndexRangeInRow.lowerBound >= 0, catIndexRangeInRow.upperBound < maxDataCountInRow,
           catIndexRangeInColumn.lowerBound >= 0, catIndexRangeInColumn.upperBound < maxDataCountInColumn
        {
            for i in catIndexRangeInColumn {
                result.append([])
                
                for j in catIndexRangeInRow {
                    let currentItem = res[i][j]
                    let contentWidth = model.columnWidths[j] - columnPadding * 2
                    
//                    var offsetX = (columnWidth - currentItem.size.width + TableViewLayout.columnGapInCompact) / 2
//                    offsetX *= (j == 0 ? -1 : 1)
                    
//                    let offsetX = currentItem.size.width / 2
                    
                    let x = currentItem.pos.x * tmpScaleX * width - startPosX + firstColumnWidth
                    let y = currentItem.pos.y * tmpScaleY * height - startPosY
                    
                    let itemWidth = contentWidth * tmpScaleX
                    let itemHeight = model.maxItemSize.height * tmpScaleY
//                    let itemHeight = model.displayingItemSize.height * tmpScaleY
                                        
                    if x > -itemWidth, x <= width + itemWidth,
                       y > -itemHeight, y <= height + itemHeight
                    {
                        var item = currentItem
                        
                        item.rowHeight(model.maxItemSize.height + TableViewLayout.topAndBottomPaddings * 2)
                        item.x(x)
                        item.y(y)
                        item.size(CGSize(width: contentWidth, height: model.maxItemSize.height))
                        item.offset(CGPoint(x: columnPadding + leadingMargin, y: 0))
                        
                        let lastIndex = result.count - 1
                        result[lastIndex].append(item)
                    }
                }
            }
        }
        
        result.removeAll(where: { $0.isEmpty })
        
        if model.isFirstRowSticky {
            var firstRow = res.first ?? []
            for i in 0 ..< firstRow.count {
                let contentWidth = model.columnWidths[i] - columnPadding * 2
                let x = firstRow[i].pos.x * tmpScaleX * width - startPosX + firstColumnWidth
                firstRow[i].x(x)
                firstRow[i].y(0)
                firstRow[i].offset(CGPoint(x: leadingMargin + columnPadding, y: 0))
                firstRow[i].size(CGSize(width: contentWidth, height: model.maxItemSize.height))
                firstRow[i].rowHeight(model.maxItemSize.height + TableViewLayout.topAndBottomPaddings * 2)
            }
            result.insert(firstRow, at: 0)
        }

        model.displayingItems = result
        
        return result
    }
    
    func dataItemsForTable(_ model: TableModel) -> [[TableDataItem]] {
        var res: [[TableDataItem]] = []
        let numberOfRows = model.numberOfDataInColumn()
        
        for i in 0 ..< numberOfRows {
            let items = self.dataItemsForRow(model, at: i)
            res.append(items)
        }

        return res
    }
    
//    func generateHeaderItem(_ model: TableModel) -> [TableDataItem] {
//        guard let headerTitles = model.headerData else {
//            return []
//        }
//        let numberInEachRow = model.numberOfDataInRow()
    ////        let numberOfDataInColumn = model.numberOfDataInColumn()
//
//        let width: CGFloat = 1
//        let unitWidth: CGFloat = max(width / CGFloat(max(numberInEachRow - 1, 1)), TableViewLayout.minUnitWidth)
//
    ////        let height: CGFloat = 1
    ////        let unitHeight: CGFloat = max(height / CGFloat(max(numberOfDataInColumn - 1, 1)), TableViewLayout.minUnitHeight)
//
//        var headerItems: [TableDataItem] = []
//
//        for (i, title) in headerTitles.enumerated() {
//            let size = title.boundingBoxSize(with: 14 * model.scaleX)
//            headerItems.append(TableDataItem(index: i,
//                                     value: .text(title),
//                                     pos: CGPoint(x: CGFloat(i) * unitWidth, y: 0),
//                                     size: size))
//        }
//
//        return headerItems
//    }
    
    func dataItemsForRow(_ model: TableModel, at index: Int) -> [TableDataItem] {
        let numberInEachRow = model.numberOfDataInRow()
        let numberOfDataInColumn = model.numberOfDataInColumn()
        
        let dataInEachRow = model.data?[index]
        
        let width: CGFloat = 1
        let unitWidth: CGFloat = max(width / CGFloat(max(numberInEachRow - 1, 1)), TableViewLayout.minUnitWidth)
        
        let height: CGFloat = 1
        let unitHeight: CGFloat = max(height / CGFloat(max(numberOfDataInColumn - 1, 1)), TableViewLayout.minUnitHeight)
        
        var res: [TableDataItem] = []
        for i in 0 ..< numberInEachRow {
            let currentItem = dataInEachRow?[i]
            switch currentItem?.type {
            case .text:
                let title = (currentItem as? DataTextItem)?.text ?? ""
                let size = title.boundingBoxSize(with: 17 * model.scaleX)
                res.append(TableDataItem(index: i,
                                         value: .text(title),
                                         pos: CGPoint(x: CGFloat(i) * unitWidth, y: CGFloat(index) * unitHeight),
                                         size: size))
            case .image:
                guard let image = (currentItem as? DataImageItem)?.image else {
                    break
                }
                res.append(TableDataItem(index: i,
                                         value: .image(image),
                                         pos: CGPoint(x: CGFloat(i) * unitWidth, y: CGFloat(index) * unitHeight),
                                         size: CGSize(width: 0, height: 0)))
            default:
                break
            }
        }
        
        return res
    }
    
    func scaleX(_ model: TableModel, rect: CGRect) -> CGFloat {
        let rs = self.readableScale(model, rect: rect, true)
        return rs
    }
    
    func scaleY(_ model: TableModel, rect: CGRect) -> CGFloat {
        let rs = self.readableScale(model, rect: rect, false)
        return rs
    }
    
    func readableScale(_ model: TableModel, rect: CGRect, _ isXAxis: Bool) -> CGFloat {
        let size = isXAxis ? rect.size.width : rect.size.height
        
        let scale: CGFloat = isXAxis ? model.scaleX : model.scaleY
        
        return (isXAxis ? model.actualTableViewSize.width / size : model.actualTableViewSize.height / size) * scale
    }
    
    func startPosition(_ model: TableModel, rect: CGRect) -> CGPoint {
        let pos = self.centerPosition(model, rect: rect)
        let tmpScaleX = self.scaleX(model, rect: rect)
        let tmpScaleY = self.scaleY(model, rect: rect)
        
        let x = min(1 - 0.5 / tmpScaleX, max(0, pos.x - 0.5 / tmpScaleX))
        let y = min(1 - 0.5 / tmpScaleY, max(0, pos.y - 0.5 / tmpScaleY))
        
        return CGPoint(x: x, y: y)
    }
    
    func centerPosition(_ model: TableModel, rect: CGRect) -> CGPoint {
        if let pos = model.centerPosition {
            // check if it is valid for different size of views
            let tmpScaleX = self.scaleX(model, rect: rect)
            let tmpScaleY = self.scaleY(model, rect: rect)
            
            let x = max(0.5 / tmpScaleX, min(1 - 0.5 / tmpScaleX, pos.x))
            let y = max(0.5 / tmpScaleY, min(1 - 0.5 / tmpScaleY, pos.y))
            
            return CGPoint(x: x, y: y)
        } else {
            let x = 0.5 / self.scaleX(model, rect: rect)
            let y = 0.5 / self.scaleY(model, rect: rect)
            return CGPoint(x: x, y: y)
        }
    }
}

extension String {
    func boundingBoxSize(with fontSize: CGFloat) -> CGSize {
        #if os(iOS) || os(tvOS) || os(watchOS)
            let font = UIFont.systemFont(ofSize: fontSize)
        #elseif os(macOS)
            let font = NSFont.systemFont(ofSize: fontSize)
        #endif
        
        let size = (self as NSString)
            .boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: CGFloat(MAXFLOAT)),
                          options: .usesLineFragmentOrigin,
                          attributes: [NSAttributedString.Key.font: font],
                          context: nil).size
        
        return size
    }
}

extension Comparable {
    func clamp(low: Self, high: Self) -> Self {
        if self > high {
            return high
        } else if self < low {
            return low
        }
        
        return self
    }
}
