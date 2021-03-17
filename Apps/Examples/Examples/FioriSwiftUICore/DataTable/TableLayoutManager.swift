import Foundation
import SwiftUI

class TableLayoutManager: ObservableObject {
    @Published var model: TableModel
    
    var deviceMode: DeviceMode {
        get {
            self._deviceMode
        }
        set {
            if self._deviceMode != newValue {
                self.allDataItems = []
                self.columnWidths = []
                self.actualTableViewSize = .zero
                self._deviceMode = newValue
            }
        }
    }
    
    @Published var _deviceMode: DeviceMode = .iphonePortraitOrIpadSplit
    
    var rect: CGRect {
        get {
            self._rect
        }
        
        set {
            if newValue != self.rect {
                self.actualTableViewSize = .zero
                self._rect = newValue
            }
        }
    }

    @Published private var _rect: CGRect = .zero
    
    /// private: X direction scale factor, scale is not allowed to be less than 1.0
    @Published private var _scaleX: CGFloat = 1.0
    
    /// X direction scale factor, scale is not allowed to be less than 1.0
    public var scaleX: CGFloat {
        get {
            self._scaleX
        }
        
        set {
            if newValue > 1024 {
                self._scaleX = 1024
            } else {
                self._scaleX = newValue
            }
        }
    }
    
    /// private: Y direction scale factor, scale is not allowed to be less than 1.0
    @Published private var _scaleY: CGFloat = 1.0
    
    /// Y direction scale factor, scale is not allowed to be less than 1.0
    public var scaleY: CGFloat {
        get {
            self._scaleY
        }
        
        set {
            if newValue > 1024 {
                self._scaleY = 1024
            } else {
                self._scaleY = newValue
            }
        }
    }
    
    @Published var centerPosition: CGPoint? = nil

    var allDataItems: [[TableDataItem]] = []
    
    var displayingItems: [[TableDataItem]] = []
    
    public func numberOfDataInRow() -> Int {
        self.model.rowData.first?.data.count ?? 0
    }
    
    public func numberOfDataInColumn() -> Int {
        self.model.rowData.count
    }
    
    var columnWidths: [CGFloat] {
        get {
            self._columnWidths
        }
        set {
            self._columnWidths = newValue
        }
    }
    
    @Published var _columnWidths: [CGFloat] = []
    
    var rowHeights: [CGFloat] {
        get {
            self._rowHeights
        }
        set {
            self._rowHeights = newValue
        }
    }
    
    @Published var _rowHeights: [CGFloat] = []
 
    var weightForColumns: [CGFloat] {
        get {
            self._weightForColumns
        }
        set {
            self._weightForColumns = newValue
        }
    }
    
    @Published var _weightForColumns: [CGFloat] = []
    
    var maxItemSize: CGSize {
        get {
            self._maxItemSize
        }
        
        set {
            if self._maxItemSize == .zero {
                self._maxItemSize = newValue
            }
        }
    }
    
    @Published var _maxItemSize: CGSize = .zero
    
    var displayingItemSize: CGSize {
        get {
            self._displayingItemSize
        }
        
        set {
            if self._displayingItemSize == .zero {
                self._displayingItemSize = newValue
            }
        }
    }
    
    @Published var _displayingItemSize: CGSize = .zero
    
    var selectedIndex: [Int] {
        get {
            self._selectedIndex
        }
        
        set {
            self._selectedIndex = newValue
        }
    }
    
    @Published var _selectedIndex: [Int] = []
    
    var actualTableViewSize: CGSize {
        get {
            self._actualTableViewSize
        }
        
        set {
            if self.actualTableViewSize != newValue {
                self._actualTableViewSize = newValue
            }
        }
    }
    
    @Published var _actualTableViewSize: CGSize = .zero
    
    init(model: TableModel) {
        self.model = model
        self.allDataItems = self.initItems(self.model)
    }
        
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

    func updatedItemsPos() -> [[TableDataItem]] {
        let numberOfColumns = self.numberOfDataInRow()
        let numberOfRows = self.numberOfDataInColumn()
        let actualSize = self.actualTableViewSize
        
        var items = self.allDataItems
        
        for i in 0 ..< numberOfRows {
            let heightSoFar = self.rowHeights[0 ..< i].reduce(0, +)
            let posY = heightSoFar / actualSize.height
            
            for j in 0 ..< numberOfColumns {
                var item = items[i][j]
                let widthSoFar = self.columnWidths[0 ..< j].reduce(0, +)
//                let currentWidth = model.columnWidths[j] - columnGap
                let posX = widthSoFar / actualSize.width
                item.x(posX)
                item.y(posY)
                items[i][j] = item
            }
        }
        return items
    }
    
    func columnWidths(_ model: TableModel, _ rect: CGRect) -> [CGFloat] {
        guard self.columnWidths.isEmpty else {
            return self.columnWidths
        }
        
        let numberOfColumns = self.numberOfDataInRow()
        let numberOfRows = self.numberOfDataInColumn()
        var columnWidths: [CGFloat] = []
        for j in 0 ..< numberOfColumns {
            var maxItemWidth: CGFloat = .leastNonzeroMagnitude

            for i in 0 ..< numberOfRows {
                let currentItem = self.allDataItems[i][j]
                let currentItemWidth: CGFloat = self.widthForColumn(currentItem.size, self.deviceMode, rect)
                maxItemWidth = max(maxItemWidth, currentItemWidth)
            }
            columnWidths.append(maxItemWidth)
        }
        
        self.columnWidths = columnWidths
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
    
    func getLeftAccessoryViewWidth() -> CGFloat {
        TableViewLayout.accessoryViewLeftPaddingInCompact + 44 + 4 + 20
    }
    
    func actualSizeForTable(_ model: TableModel, _ rect: CGRect) -> CGSize {
        guard self.actualTableViewSize == .zero else {
            return self.actualTableViewSize
        }
        
        let isCompact = self.deviceMode == .ipadRegular
        
        let numberOfColumns = self.numberOfDataInRow()
        let numberOfRows = self.numberOfDataInColumn()

        let columnHeight: CGFloat = self.maxItemSize.height + TableViewLayout.topAndBottomPaddings * 2
        
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        self.columnWidths = []
        self.rowHeights = []
        
        for i in 0 ..< numberOfColumns {
            let columnWidth = self.columnWidths(model, rect)[i]
            self.columnWidths.append(columnWidth)
            width += columnWidth
        }
        
        for j in 0 ..< numberOfRows {
            let isHeader = !model.headerData.isEmpty && j == 0
            let topAndBottom = isHeader ? TableViewLayout.topAndBottomPaddingsForHeader : TableViewLayout.topAndBottomPaddings
            let _height = self.heightForRowAt(j) + topAndBottom * 2
            self.rowHeights.append(_height)
            height += _height
        }
        
        let paddings = isCompact ? TableViewLayout.leadingMarginInCompact : TableViewLayout.leadingMarginInRegular
//        width += 44
//        height = CGFloat(numberOfRows) * columnHeight
        
//        model.displayingItemSize = CGSize(width: model.maxItemSize.width, height: columnHeight)
        let actualTableViewSize = CGSize(width: width + self.getLeftAccessoryViewWidth(), height: height)
        
        return actualTableViewSize
    }
    
    func columnWidth(_ model: TableModel) -> CGFloat {
        let count = self.numberOfDataInRow()
        let unitWidth: CGFloat = max(1 / CGFloat(max(count - 1, 1)), TableViewLayout.minUnitWidth)
        
        return unitWidth
    }
    
    func rowHeight(_ model: TableModel) -> CGFloat {
        let count = self.numberOfDataInColumn()
        let unitHeight: CGFloat = max(1 / CGFloat(max(count - 1, 1)), TableViewLayout.minUnitHeight)
        
        return unitHeight
    }
    
    func heightForRowAt(_ index: Int) -> CGFloat {
        let row = self.allDataItems[index]
        var height: CGFloat = .leastNonzeroMagnitude
        for item in row {
            height = max(height, item.size.height)
        }
        return height
    }

    func initItems(_ model: TableModel) -> [[TableDataItem]] {
        var res: [[TableDataItem]] = []
        if self.allDataItems.isEmpty {
            res = self.dataItemsForTable(model)
            if self.maxItemSize == .zero {
                self.maxItemSize = self.maxItemSize(res)
            }
        } else {
            res = self.allDataItems
        }
        return res
    }
    
    func dataItemsForTable(rect: CGRect) -> [[TableDataItem]] {
        var res = self.allDataItems

        self.actualTableViewSize = self.actualSizeForTable(self.model, rect)
        
        res = self.updatedItemsPos()
        
        let maxDataCountInRow = self.numberOfDataInRow()
        let width: CGFloat = rect.width
        
        let tmpScaleX = self.scaleX(rect: rect)
        let tmpStartPositionInRow = self.startPosition(rect: rect)
        let startPosX = tmpStartPositionInRow.x * tmpScaleX * width
        let unitWidth: CGFloat = max(width * tmpScaleX / CGFloat(max(maxDataCountInRow - 1, 1)), TableViewLayout.minUnitWidth)
        var startIndexInRow = Int((startPosX / unitWidth).rounded(.up)).clamp(low: 0, high: maxDataCountInRow - 1)
        let endIndexInRow = Int(((startPosX + width) / unitWidth).rounded(.up)).clamp(low: startIndexInRow, high: maxDataCountInRow - 1)
        if startIndexInRow != 0 {
            startIndexInRow -= 1
        }
        let catIndexRangeInRow = startIndexInRow ... endIndexInRow
        
        let maxDataCountInColumn = self.numberOfDataInColumn()
        let height = rect.height
        
        let tmpScaleY = self.scaleY(rect: rect)
        let tmpStartPositionInColumn = self.startPosition(rect: rect)
        let startPosY = tmpStartPositionInColumn.y * tmpScaleY * height
        let unitHeight: CGFloat = max(height * tmpScaleY / CGFloat(max(maxDataCountInColumn - 1, 1)), TableViewLayout.minUnitHeight)
        let startIndexInColumn = Int(((startPosY - unitHeight) / unitHeight).rounded(.up)).clamp(low: 0, high: maxDataCountInColumn - 1)
        let endIndexInColumn = Int(((startPosY + height) / unitHeight).rounded(.up)).clamp(low: startIndexInColumn, high: maxDataCountInColumn - 1)
        
        // get actual displaying data for rows
        let catIndexRangeInColumn = startIndexInColumn ... endIndexInColumn
        
        var result: [[TableDataItem]] = []
        
        let isCompact = self.deviceMode == .iphonePortraitOrIpadSplit
        let leadingMargin = isCompact ? TableViewLayout.leadingMarginInCompact : TableViewLayout.leadingMarginInRegular
        
//        let columnGap = isCompact ? TableViewLayout.columnGapInCompact : TableViewLayout.columnGapInRegualr
        let columnPadding: CGFloat = isCompact ? TableViewLayout.leadingTrailingPaddingInCompact : TableViewLayout.leadingTrailingPaddingInRegular
        let firstColumnWidth: CGFloat = (self.columnWidths.first ?? 0) / 2 - columnPadding
        
        if self.model.isFirstRowSticky {
            var firstRow = res.first ?? []
            for i in 0 ..< firstRow.count {
                let contentWidth = self.columnWidths[i] - columnPadding * 2
                let x = firstRow[i].pos.x * tmpScaleX * width - startPosX + firstColumnWidth
                firstRow[i].x(x)
                firstRow[i].y((self.rowHeights.first ?? 0) / 2)
                firstRow[i].offset(CGPoint(x: self.getLeftAccessoryViewWidth(), y: 0))
                firstRow[i].size(CGSize(width: contentWidth, height: firstRow[i].size.height))
                firstRow[i].rowHeight(self.rowHeights.first ?? 0)
            }
            result.insert(firstRow, at: 0)
        }
        
        if catIndexRangeInRow.lowerBound >= 0, catIndexRangeInRow.upperBound < maxDataCountInRow,
           catIndexRangeInColumn.lowerBound >= 0, catIndexRangeInColumn.upperBound < maxDataCountInColumn
        {
            for i in catIndexRangeInColumn {
                result.append([])
                
                let firstRowHeight = (self.rowHeights.first ?? 44) / 2
                let topPadding = i == 0 ? firstRowHeight : firstRowHeight + TableViewLayout.topAndBottomPaddings - TableViewLayout.topAndBottomPaddingsForHeader
                
                let rowHeight = self.rowHeights[i]

                for j in catIndexRangeInRow {
                    let currentItem = res[i][j]
                    let contentWidth = self.columnWidths[j] - columnPadding * 2
                    
                    let initX = (model.isFirstColumnSticky && j == 0) ? 0 : currentItem.pos.x
                    
                    let x = currentItem.pos.x * tmpScaleX * width - startPosX + firstColumnWidth
                    let y = currentItem.pos.y * tmpScaleY * height - startPosY + topPadding
                    
                    let itemWidth = contentWidth * tmpScaleX
                    let itemHeight = rowHeight * tmpScaleY
                                        
                    if x > -itemWidth, x <= width + itemWidth,
                       y > -itemHeight, y <= height + itemHeight
                    {
                        var item = currentItem
                        
                        item.rowHeight(rowHeight)
                        item.x(x)
                        item.y(y)
//                        item.size(CGSize(width: model.columnWidths[j], height: model.rowHeights[i]))
                        item.size(CGSize(width: contentWidth, height: item.size.height))
                        item.offset(CGPoint(x: self.getLeftAccessoryViewWidth(), y: 0))
                        
                        let lastIndex = result.count - 1
                        result[lastIndex].append(item)
                    }
                }
                
                if self.model.isFirstColumnSticky {
                    var item = res[i][0]
                    let contentWidth = self.columnWidths[0] - columnPadding * 2
                    let x = firstColumnWidth
                    let y = item.pos.y * tmpScaleY * height - startPosY + topPadding
                    item.rowHeight(rowHeight)
                    item.x(x)
                    item.y(y)
//                        item.size(CGSize(width: model.columnWidths[j], height: model.rowHeights[i]))
                    item.size(CGSize(width: contentWidth, height: item.size.height))
                    item.offset(CGPoint(x: self.getLeftAccessoryViewWidth(), y: 0))
                    
                    let lastIndex = result.count - 1
                    result[lastIndex].insert(item, at: 0)
                }
            }
        }
        
        result.removeAll(where: { $0.isEmpty })
        self.displayingItems = result
        
        return result
    }
    
    func dataItemsForTable(_ model: TableModel) -> [[TableDataItem]] {
        var res: [[TableDataItem]] = []
        let numberOfRows = self.numberOfDataInColumn()
        
        for i in 0 ..< numberOfRows {
            let items = self.dataItemsForRow(at: i)
            res.append(items)
        }

        return res
    }
    
    func dataItemsForRow(at index: Int) -> [TableDataItem] {
        let numberInEachRow = self.numberOfDataInRow()
        let numberOfDataInColumn = self.numberOfDataInColumn()
        
        let dataInEachRow = self.model.rowData[index].data
        
        let width: CGFloat = 1
        let unitWidth: CGFloat = max(width / CGFloat(max(numberInEachRow - 1, 1)), TableViewLayout.minUnitWidth)
        
        let height: CGFloat = 1
        let unitHeight: CGFloat = max(height / CGFloat(max(numberOfDataInColumn - 1, 1)), TableViewLayout.minUnitHeight)
                
        var res: [TableDataItem] = []
        for i in 0 ..< numberInEachRow {
            let currentItem = dataInEachRow[i]
            switch currentItem.type {
            case .text:
                let title = (currentItem as? DataTextItem)?.text ?? ""
                let font = (currentItem as? DataTextItem)?.font ?? .body
                let fontSize = UIFont.preferredFont(from: font).pointSize
                let size = title.boundingBoxSize(with: fontSize * self.scaleX)
                res.append(TableDataItem(index: index,
                                         value: .text(title),
                                         pos: CGPoint(x: CGFloat(i) * unitWidth, y: CGFloat(index) * unitHeight),
                                         size: size))
            case .image:
                guard let image = (currentItem as? DataImageItem)?.image else {
                    break
                }
                res.append(TableDataItem(index: index,
                                         value: .image(image),
                                         pos: CGPoint(x: CGFloat(i) * unitWidth, y: CGFloat(index) * unitHeight),
                                         size: CGSize(width: 0, height: 0)))
            default:
                break
            }
        }
        
        return res
    }
    
    func scaleX(rect: CGRect) -> CGFloat {
        let rs = self.readableScale(rect: rect, true)
        return rs
    }
    
    func scaleY(rect: CGRect) -> CGFloat {
        let rs = self.readableScale(rect: rect, false)
        return rs
    }
    
    func readableScale(rect: CGRect, _ isXAxis: Bool) -> CGFloat {
        let size = isXAxis ? rect.size.width : rect.size.height
        
        let scale: CGFloat = isXAxis ? self.scaleX : self.scaleY
        
        return (isXAxis ? self.actualTableViewSize.width / size : self.actualTableViewSize.height / size) * scale
    }
    
    func startPosition(rect: CGRect) -> CGPoint {
        let pos = self.centerPosition(rect: rect)
        let tmpScaleX = self.scaleX(rect: rect)
        let tmpScaleY = self.scaleY(rect: rect)
        
        let x = min(1 - 0.5 / tmpScaleX, max(0, pos.x - 0.5 / tmpScaleX))
        let y = min(1 - 0.5 / tmpScaleY, max(0, pos.y - 0.5 / tmpScaleY))
        
        return CGPoint(x: x, y: y)
    }
    
    func centerPosition(rect: CGRect) -> CGPoint {
        if let pos = self.centerPosition {
            // check if it is valid for different size of views
            let tmpScaleX = self.scaleX(rect: rect)
            let tmpScaleY = self.scaleY(rect: rect)
            
            let x = max(0.5 / tmpScaleX, min(1 - 0.5 / tmpScaleX, pos.x))
            let y = max(0.5 / tmpScaleY, min(1 - 0.5 / tmpScaleY, pos.y))
            
            return CGPoint(x: x, y: y)
        } else {
            let x = 0.5 / self.scaleX(rect: rect)
            let y = 0.5 / self.scaleY(rect: rect)
            return CGPoint(x: x, y: y)
        }
    }
}
