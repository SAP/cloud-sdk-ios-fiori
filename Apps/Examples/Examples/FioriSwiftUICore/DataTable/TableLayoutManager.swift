import Foundation
import SwiftUI

class TableLayoutManager: ObservableObject {
    var model: TableModel
    
    var sizeClass: UserInterfaceSizeClass {
        get {
            self._sizeClass
        }
        
        set {
            if self._sizeClass != newValue {
                self._sizeClass = newValue
            }
        }
    }
    
    @Published var _sizeClass: UserInterfaceSizeClass = .compact
    
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
            let heightSoFar = self.rowHeights[0 ..< i].reduce(0, +) + self.rowHeights[i] / 2
            let posY = heightSoFar / actualSize.height
            
            for j in 0 ..< numberOfColumns {
                var item = items[i][j]
                let widthSoFar = self.columnWidths[0 ..< j].reduce(0, +)
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
            var maxItemWidth: CGFloat = 0

            for i in 0 ..< numberOfRows {
                let currentItem = self.allDataItems[i][j]
                let currentItemWidth: CGFloat = self.cellWidth(true, currentItem.size.width, self.sizeClass, rect.size.width)
                maxItemWidth = max(maxItemWidth, currentItemWidth)
            }
            columnWidths.append(maxItemWidth)
        }
        
        self.columnWidths = columnWidths
        return columnWidths
    }
    
    func cellWidth(_ horizontalScrolling: Bool, _ contentWidth: CGFloat, _ sizeClass: UserInterfaceSizeClass, _ rectWidth: CGFloat) -> CGFloat {
        let maxColumnWidth: CGFloat = rectWidth * TableViewLayout.maxColumnWidth
        let minColumnWidth: CGFloat = rectWidth * TableViewLayout.minColumnWidth

        let contentInset: CGFloat = TableViewLayout.contentInset(sizeClass: sizeClass)
        let contentWidthWithPaddings: CGFloat = contentWidth + contentInset * 2
        
        if contentWidthWithPaddings <= minColumnWidth {
            return contentWidthWithPaddings
        }
        
        return horizontalScrolling ? min(contentWidthWithPaddings, maxColumnWidth) : min(maxColumnWidth, max(minColumnWidth, contentWidthWithPaddings))
    }
    
    func getLeftAccessoryViewWidth() -> CGFloat {
        TableViewLayout.accessoryViewLeftPaddingInCompact + 44 + 4 + 20
    }
    
    func actualSizeForTable(_ model: TableModel, _ rect: CGRect) -> CGSize {
        guard self.actualTableViewSize == .zero else {
            return self.actualTableViewSize
        }
                
        let numberOfColumns = self.numberOfDataInRow()
        let numberOfRows = self.numberOfDataInColumn()
        
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        self.columnWidths = []
        self.rowHeights = []
        
        for i in 0 ..< numberOfColumns {
            let columnWidth = self.columnWidths(model, rect)[i]
            self.columnWidths.append(columnWidth)
            width += columnWidth
        }
        
        // ignoring the first and last item insets
        let contentInset: CGFloat = TableViewLayout.contentInset(sizeClass: self.sizeClass)
        width -= contentInset * 2
        
        for j in 0 ..< numberOfRows {
            let isHeader = !model.headerData.isEmpty && j == 0
            let topAndBottom = isHeader ? TableViewLayout.topAndBottomPaddingsForHeader : TableViewLayout.topAndBottomPaddings
            let _height = self.heightForRowAt(j) + topAndBottom * 2
            self.rowHeights.append(_height)
            height += _height
        }
        
        let margin = TableViewLayout.leadingOrTrailingMargin(width: rect.size.width, sizeClass: self.sizeClass)
        let actualTableViewSize = CGSize(width: width + margin * 2, height: height)
        
        self.actualTableViewSize = actualTableViewSize
        self.allDataItems = self.updatedItemsPos()
        
        return actualTableViewSize
    }
    
    func heightForRowAt(_ index: Int) -> CGFloat {
        let row = self.allDataItems[index]
        var height: CGFloat = .leastNonzeroMagnitude
        for item in row {
            let itemHeight: CGFloat = item.size.height
            height = max(height, itemHeight)
        }
        return height
    }

    func initItems(_ model: TableModel) -> [[TableDataItem]] {
        var res: [[TableDataItem]] = []
        if self.allDataItems.isEmpty {
            res = self.dataItemsForTable(model)
        } else {
            res = self.allDataItems
        }
        return res
    }
    
    func dataItemsForTable(rect: CGRect) -> [[TableDataItem]] {
        self.actualTableViewSize = self.actualSizeForTable(self.model, rect)
        
        let allItems = self.allDataItems
        
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
        
        var displayingItems: [[TableDataItem]] = []
                
        let contentInset: CGFloat = TableViewLayout.contentInset(sizeClass: self.sizeClass)
        let leadingMargin = TableViewLayout.leadingOrTrailingMargin(width: rect.size.width, sizeClass: self.sizeClass) - contentInset

        if catIndexRangeInRow.lowerBound >= 0, catIndexRangeInRow.upperBound < maxDataCountInRow,
           catIndexRangeInColumn.lowerBound >= 0, catIndexRangeInColumn.upperBound < maxDataCountInColumn
        {
            for i in catIndexRangeInColumn {
                displayingItems.append([])
                let rowHeight = self.rowHeights[i]

                for j in catIndexRangeInRow {
                    let currentItem = allItems[i][j]
                    let columnWidth = self.columnWidths[j]
                    let contentWidth = columnWidth - contentInset * 2
                                        
                    let x = currentItem.pos.x * tmpScaleX * width - startPosX + leadingMargin
                    let y = currentItem.pos.y * tmpScaleY * height - startPosY
                    
                    let itemWidth = contentWidth * tmpScaleX
                    let itemHeight = rowHeight * tmpScaleY
                                        
                    if x > -itemWidth, x <= width + itemWidth,
                       y > -itemHeight, y <= height + itemHeight
                    {
                        var item = currentItem
                        
                        item.rowHeight(rowHeight)
                        item.x(x)
                        item.y(y)
                        item.size(CGSize(width: contentWidth, height: item.size.height))
                        item.offset(CGPoint(x: columnWidth / 2, y: 0))
                        
                        let lastIndex = displayingItems.count - 1
                        displayingItems[lastIndex].append(item)
                    }
                }
                                
                if self.model.isFirstColumnSticky {
                    var item = allItems[i][0]
                    let contentWidth = self.columnWidths[0] - contentInset * 2
                    let x = leadingMargin
                    let y = item.pos.y * tmpScaleY * height - startPosY
                    item.rowHeight(rowHeight)
                    item.x(x)
                    item.y(y)
                    item.size(CGSize(width: contentWidth, height: item.size.height))
                    item.offset(CGPoint(x: self.columnWidths[0] / 2, y: 0))

                    let lastIndex = displayingItems.count - 1
                    displayingItems[lastIndex].removeFirst()
                    displayingItems[lastIndex].insert(item, at: 0)
                }
            }
        }
        
        if self.model.isFirstRowSticky {
            var firstRow = allItems.first ?? []
            for i in 0 ..< firstRow.count {
                let contentWidth = self.columnWidths[i] - contentInset * 2
                let x = firstRow[i].pos.x * tmpScaleX * width - startPosX + leadingMargin
                firstRow[i].x(x)
                firstRow[i].y((self.rowHeights.first ?? 0) / 2)
                firstRow[i].offset(CGPoint(x: self.columnWidths[i] / 2, y: 0))
                firstRow[i].size(CGSize(width: contentWidth, height: firstRow[i].size.height))
                firstRow[i].rowHeight(self.rowHeights.first ?? 0)
            }

            var firstItem: TableDataItem?

            if self.model.isFirstColumnSticky {
                firstItem = allItems.first?.first
                let itemHeight = firstItem?.size.height ?? 0
                let contentWidth = self.columnWidths[0] - contentInset * 2
                let x = leadingMargin
                firstItem?.rowHeight(self.rowHeights[0])
                firstItem?.x(x)
                firstItem?.y((self.rowHeights.first ?? 0) / 2)
                firstItem?.size(CGSize(width: contentWidth, height: itemHeight))
                firstItem?.offset(CGPoint(x: self.columnWidths[0] / 2, y: 0))
            }

            if let item = firstItem {
                firstRow = Array(firstRow[catIndexRangeInRow])
                firstRow.removeFirst()
                firstRow.insert(item, at: 0)
            }

            displayingItems.removeFirst()
            displayingItems.insert(firstRow, at: 0)
        }
        
        self.displayingItems = displayingItems
        
        return displayingItems
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
        
        let rowIndex = !self.model.headerData.isEmpty ? index - 1 : index
                
        var res: [TableDataItem] = []
        for i in 0 ..< numberInEachRow {
            let currentItem = dataInEachRow[i]
            switch currentItem.type {
            case .text:
                let title = (currentItem as? DataTextItem)?.text ?? ""
                let font = (currentItem as? DataTextItem)?.font ?? .body
                let fontSize = UIFont.preferredFont(from: font).pointSize
                let size = title.boundingBoxSize(with: fontSize * self.scaleX)
                res.append(TableDataItem(index: rowIndex,
                                         value: .text(title),
                                         pos: CGPoint(x: CGFloat(i) * unitWidth, y: CGFloat(index) * unitHeight),
                                         size: size))
            case .image:
                guard let image = (currentItem as? DataImageItem)?.image else {
                    break
                }
                res.append(TableDataItem(index: rowIndex,
                                         value: .image(image),
                                         pos: CGPoint(x: CGFloat(i) * unitWidth, y: CGFloat(index) * unitHeight),
                                         size: CGSize(width: 45, height: 0)))
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
