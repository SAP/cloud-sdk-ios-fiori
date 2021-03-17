// import Foundation
// import SwiftUI
//
// protocol TableContext: AnyObject {
//    func scaleX(_ model: TableModel, rect: CGRect) -> CGFloat
//
//    func scaleY(_ model: TableModel, rect: CGRect) -> CGFloat
//
//    func startPosition(_ model: TableModel, rect: CGRect) -> CGPoint
//
//    func centerPosition(_ model: TableModel, rect: CGRect) -> CGPoint
//
//    func dataItemsForRow(_ model: TableModel, at index: Int) -> [TableDataItem]
//
//    func dataItemsForTable(_ model: TableModel) -> [[TableDataItem]]
//
//    func dataItemsForTable(_ model: TableModel, rect: CGRect) -> [[TableDataItem]]
//
//    func snapTableToPoint(_ model: TableModel, at x: CGFloat) -> CGFloat
//
//    func heightForRowAt(_ model: TableModel, _ index: Int) -> CGFloat
//
//    func columnWidth(_ model: TableModel) -> CGFloat
//
//    func rowHeight(_ model: TableModel) -> CGFloat
//
//    func readableScale(_ model: TableModel, rect: CGRect, _ isXAxis: Bool) -> CGFloat
//
//    func actualSizeForTable(_ model: TableModel, _ rect: CGRect) -> CGSize
//
//    func maxItemSize(_ items: [[TableDataItem]]) -> CGSize
//
//    func getListItems(_ model: TableModel) -> [TableListItem]
//
////    func leftAccessoryViewForRow(_ model: TableModel, at index: Int) -> String
// }
//
// class DefaultTableContext: TableContext {
//    func getListItems(_ model: TableModel) -> [TableListItem] {
//        let tableItems = self.dataItemsForTable(model)
//        var items: [TableListItem] = []
//        for (index, rowItems) in tableItems.enumerated() {
//            let firstItem = rowItems.first
//            var image: Image?
//            switch firstItem?.value {
//            case .image(let value):
//                image = value
//            default:
//                image = nil
//            }
//            let titles: [String] = rowItems.compactMap { (item) -> String? in
//                switch item.value {
//                case .text(let value):
//                    return value
//                default:
//                    return nil
//                }
//            }
//            let combined = TableListItem(index: index, image: image, titles: Array(titles.prefix(3)))
//            items.append(combined)
//        }
//        return items
//    }
//
//    func updatedItemsPos(_ model: TableModel) -> [[TableDataItem]] {
//        let numberOfColumns = model.numberOfDataInRow()
//        let numberOfRows = model.numberOfDataInColumn()
//        let actualSize = model.actualTableViewSize
//
////        let isCompact = model.deviceMode == .iphonePortraitOrIpadSplit
////        let columnGap: CGFloat = isCompact ? TableViewLayout.columnGapInCompact : TableViewLayout.columnGapInRegualr
//
//        var items = model.allDataItems
//
//        for i in 0 ..< numberOfRows {
//
//            let heightSoFar = model.rowHeights[0 ..< i].reduce(0, +)
//            let posY = heightSoFar / actualSize.height
//
//            for j in 0 ..< numberOfColumns {
//                var item = items[i][j]
//                let widthSoFar = model.columnWidths[0 ..< j].reduce(0, +)
////                let currentWidth = model.columnWidths[j] - columnGap
//                let posX = widthSoFar / actualSize.width
//                item.x(posX)
//                item.y(posY)
//                items[i][j] = item
//            }
//        }
//        return items
//    }
//
//    func columnWidths(_ model: TableModel, _ rect: CGRect) -> [CGFloat] {
//        guard model.columnWidths.isEmpty else {
//            return model.columnWidths
//        }
//
//        let numberOfColumns = model.numberOfDataInRow()
//        let numberOfRows = model.numberOfDataInColumn()
//        var columnWidths: [CGFloat] = []
//        for j in 0 ..< numberOfColumns {
//            var maxItemWidth: CGFloat = .leastNonzeroMagnitude
//
//            for i in 0 ..< numberOfRows {
//                let currentItem = model.allDataItems[i][j]
//                let currentItemWidth: CGFloat = self.widthForColumn(currentItem.size, model.deviceMode, rect)
//                maxItemWidth = max(maxItemWidth, currentItemWidth)
//            }
//            columnWidths.append(maxItemWidth)
//        }
//
//        model.columnWidths = columnWidths
//        return columnWidths
//    }
//
//    func widthForColumn(_ itemSize: CGSize, _ deviceMode: DeviceMode, _ rect: CGRect) -> CGFloat {
//        let isCompact = deviceMode == .iphonePortraitOrIpadSplit
//
//        let maxColumnWidth: CGFloat = rect.size.width * TableViewLayout.maxColumnWidth
//        let minColumnWidth: CGFloat = rect.size.width * TableViewLayout.minColumnWidth
//
//        let columnPaddings: CGFloat = isCompact ? TableViewLayout.leadingTrailingPaddingInCompact : TableViewLayout.leadingTrailingPaddingInRegular
//
//        let idealItemWidth: CGFloat = itemSize.width + columnPaddings * 2
//
//        let columnWidth: CGFloat = min(maxColumnWidth, max(minColumnWidth, idealItemWidth))
//
//        return columnWidth
//    }
//
//    func maxItemSize(_ items: [[TableDataItem]]) -> CGSize {
//        var width: CGFloat = .leastNonzeroMagnitude
//        var height: CGFloat = .leastNonzeroMagnitude
//        for i in 0 ..< items.count {
//            for j in 0 ..< items[i].count {
//                width = max(items[i][j].size.width, width)
//                height = max(items[i][j].size.height, height)
//            }
//        }
//        return CGSize(width: width, height: height)
//    }
//
//    func getLeftAccessoryViewWidth() -> CGFloat {
//        return TableViewLayout.accessoryViewLeftPaddingInCompact + 44 + 4 + 20
//    }
//
//    func actualSizeForTable(_ model: TableModel, _ rect: CGRect) -> CGSize {
//        guard model.actualTableViewSize == .zero else {
//            return model.actualTableViewSize
//        }
//
//        let isCompact = model.deviceMode == .ipadRegular
//
//        let numberOfColumns = model.numberOfDataInRow()
//        let numberOfRows = model.numberOfDataInColumn()
//
//        let columnHeight: CGFloat = model.maxItemSize.height + TableViewLayout.topAndBottomPaddings * 2
//
//        var width: CGFloat = 0
//        var height: CGFloat = 0
//
//        model.columnWidths = []
//        model.rowHeights = []
//
//        for i in 0 ..< numberOfColumns {
//            let columnWidth = self.columnWidths(model, rect)[i]
//            model.columnWidths.append(columnWidth)
//            width += columnWidth
//        }
//
//        for j in 0 ..< numberOfRows {
//            let isHeader = !model.headerData.isEmpty && j == 0
//            let topAndBottom = isHeader ? TableViewLayout.topAndBottomPaddingsForHeader : TableViewLayout.topAndBottomPaddings
//            let _height = heightForRowAt(model, j) + topAndBottom * 2
//            model.rowHeights.append(_height)
//            height += _height
//        }
//
//        let paddings = isCompact ? TableViewLayout.leadingMarginInCompact : TableViewLayout.leadingMarginInRegular
////        width += 44
////        height = CGFloat(numberOfRows) * columnHeight
//
////        model.displayingItemSize = CGSize(width: model.maxItemSize.width, height: columnHeight)
//        model.actualTableViewSize = CGSize(width: width + getLeftAccessoryViewWidth(), height: height)
//
//        return model.actualTableViewSize
//    }
//
//    func columnWidth(_ model: TableModel) -> CGFloat {
//        let count = model.numberOfDataInRow()
//        let unitWidth: CGFloat = max(1 / CGFloat(max(count - 1, 1)), TableViewLayout.minUnitWidth)
//
//        return unitWidth
//    }
//
//    func rowHeight(_ model: TableModel) -> CGFloat {
//        let count = model.numberOfDataInColumn()
//        let unitHeight: CGFloat = max(1 / CGFloat(max(count - 1, 1)), TableViewLayout.minUnitHeight)
//
//        return unitHeight
//    }
//
//    func heightForRowAt(_ model: TableModel, _ index: Int) -> CGFloat {
//        let row = model.allDataItems[index]
//        var height: CGFloat = .leastNonzeroMagnitude
//        for item in row {
//            height = max(height, item.size.height)
//        }
//        return height
//    }
//
//    func snapTableToPoint(_ model: TableModel, at x: CGFloat) -> CGFloat {
//        let maxDataCount = model.numberOfDataInRow()
//        let unitWidth: CGFloat = max(1 / CGFloat(max(maxDataCount - 1, 1)), TableViewLayout.minUnitWidth)
//        let categoryIndex = Int(x / unitWidth + 0.5).clamp(low: 0, high: maxDataCount)
//        let clusteredX = unitWidth * CGFloat(categoryIndex)
//
//        return clusteredX
//    }
//
//    func initItems(_ model: TableModel) -> [[TableDataItem]] {
//        var res: [[TableDataItem]] = []
//        if model.allDataItems.isEmpty {
//            res = self.dataItemsForTable(model)
//            model.allDataItems = res
//            if model.maxItemSize == .zero {
//                model.maxItemSize = self.maxItemSize(res)
//            }
//            model.allDataItems = res
//        } else {
//            res = model.allDataItems
//        }
//        return res
//    }
//
//    func dataItemsForTable(_ model: TableModel, rect: CGRect) -> [[TableDataItem]] {
//        var res = self.initItems(model)
//
////        if model.actualTableViewSize == .zero {
////            model.actualTableViewSize = self.actualSizeForTable(model, rect)
////        }
//        model.actualTableViewSize = self.actualSizeForTable(model, rect)
//        res = self.updatedItemsPos(model)
//
//        let maxDataCountInRow = model.numberOfDataInRow()
//        let width: CGFloat = rect.width
//
//        let tmpScaleX = self.scaleX(model, rect: rect)
//        let tmpStartPositionInRow = self.startPosition(model, rect: rect)
//        let startPosX = tmpStartPositionInRow.x * tmpScaleX * width
//        let unitWidth: CGFloat = max(width * tmpScaleX / CGFloat(max(maxDataCountInRow - 1, 1)), TableViewLayout.minUnitWidth)
//        var startIndexInRow = Int(((startPosX) / unitWidth).rounded(.up)).clamp(low: 0, high: maxDataCountInRow - 1)
//        let endIndexInRow = Int(((startPosX + width) / unitWidth).rounded(.up)).clamp(low: startIndexInRow, high: maxDataCountInRow - 1)
//        if startIndexInRow != 0 {
//            startIndexInRow -= 1
//        }
//        let catIndexRangeInRow = startIndexInRow ... endIndexInRow
//
//        let maxDataCountInColumn = model.numberOfDataInColumn()
//        let height = rect.height
//
//        let tmpScaleY = self.scaleY(model, rect: rect)
//        let tmpStartPositionInColumn = self.startPosition(model, rect: rect)
//        let startPosY = tmpStartPositionInColumn.y * tmpScaleY * height
//        let unitHeight: CGFloat = max(height * tmpScaleY / CGFloat(max(maxDataCountInColumn - 1, 1)), TableViewLayout.minUnitHeight)
//        let startIndexInColumn = Int(((startPosY - unitHeight) / unitHeight).rounded(.up)).clamp(low: 0, high: maxDataCountInColumn - 1)
//        let endIndexInColumn = Int(((startPosY + height) / unitHeight).rounded(.up)).clamp(low: startIndexInColumn, high: maxDataCountInColumn - 1)
//
//        // get actual displaying data for rows
//        let catIndexRangeInColumn = startIndexInColumn ... endIndexInColumn
//
//        var result: [[TableDataItem]] = []
//
//        let isCompact = model.deviceMode == .iphonePortraitOrIpadSplit
//        let leadingMargin = isCompact ? TableViewLayout.leadingMarginInCompact : TableViewLayout.leadingMarginInRegular
//
////        let columnGap = isCompact ? TableViewLayout.columnGapInCompact : TableViewLayout.columnGapInRegualr
//        let columnPadding: CGFloat = isCompact ? TableViewLayout.leadingTrailingPaddingInCompact : TableViewLayout.leadingTrailingPaddingInRegular
//        let firstColumnWidth: CGFloat = (model.columnWidths.first ?? 0) / 2 - columnPadding
//
//        if model.isFirstRowSticky {
//            var firstRow = res.first ?? []
//            for i in 0 ..< firstRow.count {
//                let contentWidth = model.columnWidths[i] - columnPadding * 2
//                let x = firstRow[i].pos.x * tmpScaleX * width - startPosX + firstColumnWidth
//                firstRow[i].x(x)
//                firstRow[i].y((model.rowHeights.first ?? 0 ) / 2)
//                firstRow[i].offset(CGPoint(x: getLeftAccessoryViewWidth(), y: 0))
//                firstRow[i].size(CGSize(width: contentWidth, height: firstRow[i].size.height))
//                firstRow[i].rowHeight(model.rowHeights.first ?? 0)
//            }
//            result.insert(firstRow, at: 0)
//        }
//
//        if catIndexRangeInRow.lowerBound >= 0, catIndexRangeInRow.upperBound < maxDataCountInRow,
//           catIndexRangeInColumn.lowerBound >= 0, catIndexRangeInColumn.upperBound < maxDataCountInColumn
//        {
//            for i in catIndexRangeInColumn {
//                result.append([])
//
//                let firstRowHeight = (model.rowHeights.first ?? 44 ) / 2
//                let topPadding = i == 0 ? firstRowHeight : firstRowHeight + TableViewLayout.topAndBottomPaddings - TableViewLayout.topAndBottomPaddingsForHeader
//
//                let rowHeight = model.rowHeights[i]
//
//                for j in catIndexRangeInRow {
//                    let currentItem = res[i][j]
//                    let contentWidth = model.columnWidths[j] - columnPadding * 2
//
//                    let initX = (model.isFirstColumnSticky && j == 0) ? 0 : currentItem.pos.x
//
//                    let x = currentItem.pos.x * tmpScaleX * width - startPosX + firstColumnWidth
//                    let y = currentItem.pos.y * tmpScaleY * height - startPosY + topPadding
//
//                    let itemWidth = contentWidth * tmpScaleX
//                    let itemHeight = rowHeight * tmpScaleY
//
//                    if x > -itemWidth, x <= width + itemWidth,
//                       y > -itemHeight, y <= height + itemHeight
//                    {
//                        var item = currentItem
//
//                        item.rowHeight(rowHeight)
//                        item.x(x)
//                        item.y(y)
////                        item.size(CGSize(width: model.columnWidths[j], height: model.rowHeights[i]))
//                        item.size(CGSize(width: contentWidth, height: item.size.height))
//                        item.offset(CGPoint(x: getLeftAccessoryViewWidth(), y: 0))
//
//                        let lastIndex = result.count - 1
//                        result[lastIndex].append(item)
//                    }
//                }
//
//                if model.isFirstColumnSticky {
//                    var item = res[i][0]
//                    let contentWidth = model.columnWidths[0] - columnPadding * 2
//                    let x = firstColumnWidth
//                    let y = item.pos.y * tmpScaleY * height - startPosY + topPadding
//                    item.rowHeight(rowHeight)
//                    item.x(x)
//                    item.y(y)
////                        item.size(CGSize(width: model.columnWidths[j], height: model.rowHeights[i]))
//                    item.size(CGSize(width: contentWidth, height: item.size.height))
//                    item.offset(CGPoint(x: getLeftAccessoryViewWidth(), y: 0))
//
//                    let lastIndex = result.count - 1
//                    result[lastIndex].insert(item, at: 0)
//                }
//            }
//        }
//
//        result.removeAll(where: { $0.isEmpty })
//        model.displayingItems = result
//
//        return result
//    }
//
//    func dataItemsForTable(_ model: TableModel) -> [[TableDataItem]] {
//        var res: [[TableDataItem]] = []
//        let numberOfRows = model.numberOfDataInColumn()
//
//        for i in 0 ..< numberOfRows {
//            let items = self.dataItemsForRow(model, at: i)
//            res.append(items)
//        }
//
//        return res
//    }
//
//    func dataItemsForRow(_ model: TableModel, at index: Int) -> [TableDataItem] {
//        let numberInEachRow = model.numberOfDataInRow()
//        let numberOfDataInColumn = model.numberOfDataInColumn()
//
//        let dataInEachRow = model.rowData[index].data
//
//        let width: CGFloat = 1
//        let unitWidth: CGFloat = max(width / CGFloat(max(numberInEachRow - 1, 1)), TableViewLayout.minUnitWidth)
//
//        let height: CGFloat = 1
//        let unitHeight: CGFloat = max(height / CGFloat(max(numberOfDataInColumn - 1, 1)), TableViewLayout.minUnitHeight)
//
//        var res: [TableDataItem] = []
//        for i in 0 ..< numberInEachRow {
//            let currentItem = dataInEachRow[i]
//            switch currentItem.type {
//            case .text:
//                let title = (currentItem as? DataTextItem)?.text ?? ""
//                let font = (currentItem as? DataTextItem)?.font ?? .body
//                let fontSize = UIFont.preferredFont(from: font).pointSize
//                let size = title.boundingBoxSize(with: fontSize * model.scaleX)
//                res.append(TableDataItem(index: index,
//                                         value: .text(title),
//                                         pos: CGPoint(x: CGFloat(i) * unitWidth, y: CGFloat(index) * unitHeight),
//                                         size: size))
//            case .image:
//                guard let image = (currentItem as? DataImageItem)?.image else {
//                    break
//                }
//                res.append(TableDataItem(index: index,
//                                         value: .image(image),
//                                         pos: CGPoint(x: CGFloat(i) * unitWidth, y: CGFloat(index) * unitHeight),
//                                         size: CGSize(width: 0, height: 0)))
//            default:
//                break
//            }
//        }
//
//        return res
//    }
//
//    func scaleX(_ model: TableModel, rect: CGRect) -> CGFloat {
//        let rs = self.readableScale(model, rect: rect, true)
//        return rs
//    }
//
//    func scaleY(_ model: TableModel, rect: CGRect) -> CGFloat {
//        let rs = self.readableScale(model, rect: rect, false)
//        return rs
//    }
//
//    func readableScale(_ model: TableModel, rect: CGRect, _ isXAxis: Bool) -> CGFloat {
//        let size = isXAxis ? rect.size.width : rect.size.height
//
//        let scale: CGFloat = isXAxis ? model.scaleX : model.scaleY
//
//        return (isXAxis ? model.actualTableViewSize.width / size : model.actualTableViewSize.height / size) * scale
//    }
//
//    func startPosition(_ model: TableModel, rect: CGRect) -> CGPoint {
//        let pos = self.centerPosition(model, rect: rect)
//        let tmpScaleX = self.scaleX(model, rect: rect)
//        let tmpScaleY = self.scaleY(model, rect: rect)
//
//        let x = min(1 - 0.5 / tmpScaleX, max(0, pos.x - 0.5 / tmpScaleX))
//        let y = min(1 - 0.5 / tmpScaleY, max(0, pos.y - 0.5 / tmpScaleY))
//
//        return CGPoint(x: x, y: y)
//    }
//
//    func centerPosition(_ model: TableModel, rect: CGRect) -> CGPoint {
//        if let pos = model.centerPosition {
//            // check if it is valid for different size of views
//            let tmpScaleX = self.scaleX(model, rect: rect)
//            let tmpScaleY = self.scaleY(model, rect: rect)
//
//            let x = max(0.5 / tmpScaleX, min(1 - 0.5 / tmpScaleX, pos.x))
//            let y = max(0.5 / tmpScaleY, min(1 - 0.5 / tmpScaleY, pos.y))
//
//            return CGPoint(x: x, y: y)
//        } else {
//            let x = 0.5 / self.scaleX(model, rect: rect)
//            let y = 0.5 / self.scaleY(model, rect: rect)
//            return CGPoint(x: x, y: y)
//        }
//    }
// }
//
