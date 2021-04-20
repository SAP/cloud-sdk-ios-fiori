import Foundation
import SwiftUI

class TableLayoutManager: ObservableObject {
    @ObservedObject var model: TableModel
    
    var horizontalScrolling: Bool {
        get {
            self._horizontalScrolling
        }
        
        set {
            self._horizontalScrolling = newValue
        }
    }
    
    @Published var _horizontalScrolling = true
    
    var isEditing: Bool {
        get {
            self._isEditing
        }
        set {
            self._isEditing = newValue
        }
    }
    
    @Published var _isEditing: Bool = false
    
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
    
    var rowData: [TableRowItem] = []
    
    var allDataItems: [[TableDataItem]] = []
    
    var displayingItems: [[TableDataItem]] = []
    
    public func numberOfColumns() -> Int {
        self.rowData.first?.data.count ?? 0
    }
    
    public func numberOfRows() -> Int {
        self.rowData.count
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
    
    var contentInset: CGFloat = 0
    
    var leadingAccessoryViewWidth: CGFloat = 0
    var trailingAccessoryViewWidth: CGFloat = 0
    
    var tableLeadingLayoutMargin: CGFloat = 0
    var tableTrailingLayoutMargin: CGFloat = 0
    
    var leadingAccessoryMargin: CGFloat = 0
    
    var leadingItemsWidths: [CGFloat] = []
    
    init(model: TableModel, isEditing: Bool) {
        self.model = model
        self.initRowData(model: self.model)
        self.isEditing = isEditing
        self.horizontalScrolling = model.horizontalScrolling
        self.centerPosition = model.centerPosition
        self.allDataItems = self.initItems(self.model)
    }
    
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
    
    func updatedItemsPos() -> [[TableDataItem]] {
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
            if let _ = row.trailingAccessory {
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
        guard self.model.columnWidths.isEmpty else {
            self.columnWidths = self.model.columnWidths
            return self.columnWidths
        }
        
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
        
        var displayingItems: [[TableDataItem]] = []
        
        //        let contentInset: CGFloat = TableViewLayout.contentInset(sizeClass: self.sizeClass)
        
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
                
                if self.model.firstColumnSticky {
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
        
        if self.model.firstRowSticky {
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
            
            var leftTopItem: TableDataItem?
            
            if self.model.firstColumnSticky {
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
    
    func dataItemsForTable(_ model: TableModel) -> [[TableDataItem]] {
        var res: [[TableDataItem]] = []
        let numberOfRows = self.numberOfRows()
        
        for i in 0 ..< numberOfRows {
            let items = self.createDataItemForRow(at: i)
            res.append(items)
        }
        
        return res
    }
    
    func createDataItemForRow(at index: Int) -> [TableDataItem] {
        let numberInEachRow = self.numberOfColumns()
        let numberOfDataInColumn = self.numberOfRows()
        
        let dataInEachRow = self.rowData[index].data
        
        let width: CGFloat = 1
        let unitWidth: CGFloat = max(width / CGFloat(max(numberInEachRow - 1, 1)), TableViewLayout.minUnitWidth)
        
        let height: CGFloat = 1
        let unitHeight: CGFloat = max(height / CGFloat(max(numberOfDataInColumn - 1, 1)), TableViewLayout.minUnitHeight)
        
        //        let rowIndex = !self.model.headerData.isEmpty ? index - 1 : index
        
        var res: [TableDataItem] = []
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
                let title = item.text ?? ""
                //                let font = item.font ?? .body
                let font = UIFont.preferredFont(from: item.font ?? .body)
                let lineLimit = item.lineLimit ?? 0
                let height = lineLimit == 0 ? CGFloat(MAXFLOAT) : CGFloat(lineLimit) * font.lineHeight
                let size = title.boundingBoxSize(with: font.pointSize * self.scaleX, width: contentWidth, height: height)
                res.append(TableDataItem(index: index,
                                         value: .text(title),
                                         pos: CGPoint(x: CGFloat(i) * unitWidth, y: CGFloat(index) * unitHeight),
                                         size: size,
                                         textAlignment: textAlignment,
                                         lineLimit: lineLimit))
            case .image:
                guard let image = (currentItem as? DataImageItem)?.image else {
                    break
                }
                res.append(TableDataItem(index: index,
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
