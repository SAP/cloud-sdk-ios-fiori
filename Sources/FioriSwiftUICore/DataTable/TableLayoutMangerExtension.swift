import Foundation
import SwiftUI
import UIKit

extension TableLayoutManager {
    func initRowData(model: TableModel) {
        if let header = model.headerData {
            self.rowData.append(header)
        }
        self.rowData.append(contentsOf: model.rowData)
    }
    
    func setupMargins(rect: CGRect) {
        self.leadingAccessoryViewWidth = self.getleadingAccessoryViewWidth().0
        self.trailingAccessoryViewWidth = self.getTrailingAccessoryViewWidth()
        let hasButton = self.getleadingAccessoryViewWidth().1
        self.leadingAccessoryMargin = TableViewLayout.leftPaddingForLeadingAccessoryView(width: rect.size.width, sizeClass: self.sizeClass, hasButton: hasButton)
        
        self.contentInset = TableViewLayout.contentInset(sizeClass: self.sizeClass)
        
        if self.leadingAccessoryViewWidth != 0 {
            self.tableLeadingLayoutMargin = self.leadingAccessoryViewWidth + TableViewLayout.rightPaddingForLeadingAccessoryView(self.sizeClass) + self.leadingAccessoryMargin
        } else {
            self.tableLeadingLayoutMargin = TableViewLayout.leadingOrTrailingMargin(width: rect.size.width, sizeClass: self.sizeClass)
        }
        
        if self.trailingAccessoryViewWidth != 0 {
            self.tableTrailingLayoutMargin = self.trailingAccessoryViewWidth
        } else {
            self.tableTrailingLayoutMargin = TableViewLayout.leadingOrTrailingMargin(width: rect.size.width, sizeClass: self.sizeClass)
        }
        
        self.tableLeadingLayoutMargin -= self.contentInset
        self.tableTrailingLayoutMargin -= self.contentInset
    }
    
    func getListItems() -> [AnyView] {
        var rows = self.rowData
        if self.model.headerData != nil {
            rows = Array(rows.dropFirst())
        }
        var items: [AnyView] = []
        for row in rows {
            let objectView = self.makeObjectView(row: row)
            items.append(AnyView(objectView))
        }
        return items
    }
    
    func makeObjectView(row: TableRowItem) -> some View {
        var detailImage: Image?
        let imageItems: [DataImageItem] = row.data.compactMap { (item) -> DataImageItem? in
            item as? DataImageItem
        }
        
        if let _image = imageItems.filter({ (item) -> Bool in
            item.mapping == ObjectViewProperty.Image.detailImage
        }).first {
            detailImage = _image.image
        } else {
            detailImage = imageItems.first?.image
        }
        
        let textItems: [DataTextItem] = row.data.compactMap { (item) -> DataTextItem? in
            item as? DataTextItem
        }
        
        var titles: [String] = []
        
        if textItems.first?.mapping != nil {
            if let title = textItems.filter({ (item) -> Bool in
                item.mapping == ObjectViewProperty.Text.title
            }).first?.text {
                titles.append(title)
            }
            if let subtitle = textItems.filter({ (item) -> Bool in
                item.mapping == ObjectViewProperty.Text.subtitle
            }).first?.text {
                titles.append(subtitle)
            }
            if let footnote = textItems.filter({ (item) -> Bool in
                item.mapping == ObjectViewProperty.Text.footnote
            }).first?.text {
                titles.append(footnote)
            }
            if let status = textItems.filter({ (item) -> Bool in
                item.mapping == ObjectViewProperty.Text.status
            }).first?.text {
                titles.append(status)
            }
            if let substatus = textItems.filter({ (item) -> Bool in
                item.mapping == ObjectViewProperty.Text.substatus
            }).first?.text {
                titles.append(substatus)
            }
        } else {
            for i in 0 ..< 5 {
                titles.append(textItems[i].text)
            }
        }

        let icons: [IconStackItem] = row.leadingAccessories.compactMap { (item) -> IconStackItem? in
            switch item {
            case .icon(let value):
                return .icon(value)
            case .text(let value):
                return .text(value)
            default:
                return nil
            }
        }
        
        return
            ObjectItem {
                Text(titles.first ?? "")
            } subtitle: {
                if titles.indices.contains(1) {
                    Text(titles[1])
                }
            } footnote: {
                if titles.indices.contains(2) {
                    Text(titles[2])
                }
            } status: {
                if titles.indices.contains(3) {
                    Text(titles[3])
                }
            } substatus: {
                if titles.indices.contains(4) {
                    Text(titles[4])
                }
            } detailImage: {
                detailImage?.frame(width: 45, height: 45)
            } icons: {
                self.generateIconStack(icons: icons)
            }
    }
    
    func generateIconStack(icons: [IconStackItem]) -> some View {
        VStack(alignment: .leading, spacing: 4, content: {
            ForEach(0 ..< icons.count, id: \.self) { i in
                switch icons[i] {
                case .text(let value):
                    Text(value)
                case .icon(let value):
                    value
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16, alignment: .center)
                }
            }
        })
    }
    
    func updatedItemsPos() -> [[DataTableItem]] {
        let numberOfColumns = self.numberOfColumns()
        let numberOfRows = self.numberOfRows()
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
    
    func getTrailingAccessoryViewWidth() -> CGFloat {
        var width: CGFloat = 0
        for row in self.rowData {
            if row.trailingAccessory != nil {
                width = 44
                break
            }
        }
        return width
    }
    
    func getleadingAccessoryViewWidth() -> (CGFloat, showSelectionButton: Bool) {
        var width: CGFloat = 0
        var icons: Int = 0
        var buttons: Int = 0
        for row in self.rowData {
            var currentIcons: Int = 0
            var currentButtons: Int = 0
            for item in row.leadingAccessories {
                if case .button = item {
                    currentButtons += 1
                }
                if case .icon = item {
                    currentIcons += 1
                }
            }
            currentButtons += self.isEditing ? 1 : 0
            let totalWidth = CGFloat(currentButtons * 44 + currentIcons * 16)
            self.leadingItemsWidths.append(totalWidth)
            buttons = max(buttons, currentButtons)
            icons = max(icons, currentIcons)
        }
        width = CGFloat(buttons * 44 + icons * 16)
        return (width, self.isEditing)
    }
    
    func actualSizeForTable(_ model: TableModel, _ rect: CGRect) -> CGSize {
        guard self.actualTableViewSize == .zero else {
            return self.actualTableViewSize
        }
        
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        self.setupMargins(rect: rect)
        
        width = self.getColumnWidths(rect).reduce(0, +)
        width += self.tableLeadingLayoutMargin
        width += self.tableTrailingLayoutMargin
        
        height = self.getRowHeights().reduce(0, +)
        
        let actualTableViewSize = CGSize(width: width, height: height)
        
        self.actualTableViewSize = actualTableViewSize
        self.allDataItems = self.updatedItemsPos()
        
        return actualTableViewSize
    }
    
    func getColumnWidths(_ rect: CGRect) -> [CGFloat] {
        let numberOfColumns = self.numberOfColumns()
        let numberOfRows = self.numberOfRows()
        var columnWidths: [CGFloat] = []
        for j in 0 ..< numberOfColumns {
            var maxItemWidth: CGFloat = 0
            
            for i in 0 ..< numberOfRows {
                let currentItem = self.allDataItems[i][j]
                let currentItemWidth: CGFloat = self.cellWidth(currentItem.size.width, rect.size.width)
                maxItemWidth = max(maxItemWidth, currentItemWidth)
            }
            columnWidths.append(maxItemWidth)
        }
        
        self.columnWidths = columnWidths
        return columnWidths
    }
    
    func cellWidth(_ contentWidth: CGFloat, _ rectWidth: CGFloat) -> CGFloat {
        let maxColumnWidth: CGFloat = rectWidth * TableViewLayout.maxColumnWidth
        let minColumnWidth: CGFloat = rectWidth * TableViewLayout.minColumnWidth
        
        let contentInset: CGFloat = TableViewLayout.contentInset(sizeClass: self.sizeClass)
        let contentWidthWithPaddings: CGFloat = contentWidth + contentInset * 2
        
        if contentWidthWithPaddings <= minColumnWidth {
            return contentWidthWithPaddings
        }
        
        return self.horizontalScrolling ? min(contentWidthWithPaddings, maxColumnWidth) : min(maxColumnWidth, max(minColumnWidth, contentWidthWithPaddings))
    }
    
    func getRowHeights() -> [CGFloat] {
        let rows = self.allDataItems
        var heights: [CGFloat] = []
        for (index, row) in rows.enumerated() {
            var itemHeight: CGFloat = 0
            let isHeader = self.model.headerData != nil && index == 0
            let topAndBottom = isHeader ? TableViewLayout.topAndBottomPaddingsForHeader : TableViewLayout.topAndBottomPaddings
            for item in row {
                itemHeight = max(item.size.height, itemHeight)
            }
            let rowHeight = max(itemHeight + topAndBottom * 2, TableViewLayout.minRowHeight)
            heights.append(rowHeight)
        }
        self.rowHeights = heights
        return heights
    }
    
    func initItems(_ model: TableModel) -> [[DataTableItem]] {
        var res: [[DataTableItem]] = []
        if self.allDataItems.isEmpty {
            res = self.dataItemsForTable(model)
        } else {
            res = self.allDataItems
        }
        return res
    }
    
    // swiftlint:disable all
    func dataItemsForTable(rect: CGRect) -> [[DataTableItem]] {
        self.actualTableViewSize = self.actualSizeForTable(self.model, rect)
        
        let allItems = self.allDataItems
        
        let maxDataCountInRow = self.numberOfColumns()
        let width: CGFloat = rect.width
        
        let tmpScaleX = self.scaleX(rect: rect)
        let tmpStartPositionInRow = self.startPosition(rect: rect)
        let startPosX = tmpStartPositionInRow.x * tmpScaleX * width
        
        let maxDataCountInColumn = self.numberOfRows()
        let height = rect.height
        
        let tmpScaleY = self.scaleY(rect: rect)
        let tmpStartPositionInColumn = self.startPosition(rect: rect)
        let startPosY = tmpStartPositionInColumn.y * tmpScaleY * height
        
        var tempStartX: CGFloat = 0
        var xStartIndex: Int = 0
        for (index, w) in self.columnWidths.enumerated() {
            tempStartX += (w * self.scaleX)
            if tempStartX > startPosX {
                xStartIndex = index
                break
            }
        }
        
        var tempEndX: CGFloat = 0
        var xEndIndex: Int = 0
        for i in xStartIndex ..< self.columnWidths.count {
            tempEndX += (self.columnWidths[i] * self.scaleX)
            if tempEndX > width || i == self.columnWidths.count - 1 {
                xEndIndex = i
                break
            }
        }
        
        xStartIndex = max(0, xStartIndex - 1)
        xEndIndex = min(self.numberOfColumns() - 1, xEndIndex + 1)
        
        let catIndexRangeInRow = xStartIndex ... xEndIndex
        
        var tempStartY: CGFloat = 0
        var yStartIndex: Int = 0
        for (index, h) in self.rowHeights.enumerated() {
            tempStartY += (h * self.scaleY)
            if tempStartY > startPosY {
                yStartIndex = index
                break
            }
        }
        
        var tempEndY: CGFloat = 0
        var yEndIndex: Int = 0
        for i in yStartIndex ..< self.rowHeights.count {
            tempEndY += (self.rowHeights[i] * self.scaleY)
            if tempEndY > height || i == self.rowHeights.count - 1 {
                yEndIndex = i
                break
            }
        }
        
        // get actual displaying data for rows
        yStartIndex = max(0, yStartIndex - 1)
        yEndIndex = min(self.numberOfRows() - 1, yEndIndex + 1)
        let catIndexRangeInColumn = yStartIndex ... yEndIndex
        
        var displayingItems: [[DataTableItem]] = []
                
        if catIndexRangeInRow.lowerBound >= 0, catIndexRangeInRow.upperBound < maxDataCountInRow,
           catIndexRangeInColumn.lowerBound >= 0, catIndexRangeInColumn.upperBound < maxDataCountInColumn
        {
            for i in catIndexRangeInColumn {
                displayingItems.append([])
                
                let lastIndex = displayingItems.count - 1
                
                let rowHeight = self.rowHeights[i]
                
                for j in catIndexRangeInRow {
                    let currentItem = allItems[i][j]
                    let columnWidth = self.columnWidths[j]
                    let contentWidth = columnWidth - self.contentInset * 2
                    
                    let x = currentItem.pos.x * tmpScaleX * width - startPosX + self.tableLeadingLayoutMargin
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
                        
                        displayingItems[lastIndex].append(item)
                    }
                }
                
                if self.model.isFirstColumnSticky {
                    var item = allItems[i][0]
                    let contentWidth = self.columnWidths[0] - self.contentInset * 2
                    let x = self.tableLeadingLayoutMargin
                    let y = item.pos.y * tmpScaleY * height - startPosY
                    item.rowHeight(rowHeight)
                    item.x(x)
                    item.y(y)
                    item.size(CGSize(width: contentWidth, height: item.size.height))
                    item.offset(CGPoint(x: self.columnWidths[0] / 2, y: 0))
                    
                    if displayingItems[lastIndex].count > 1 {
                        displayingItems[lastIndex].removeFirst()
                    }
                    displayingItems[lastIndex].insert(item, at: 0)
                }
            }
        }
        
        if self.model.isHeaderSticky {
            var firstRow = allItems.first ?? []
            for i in 0 ..< firstRow.count {
                let contentWidth = self.columnWidths[i] - self.contentInset * 2
                let x = firstRow[i].pos.x * tmpScaleX * width - startPosX + self.tableLeadingLayoutMargin
                firstRow[i].x(x)
                firstRow[i].y(0)
                firstRow[i].offset(CGPoint(x: self.columnWidths[i] / 2, y: (self.rowHeights.first ?? 0) / 2))
                firstRow[i].size(CGSize(width: contentWidth, height: firstRow[i].size.height))
                firstRow[i].rowHeight(self.rowHeights.first ?? 0)
            }
            
            var leftTopItem: DataTableItem?
            
            if self.model.isFirstColumnSticky {
                leftTopItem = allItems.first?.first
                let itemHeight = leftTopItem?.size.height ?? 0
                let contentWidth = self.columnWidths[0] - self.contentInset * 2
                let x = self.tableLeadingLayoutMargin
                leftTopItem?.rowHeight(self.rowHeights[0])
                leftTopItem?.x(x)
                leftTopItem?.y(0)
                leftTopItem?.size(CGSize(width: contentWidth, height: itemHeight))
                leftTopItem?.offset(CGPoint(x: self.columnWidths[0] / 2, y: (self.rowHeights.first ?? 0) / 2))
            }
            
            if let item = leftTopItem {
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
    
    func dataItemsForTable(_ model: TableModel) -> [[DataTableItem]] {
        var res: [[DataTableItem]] = []
        let numberOfRows = self.numberOfRows()
        
        for i in 0 ..< numberOfRows {
            let items = self.createDataItemForRow(at: i)
            res.append(items)
        }
        
        return res
    }
    
    func createDataItemForRow(at index: Int) -> [DataTableItem] {
        let numberInEachRow = self.numberOfColumns()
        let numberOfDataInColumn = self.numberOfRows()
        
        let dataInEachRow = self.rowData[index].data
        
        let width: CGFloat = 1
        let unitWidth: CGFloat = max(width / CGFloat(max(numberInEachRow - 1, 1)), TableViewLayout.minUnitWidth)
        
        let height: CGFloat = 1
        let unitHeight: CGFloat = max(height / CGFloat(max(numberOfDataInColumn - 1, 1)), TableViewLayout.minUnitHeight)
                
        var res: [DataTableItem] = []
        for i in 0 ..< numberInEachRow {
            var contentWidth = CGFloat(MAXFLOAT)
            var textAlignment: TextAlignment = .leading
            if self.model.columnAttributes.indices.contains(i) {
                textAlignment = self.model.columnAttributes[i].textAlignment
                switch self.model.columnAttributes[i].width {
                case .fixed(let value):
                    contentWidth = value
                default:
                    contentWidth = CGFloat(MAXFLOAT)
                }
            }
            contentWidth -= self.contentInset * 2
            
            let currentItem = dataInEachRow[i]
            
            switch currentItem.type {
            case .text:
                guard let item = currentItem as? DataTextItem else {
                    break
                }
                let title = item.text
                //                let font = item.font ?? .body
                let font = UIFont.preferredFont(from: item.font)
                let height = item.lineLimit == nil ? CGFloat(MAXFLOAT) : CGFloat(item.lineLimit ?? 0) * font.lineHeight
                let size = title.boundingBoxSize(with: font.pointSize * self.scaleX, width: contentWidth, height: height)
                res.append(DataTableItem(index: index,
                                         value: .text(title),
                                         pos: CGPoint(x: CGFloat(i) * unitWidth, y: CGFloat(index) * unitHeight),
                                         size: size,
                                         textAlignment: textAlignment,
                                         lineLimit: item.lineLimit))
            case .image:
                guard let image = (currentItem as? DataImageItem)?.image else {
                    break
                }
                res.append(DataTableItem(index: index,
                                         value: .image(image),
                                         pos: CGPoint(x: CGFloat(i) * unitWidth, y: CGFloat(index) * unitHeight),
                                         size: CGSize(width: 45, height: 0)))
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
