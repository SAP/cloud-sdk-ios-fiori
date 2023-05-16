import Foundation
import SwiftUI

// swiftlint:disable file_length
class LayoutData {
    var size: CGSize = .zero
    
    var sizeClass: UserInterfaceSizeClass = .compact
    
    var editMode: TableModel.EditMode = .none
    
    var hasHeader: Bool = false
    
    // custom header cell's padding; if set it overwrites default value
    var headerCellPadding: EdgeInsets?
    
    // custom header cell's padding; if set it overwrites default value
    var dataCellPadding: EdgeInsets?
    
    var minRowHeight: CGFloat = 48
    
    var minColumnWidth: CGFloat = 48
    
    /// changes for rowData
    /// each row: -1: delete; 0: no change; 1: add; 2: change
    var rowDataChanges: [Int] = []
    
    var rowData: [TableRowItem] = []
    
    var columnAttributes: [ColumnAttribute] = []
    
    var rowAlignment: RowAlignment = .top
    
    var allDataItems: [[DataTableItem]] = []
    
    /// number of errors checked against TableModel.validateDataItem
    var numOfErrors: Int = 0
    
    /// column width including padding
    var columnWidths: [CGFloat] = []
    
    /// row height including top and bottom padding
    var rowHeights: [CGFloat] = []
    
    /// firstBaselineHeights for rows
    var firstBaselineHeights: [CGFloat] = []
    
    var leadingAccessoryViewWidth: CGFloat = 0
    var trailingAccessoryViewWidth: CGFloat = 0
    
    /// cache the result
    var numOfColumns: Int = -1
    
    func copy() -> LayoutData {
        let copy = LayoutData()
        copy.size = self.size
        copy.sizeClass = self.sizeClass
        copy.editMode = self.editMode
        copy.hasHeader = self.hasHeader
        copy.headerCellPadding = self.headerCellPadding
        copy.dataCellPadding = self.dataCellPadding
        copy.minRowHeight = self.minRowHeight
        copy.minColumnWidth = self.minColumnWidth
        copy.rowData = self.rowData
        copy.columnAttributes = self.columnAttributes
        copy.rowAlignment = self.rowAlignment
        copy.allDataItems = self.allDataItems
        copy.numOfErrors = self.numOfErrors
        copy.columnWidths = self.columnWidths
        copy.rowHeights = self.rowHeights
        copy.firstBaselineHeights = self.firstBaselineHeights
        copy.leadingAccessoryViewWidth = self.leadingAccessoryViewWidth
        copy.trailingAccessoryViewWidth = self.trailingAccessoryViewWidth
        copy.numOfColumns = self.numOfColumns
        
        return copy
    }
    
    func numberOfColumns() -> Int {
        if self.numOfColumns > -1 {
            return self.numOfColumns
        }

        self.numOfColumns = self.rowData.reduce(0) { partialResult, rowItem in
            max(partialResult, rowItem.data.count)
        }

        return self.numOfColumns
    }
    
    func numberOfRows() -> Int {
        self.rowData.count
    }
    
    func columnAttribute(for columnIndex: Int) -> ColumnAttribute {
        if columnIndex < self.columnAttributes.count {
            return self.columnAttributes[columnIndex]
        }
        
        return ColumnAttribute()
    }
    
    func initRowData(model: TableModel) -> [TableRowItem] {
        var rowData: [TableRowItem] = []
        if model.hasHeader, let header = model.headerData {
            rowData.append(header)
        }
        
        rowData.append(contentsOf: model.rowData)
        self.hasHeader = model.hasHeader
        self.columnAttributes = model.columnAttributes
        
        return rowData
    }
    
    /// Calculate all cells' content size in one line based on allDataItems and fromLayoutData
    ///
    /// - Parameter fromLayoutData: use this to reduce some calculations
    /// - Parameter workItem: use this to check cancel status
    ///
    /// - Returns: [[DataTableItem]] to be assigned to allDataItems later
    func initItems(model: TableModel, fromLayoutData: LayoutData? = nil, workItem: DispatchWorkItem? = nil) -> ([[DataTableItem]], [CGFloat]) {
        let numbOfRows = self.numberOfRows()
        var res: [[DataTableItem]] = []
        var maxFirstBaselineHeights = [CGFloat]()
        // reset it
        self.numOfErrors = 0
        
        /// minimize efforts to init items by using layoutData with rowDataChanges
        for i in 0 ..< numbOfRows {
            if workItem?.isCancelled ?? false {
                return ([[]], [])
            }
            
            // unchanged, just copy it
            if let ld = fromLayoutData, i < ld.allDataItems.count, i < ld.firstBaselineHeights.count, i < rowDataChanges.count, rowDataChanges[i] == 0 {
                res.append(ld.allDataItems[i])
                maxFirstBaselineHeights.append(ld.firstBaselineHeights[i])
                
                // check isValid
                for di in ld.allDataItems[i] where !di.isValid {
                    self.numOfErrors += 1
                }
            } else {
                let (items, maxFirstBaselineHeight) = self.createDataItemForRow(model: model, at: i, workItem: workItem)
                res.append(items)
                maxFirstBaselineHeights.append(maxFirstBaselineHeight)
            }
        }

        return (res, maxFirstBaselineHeights)
    }
    
    func calcDataItemSize(_ dataItem: DataTableItem) -> CGSize {
        var contentWidth = CGFloat(MAXFLOAT)
        let columnAttribute = columnAttribute(for: dataItem.columnIndex)
        switch columnAttribute.width {
        case .fixed(let value):
            contentWidth = max(1, value)
        default:
            contentWidth = CGFloat(MAXFLOAT)
        }

        let contentInset = self.cellContentInsets(for: dataItem.rowIndex, columnIndex: dataItem.columnIndex)
        contentWidth -= contentInset.horizontal * 2
        if dataItem.type == .listitem {
            contentWidth -= 15
        }
        
        if let uifont = dataItem.uifont, let title = dataItem.text {
            var size = title.boundingBoxSize(with: uifont, width: contentWidth, height: CGFloat(MAXFLOAT))
            if dataItem.type == .listitem { // add a spacing and chevron's size
                size.width += 15
                size.height = max(size.height, 22)
            }

            return size
        }
        
        return .zero
    }
    
    func createDataItemForRow(model: TableModel, at index: Int, workItem: DispatchWorkItem?) -> ([DataTableItem], CGFloat) {
        let numOfColumns = self.numberOfColumns()
        
        let dataInEachRow = self.rowData[index].data
        let isHeader: Bool = index == 0 && self.hasHeader
        
        var maxFirstBaselineHeight: CGFloat = 0
        var res: [DataTableItem] = []
        for i in 0 ..< numOfColumns {
            if workItem?.isCancelled ?? false {
                return ([], 0)
            }
            
            var contentWidth = CGFloat(MAXFLOAT)
            let columnAttribute = columnAttribute(for: i)
            let textAlignment = columnAttribute.textAlignment
            switch columnAttribute.width {
            case .fixed(let value):
                contentWidth = max(1, value)
            default:
                contentWidth = CGFloat(MAXFLOAT)
            }
            
            let contentInset = self.cellContentInsets(for: index, columnIndex: i)
            contentWidth -= contentInset.horizontal * 2
            
            // miss the data item fill with a empty text
            if !dataInEachRow.indices.contains(i) {
                res.append(DataTableItem(type: .text,
                                         rowIndex: index,
                                         columnIndex: i,
                                         text: "",
                                         pos: .zero,
                                         font: .fiori(forTextStyle: .body),
                                         foregroundColor: .clear,
                                         size: .zero,
                                         textAlignment: .leading,
                                         lineLimit: 1,
                                         isValid: true))
                continue
            }

            let validState = model.checkIsValid(for: dataInEachRow[i], rowIndex: index, columnIndex: i)
            if !validState.0 {
                self.numOfErrors += 1
            }

            if let currentItem = dataInEachRow[i] as? DataTableItemConvertion, let item = currentItem.convertToDataTableItem(rowIndex: index, columnIndex: i, contentWidth: contentWidth, textAlignment: textAlignment, isHeader: isHeader, isValid: validState.0) {
                res.append(item)
                
                if let uifont = item.uifont {
                    let firstBaselineHeight = uifont.lineHeight + uifont.descender
                    maxFirstBaselineHeight = max(maxFirstBaselineHeight, firstBaselineHeight)
                }
            }
        }
        
        return (res, maxFirstBaselineHeight)
    }
    
    func getTrailingAccessoryViewWidth() -> CGFloat {
        var width: CGFloat = 0
        width = self.rowData.reduce(0) { partialResult, row in
            if let accessory = row.trailingAccessory {
                if case .button = accessory { // it is a button
                    return max(partialResult, TableViewLayout.buttonSize)
                } else { // it is an icon
                    return max(partialResult, TableViewLayout.iconSize)
                }
            }
            
            return partialResult
        }
        
        if width > 0 {
            width += TableViewLayout.rightPaddingForLeadingAccessoryView(self.sizeClass)
        }
        
        return width
    }
    
    func getleadingAccessoryViewWidth() -> CGFloat {
        var width: CGFloat = 0
        var icons = 0
        var buttons = 0
        for row in self.rowData {
            var currentIcons = 0
            var currentButtons = 0
            for item in row.leadingAccessories {
                if case .button = item {
                    currentButtons += 1
                }
                if case .icon = item {
                    currentIcons += 1
                }
            }
            currentButtons += self.editMode == .select ? 1 : 0
            buttons = max(buttons, currentButtons)
            icons = max(icons, currentIcons)
        }
        
        width = CGFloat(buttons) * TableViewLayout.buttonSize + CGFloat(icons) * TableViewLayout.iconSize + CGFloat(max(0, buttons + icons - 1)) * TableViewLayout.accessorySpacing
        
        if width > 0 {
            width += TableViewLayout.rightPaddingForLeadingAccessoryView(self.sizeClass)
        }
        
        return width
    }
    
    /**
     columnWidth:
         .fixed: max(1, fixedWidth)
         .flexible: 48 pt -- 50%
         .infinity: 48 pt -- 50%, then fill the remaining space if possible
      */
    /// Calculate column widths based on allDataItems and fromLayoutData
    ///
    /// - Parameter fromLayoutData: use this to reduce some calculations
    /// - Parameter workItem: use this to check cancel status
    ///
    /// - Returns: widths for all columns
    func calcColumnWidths(fromLayoutData: LayoutData? = nil, workItem: DispatchWorkItem? = nil) -> [CGFloat] {
        let numberOfColumns = self.numberOfColumns()
        let numberOfRows = self.numberOfRows()
        if numberOfColumns < 1 || numberOfRows < 1 {
            return []
        }
        
        var tmpColumnWidths: [CGFloat] = []
        
        // first round, go through all columns without applying 50% rule
        for j in 0 ..< numberOfColumns {
            var maxItemWidth: CGFloat = 0
            
            if workItem?.isCancelled ?? false {
                return []
            }
            
            /// find max column width in all rows
            for i in 0 ..< numberOfRows {
                let currentItemWidth: CGFloat = self.cellWidth(rowIndex: i, columnIndex: j, containerWidth: self.size.width, applyMaxColumnWidthRule: false)
                maxItemWidth = max(maxItemWidth, currentItemWidth)
            }
            tmpColumnWidths.append(maxItemWidth)
        }
        
        if workItem?.isCancelled ?? false {
            return []
        }
        
        var allColumnWidth = tmpColumnWidths.reduce(0) { partialResult, width in
            partialResult + width
        }
        
        // by default, the first column will expand to fill the space
        let infinityIndex: Int = self.infinityColumnIndex()
        // all columns fit in the container width
        var totalWidth = self.leadingAccessoryViewWidth + self.trailingAccessoryViewWidth + allColumnWidth
        
        // totalWidth is less or equal than the container width so the infinity column needs to expand its width to fill th remaining space then return
        if totalWidth <= self.size.width {
            tmpColumnWidths[infinityIndex] += self.size.width - totalWidth
            return tmpColumnWidths
        }
        
        // second round
        // totalWidth is great than the container width: go through all columns with applying 50% rule
        for j in 0 ..< numberOfColumns {
            var maxItemWidth: CGFloat = 0
            
            if workItem?.isCancelled ?? false {
                return []
            }
            
            for i in 0 ..< numberOfRows {
                let currentItemWidth: CGFloat = self.cellWidth(rowIndex: i, columnIndex: j, containerWidth: self.size.width, applyMaxColumnWidthRule: true)
                maxItemWidth = max(maxItemWidth, currentItemWidth)
            }
            tmpColumnWidths[j] = maxItemWidth
        }
        
        // check it again, all columns fit in the container width
        allColumnWidth = tmpColumnWidths.reduce(0) { partialResult, width in
            partialResult + width
        }
        totalWidth = self.leadingAccessoryViewWidth + self.trailingAccessoryViewWidth + allColumnWidth
        if totalWidth <= self.size.width {
            tmpColumnWidths[infinityIndex] += self.size.width - totalWidth
            return tmpColumnWidths
        }
        
        return tmpColumnWidths
    }
    
    /// one cell change can cause the change of two column width. One is its column and other is the .infinity column
    func updateOneColumnWidth(for rowIndex: Int, columnIndex: Int) -> [CGFloat] {
        let numberOfColumns = self.numberOfColumns()
        let numberOfRows = self.numberOfRows()
        if numberOfColumns < 1 || numberOfRows < 1 {
            return []
        }
        
        var tmpColumnWidths: [CGFloat] = self.columnWidths
        
        // first round, go through all columns without applying 50% rule
        var maxItemWidth: CGFloat = 0
        
        /// find max column width in all rows
        for i in 0 ..< numberOfRows {
            let currentItemWidth: CGFloat = self.cellWidth(rowIndex: i, columnIndex: columnIndex, containerWidth: self.size.width, applyMaxColumnWidthRule: false)
            maxItemWidth = max(maxItemWidth, currentItemWidth)
        }
        tmpColumnWidths[columnIndex] = maxItemWidth
        
        var allColumnWidth = tmpColumnWidths.reduce(0) { partialResult, width in
            partialResult + width
        }
        // by default, the first column will expand to fill the space
        let infinityIndex: Int = self.infinityColumnIndex()
        // all columns fit in the container width
        var totalWidth = self.leadingAccessoryViewWidth + self.trailingAccessoryViewWidth + allColumnWidth
        
        // totalWidth is less or equal than the container width so the infinity column needs to expand its width to fill th remaining space then return
        if totalWidth <= self.size.width {
            tmpColumnWidths[infinityIndex] += self.size.width - totalWidth
            return tmpColumnWidths
        }
        
        // second round
        // totalWidth is great than the container width: go through all columns with applying 50% rule
        maxItemWidth = 0
        for i in 0 ..< numberOfRows {
            let currentItemWidth: CGFloat = self.cellWidth(rowIndex: i, columnIndex: columnIndex, containerWidth: self.size.width, applyMaxColumnWidthRule: true)
            maxItemWidth = max(maxItemWidth, currentItemWidth)
        }
        tmpColumnWidths[columnIndex] = maxItemWidth
        
        // check it again, all columns fit in the container width
        allColumnWidth = tmpColumnWidths.reduce(0) { partialResult, width in
            partialResult + width
        }
        totalWidth = self.leadingAccessoryViewWidth + self.trailingAccessoryViewWidth + allColumnWidth
        if totalWidth <= self.size.width {
            tmpColumnWidths[infinityIndex] += self.size.width - totalWidth
            return tmpColumnWidths
        }
        
        return tmpColumnWidths
    }
    
    /**
        .fixed: max(1, fixedWidth)
        .flexible: 48 pt --50%
        .infinity: 48 pt -- 50%, then fill the remaining space if possible
     */
    func cellWidth(rowIndex: Int, columnIndex: Int, containerWidth: CGFloat, applyMaxColumnWidthRule: Bool = true) -> CGFloat {
        let columnAttri = self.columnAttribute(for: columnIndex)
        switch columnAttri.width {
        case .fixed(let value):
            return max(1, value)
        default:
            break
        }
        
        let currentItem = self.allDataItems[rowIndex][columnIndex]
        let contentWidth = currentItem.size.width
        let maxColumnWidth: CGFloat = containerWidth > 0 ? containerWidth * TableViewLayout.maxColumnWidth : CGFloat(MAXFLOAT)
        let contentInset = self.cellContentInsets(for: rowIndex, columnIndex: columnIndex)
        let contentWidthWithPaddings: CGFloat = contentWidth + contentInset.horizontal
        
        return applyMaxColumnWidthRule ? min(maxColumnWidth, max(self.minColumnWidth, contentWidthWithPaddings)) : contentWidthWithPaddings
    }
    
    func cellContentInsets(for rowIndex: Int, columnIndex: Int) -> EdgeInsets {
        let isHeader = self.hasHeader && rowIndex == 0
        if let padding = headerCellPadding, isHeader {
            return padding
        }
        
        if let padding = dataCellPadding {
            if columnIndex == 0 {
                return EdgeInsets(top: padding.top, leading: 0, bottom: padding.bottom, trailing: padding.trailing)
            } else if columnIndex == numOfColumns - 1 {
                return EdgeInsets(top: padding.top, leading: padding.leading, bottom: padding.bottom, trailing: 0)
            } else {
                return padding
            }
        }
        
        let vPadding = isHeader ? TableViewLayout.topAndBottomPaddingsForHeader : TableViewLayout.topAndBottomPaddings
        let contentInset: CGFloat = TableViewLayout.contentInset(sizeClass: self.sizeClass)
        
        let numOfColumns = self.numberOfColumns()
        if numOfColumns < 1 {
            return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        } else if numOfColumns == 1 {
            return EdgeInsets(top: vPadding, leading: 0, bottom: vPadding, trailing: 0)
        } else {
            if columnIndex == 0 {
                return EdgeInsets(top: vPadding, leading: 0, bottom: vPadding, trailing: contentInset)
            } else if columnIndex == numOfColumns - 1 {
                return EdgeInsets(top: vPadding, leading: contentInset, bottom: vPadding, trailing: 0)
            } else {
                return EdgeInsets(top: vPadding, leading: contentInset, bottom: vPadding, trailing: contentInset)
            }
        }
    }
    
    /// Calculate row heights based on allDataItems, columnWidths and fromLayoutData
    ///
    /// - Parameter fromLayoutData: use this to reduce some calculations
    /// - Parameter workItem: use this to check cancel status
    ///
    /// - Returns: heights for all rows
    func calcRowHeights(fromLayoutData: LayoutData? = nil, workItem: DispatchWorkItem? = nil) -> [CGFloat] {
        var heights: [CGFloat] = []
    
        for rowIndex in self.allDataItems.indices {
            if workItem?.isCancelled ?? false {
                return []
            }
            
            // copy the height from fromLayoutData if these conditions are met
            if let ld = fromLayoutData, rowIndex < ld.allDataItems.count, rowIndex < ld.rowHeights.count, rowIndex < rowDataChanges.count, rowDataChanges[rowIndex] == 0, ld.columnWidths == self.columnWidths {
                heights.append(ld.rowHeights[rowIndex])
                continue
            }
            
            var itemHeight: CGFloat = 0
            
            for columnIndex in self.allDataItems[rowIndex].indices {
                if workItem?.isCancelled ?? false {
                    return []
                }
                
                let contentInset = self.cellContentInsets(for: rowIndex, columnIndex: columnIndex)
                let item = self.allDataItems[rowIndex][columnIndex]
                if let title = item.text, let uifont = item.uifont {
                    let contentWidth = self.columnWidths[columnIndex] - contentInset.horizontal
                    if contentWidth > 0 {
                        let numOfLines = item.lineLimit ?? 0
                        var size = title.boundingBoxSize(with: uifont, lineLimit: numOfLines, width: contentWidth)
                        if item.type == .listitem { // add a spacing and chevron's size
                            size.width += 15
                            size.height = max(size.height, 22)
                        }
                        // update cell height
                        self.allDataItems[rowIndex][columnIndex].rowHeight = size.height
                        itemHeight = max(size.height, itemHeight)
                        if self.rowAlignment == .baseline {
                            let baselineHeightOffset = self.firstBaselineHeights[rowIndex] - item.firstBaselineHeight
                            itemHeight += baselineHeightOffset
                        }
                    }
                } else if item.image != nil {
                    itemHeight = max(item.size.height, itemHeight)
                    // update cell height
                    self.allDataItems[rowIndex][columnIndex].rowHeight = item.size.height
                }
            }
            
            let verticalPadding = self.cellContentInsets(for: rowIndex, columnIndex: 0).vertical
            let rowHeight = max(itemHeight + verticalPadding, self.minRowHeight)
            heights.append(rowHeight)
        }
        
        return heights
    }
    
    /// only recalculate cells heights that its columnIndex is contained in the columnIndexes
    func updateRowHeights(for rowIndex: Int, columnIndexes: Set<Int>) -> [CGFloat] {
        var heights: [CGFloat] = self.rowHeights
    
        for rowIndex in self.allDataItems.indices {
            var itemHeight: CGFloat = 0
            
            for columnIndex in self.allDataItems[rowIndex].indices {
                if !columnIndexes.contains(columnIndex) {
                    itemHeight = max(self.allDataItems[rowIndex][columnIndex].rowHeight, itemHeight)
                    continue
                }
                
                let contentInset = self.cellContentInsets(for: rowIndex, columnIndex: columnIndex)
                let item = self.allDataItems[rowIndex][columnIndex]
                if let title = item.text, let uifont = item.uifont {
                    let contentWidth = self.columnWidths[columnIndex] - contentInset.horizontal
                    if contentWidth > 0 {
                        let numOfLines = item.lineLimit ?? 0
                        var size = title.boundingBoxSize(with: uifont, lineLimit: numOfLines, width: contentWidth)
                        if item.type == .listitem { // add a spacing and chevron's size
                            size.width += 15
                            size.height = max(size.height, 22)
                        }
                        // update cell height
                        self.allDataItems[rowIndex][columnIndex].rowHeight = size.height
                        itemHeight = max(size.height, itemHeight)
                        if self.rowAlignment == .baseline {
                            let baselineHeightOffset = self.firstBaselineHeights[rowIndex] - item.firstBaselineHeight
                            itemHeight += baselineHeightOffset
                        }
                    }
                } else if item.image != nil {
                    itemHeight = max(item.size.height, itemHeight)
                }
            }
            
            let verticalPadding = self.cellContentInsets(for: rowIndex, columnIndex: 0).vertical
            let rowHeight = max(itemHeight + verticalPadding, self.minRowHeight)
            heights[rowIndex] = rowHeight
        }
        
        return heights
    }
    
    /**
        Steps:
        1. update that column width: one cell change can cause the change of two column width. One is its column and other is the .infinity column
        2. update all rows height (only recalculate cells heights that its columnIndex is contained in the columnIndexes)
        3. update positions
     */
    func updateCellLayout(for rowIndex: Int, columnIndex: Int) {
        let origColumnWidths = self.columnWidths
        self.columnWidths = self.updateOneColumnWidth(for: rowIndex, columnIndex: columnIndex)
        let infinityIndex: Int = self.infinityColumnIndex()
        var changedColumns: Set<Int> = [columnIndex]
        if origColumnWidths.count > infinityIndex, abs(origColumnWidths[infinityIndex].distance(to: self.columnWidths[infinityIndex])) > 0.1 {
            changedColumns.insert(infinityIndex)
        }
        self.rowHeights = self.updateRowHeights(for: rowIndex, columnIndexes: changedColumns)
        self.allDataItems = self.updatedItemsPos()
    }
    
    func updatedItemsPos() -> [[DataTableItem]] {
        let numOfColumns = self.numberOfColumns()
        let numOfRows = self.numberOfRows()
        
        var items = self.allDataItems
        var heightSoFar: CGFloat = 0
        
        for i in 0 ..< numOfRows {
            let posY = heightSoFar + self.rowHeights[i] / 2
            heightSoFar += self.rowHeights[i]
            var widthSoFar: CGFloat = 0
            
            for j in 0 ..< numOfColumns {
                var item = items[i][j]
                let posX = widthSoFar + self.columnWidths[j] / 2
                widthSoFar += self.columnWidths[j]
                item.x(posX)
                item.y(posY)
                items[i][j] = item
            }
        }
        
        return items
    }
    
    func infinityColumnIndex() -> Int {
        // by default, the first column will expand to fill the space
        var infinityIndex = 0
        for (index, columnAttribute) in self.columnAttributes.enumerated() {
            switch columnAttribute.width {
            case .infinity:
                infinityIndex = index
                
            default:
                continue
            }
        }
        
        return infinityIndex
    }
    
    func copyCacheData(_ layoutData: LayoutData?) {
        guard let ld = layoutData else { return }
        
        self.hasHeader = ld.hasHeader
        self.rowData = ld.rowData
        self.columnAttributes = ld.columnAttributes
        self.allDataItems = ld.allDataItems
        self.firstBaselineHeights = ld.firstBaselineHeights
        self.numOfErrors = ld.numOfErrors
    }
    
    func multipleLineTextSize(text: String, font: UIFont, numberOfLines: Int, width: CGFloat) -> CGSize {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: width, height: 2000)
        label.text = text
        label.font = font
        label.numberOfLines = numberOfLines
        label.textColor = .black
        
        let sizeToFit = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let tmpTextSize = label.sizeThatFits(sizeToFit)
        let textSize = CGSize(width: max(1, min(width, tmpTextSize.width)), height: tmpTextSize.height)
    
        return textSize
    }
}

extension String {
    func boundingBoxSize(with font: UIFont, lineLimit: Int = 0, width: CGFloat = CGFloat(MAXFLOAT), height: CGFloat = CGFloat(MAXFLOAT)) -> CGSize {
        let targetWidth = lineLimit == 1 ? 10000 : width
        let size = (self as NSString).boundingRect(with: CGSize(width: targetWidth, height: height),
                                                   options: .usesLineFragmentOrigin,
                                                   attributes: [NSAttributedString.Key.font: font],
                                                   context: nil).size

        if lineLimit == 0 {
            return size
        } else if lineLimit == 1 {
            if size.width < width {
                return size
            } else {
                return CGSize(width: width, height: size.height)
            }
        }
        
        // lineLimit > 1
        let fontSize = font.pointSize
        let lineHeight = font.lineHeight
        let tmpLineSpacing = font.lineHeight / fontSize
        let numberOfLines = Int(0.1 + (size.height + tmpLineSpacing) / (font.lineHeight + tmpLineSpacing))
        
        if Int(numberOfLines) <= lineLimit || numberOfLines <= 1 {
            return size
        }
    
        let lineSpacing2 = (size.height - CGFloat(numberOfLines) * lineHeight) / CGFloat(numberOfLines - 1)
        let lineSpacing = lineSpacing2 > tmpLineSpacing ? lineSpacing2 : tmpLineSpacing
        let height = CGFloat(lineLimit) * lineHeight + lineSpacing * (CGFloat(lineLimit) - 1)
        
        return CGSize(width: size.width, height: height)
    }
}

/**
  Convert SwiftUI Font to UIFont using Swift's reflection API
  Three types of SwiftUI Font conversion is supported. It includes system fonts, custom fonts and Fiori fonts.
 `DataTable` use UIFont to meaure a String's bounding box
  */

/// used to store UIFont properties dumped from SwiftUI Font
class UIFontInfo {
    /// used to create UIFont other than Fiori fonts
    var fontDescriptor: UIFontDescriptor
    
    /// below properties are used to create a Fiori font
    var isItalic: Bool
    var isBold: Bool
    var isCondensed: Bool
    var fontSize: CGFloat?
    var textStyle: UIFont.TextStyle?
    var weight: UIFont.Weight?
    
    init(fontDescriptor: UIFontDescriptor, isItalic: Bool = false, isBold: Bool = false, isCondensed: Bool = false, fontSize: CGFloat? = nil, textStyle: UIFont.TextStyle? = nil, weight: UIFont.Weight? = nil) {
        self.fontDescriptor = fontDescriptor
        self.isItalic = isItalic
        self.isBold = isBold
        self.isCondensed = isCondensed
        self.fontSize = fontSize
        self.textStyle = textStyle
        self.weight = weight
    }
}

protocol FontProvider {
    func fontInfo(with traitCollection: UITraitCollection?) -> UIFontInfo
}

extension FontProvider {
    func font(with traitCollection: UITraitCollection?) -> UIFont {
        let fi = fontInfo(with: traitCollection)
        let fd = fi.fontDescriptor
        let attributes = fd.fontAttributes
        
        // fiori fonts
        if let fontName = attributes[.name] as? String, fontName.prefix(2) == "72" {
            var isCondensed = fi.isCondensed
            var weight = UIFont.Weight.regular
            if let traits = attributes[.traits] as? NSDictionary, let tmpWeight = traits[UIFontDescriptor.TraitKey.weight] as? UIFont.Weight {
                weight = tmpWeight
            }
            
            if fontName.prefix(12).caseInsensitiveCompare("72-condensed") == .orderedSame {
                isCondensed = true
            }
            
            if fi.isBold, weight.rawValue < UIFont.Weight.bold.rawValue {
                weight = .bold
            }
            
            if let style = fi.textStyle {
                return UIFont.preferredFioriFont(forTextStyle: style, weight: weight.fiori72Weight, isItalic: fi.isItalic, isCondensed: isCondensed)
            } else {
                return UIFont.preferredFioriFont(fixedSize: fi.fontSize ?? 12, weight: weight.fiori72Weight, isItalic: fi.isItalic, isCondensed: isCondensed)
            }
        } else { // other fonts
            return UIFont(descriptor: fd, size: 0)
        }
    }
}

protocol FontModifier {
    func modify(_ fontInfo: inout UIFontInfo)
}

protocol StaticFontModifier: FontModifier {
    init()
}

struct SystemProvider: FontProvider {
    var size: CGFloat
    var design: UIFontDescriptor.SystemDesign?
    var weight: UIFont.Weight?
    
    func fontInfo(with traitCollection: UITraitCollection?) -> UIFontInfo {
        var fd = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .body, compatibleWith: traitCollection)
            .addingAttributes([
                .size: self.size
            ])
        
        if let design = design, let tmpFd = fd.withDesign(design) {
            fd = tmpFd
        }
        
        if let weight = weight {
            fd = fd.addingAttributes([UIFontDescriptor.AttributeName.traits: [UIFontDescriptor.TraitKey.weight: weight]])
            return UIFontInfo(fontDescriptor: fd, weight: weight)
        }
        
        return UIFontInfo(fontDescriptor: fd, fontSize: self.size, weight: self.weight)
    }
}

struct TextStyleProvider: FontProvider {
    var textStyle: UIFont.TextStyle?
    var design: UIFontDescriptor.SystemDesign?
    var weight: UIFont.Weight?
    
    func fontInfo(with traitCollection: UITraitCollection?) -> UIFontInfo {
        var fd = UIFontDescriptor.preferredFontDescriptor(withTextStyle: self.textStyle ?? .body, compatibleWith: traitCollection)
        if let design = design, let tmpFd = fd.withDesign(design) {
            fd = tmpFd
        }

        if let weight = weight {
            fd = fd.addingAttributes([UIFontDescriptor.AttributeName.traits: [UIFontDescriptor.TraitKey.weight: weight]])
            return UIFontInfo(fontDescriptor: fd, textStyle: self.textStyle, weight: weight)
        }
        
        return UIFontInfo(fontDescriptor: fd, textStyle: self.textStyle, weight: self.weight)
    }
}

struct NamedProvider: FontProvider {
    var name: String
    var size: CGFloat
    var textStyle: UIFont.TextStyle?
    
    func fontInfo(with traitCollection: UITraitCollection?) -> UIFontInfo {
        if let textStyle = textStyle, size <= 34 {
            let metrics = UIFontMetrics(forTextStyle: textStyle)
            let fd = UIFontDescriptor(fontAttributes: [
                .name: name,
                .size: metrics.scaledValue(for: self.size, compatibleWith: traitCollection)
            ])
            
            return UIFontInfo(fontDescriptor: fd, textStyle: textStyle)
        } else {
            let fd = UIFontDescriptor(fontAttributes: [
                .name: name,
                .size: size
            ])
            
            return UIFontInfo(fontDescriptor: fd, fontSize: self.size)
        }
    }
}

struct StaticModifierProvider<M: StaticFontModifier>: FontProvider {
    var base: FontProvider
    
    func fontInfo(with traitCollection: UITraitCollection?) -> UIFontInfo {
        var info = self.base.fontInfo(with: traitCollection)

        M().modify(&info)

        return info
    }
}

struct WeightModifierProvider: FontProvider {
    var base: FontProvider
    var weight: UIFont.Weight?
    
    init(base: FontProvider, weight: UIFont.Weight?) {
        self.base = base
        self.weight = weight
    }
    
    func fontInfo(with traitCollection: UITraitCollection?) -> UIFontInfo {
        let info = self.base.fontInfo(with: traitCollection)
        info.fontDescriptor = info.fontDescriptor.addingAttributes([.traits: [UIFontDescriptor.TraitKey.weight: self.weight]])
        info.weight = self.weight
        
        return info
    }
}

struct WidthModifierProvider: FontProvider {
    var base: FontProvider
    var isCondensed: Bool
    
    init(base: FontProvider, isCondensed: Bool = false) {
        self.base = base
        self.isCondensed = isCondensed
    }
    
    func fontInfo(with traitCollection: UITraitCollection?) -> UIFontInfo {
        let info = self.base.fontInfo(with: traitCollection)
//        info.fontDescriptor = info.fontDescriptor.addingAttributes([.traits: [UIFontDescriptor.TraitKey.weight: weight]])
        info.isCondensed = self.isCondensed
//
        return info
//        base.fontInfo(with: traitCollection)
    }
}

struct ItalicModifier: StaticFontModifier {
    init() {}

    func modify(_ fontInfo: inout UIFontInfo) {
        if let fd = fontInfo.fontDescriptor.withSymbolicTraits(.traitItalic) {
            fontInfo.fontDescriptor = fd
        }
        fontInfo.isItalic = true
    }
}

struct BoldModifier: StaticFontModifier {
    init() {}

    func modify(_ fontInfo: inout UIFontInfo) {
        if let fd = fontInfo.fontDescriptor.withSymbolicTraits(.traitBold) {
            fontInfo.fontDescriptor = fd
        }
        fontInfo.isBold = true
    }
}

/**
 Convert SwiftUI Font to UIFont using Swift's reflection API
 */
extension UIFont {
    class func resolveFontProvider(_ provider: Any) -> FontProvider? {
        let mirror = Mirror(reflecting: provider)

        switch String(describing: type(of: provider)) {
        case "StaticModifierProvider<ItalicModifier>":
            guard let base = mirror.descendant("base", "provider", "base") else {
                return nil
            }

            return self.resolveFontProvider(base).map(StaticModifierProvider<ItalicModifier>.init)
            
        case "StaticModifierProvider<BoldModifier>":
            guard let base = mirror.descendant("base", "provider", "base") else {
                return nil
            }
            
            return self.resolveFontProvider(base).map(StaticModifierProvider<BoldModifier>.init)
        
        case "ModifierProvider<WidthModifier>":
            guard let base = mirror.descendant("base", "provider", "base") else {
                return nil
            }
            
            if let widthValue = mirror.descendant("modifier", "width") as? CGFloat {
                #if swift(>=5.7.1)
                    if #available(iOS 16.0, watchOS 9.0, *) {
                        if abs(widthValue - Font.Width.condensed.value) < 0.01 {
                            if let provider = resolveFontProvider(base) {
                                return WidthModifierProvider(base: provider, isCondensed: true)
                            } else {
                                return nil
                            }
                        }
                    }
                #endif
            }

            return self.resolveFontProvider(base)
            
        case "ModifierProvider<WeightModifier>":
            guard let base = mirror.descendant("base", "provider", "base") else {
                return nil
            }
            
            var weight = UIFont.Weight.regular
            if let weightValue = mirror.descendant("modifier", "weight", "value") as? CGFloat {
                let tmpWeight = UIFont.Weight(rawValue: weightValue)
                weight = tmpWeight
            }

            if let provider = resolveFontProvider(base) {
                return WeightModifierProvider(base: provider, weight: weight)
            } else {
                return nil
            }
            
        case "SystemProvider":
            guard let size = mirror.descendant("size") as? CGFloat else {
                return nil
            }
            
            var uiDesign: UIFontDescriptor.SystemDesign?
            if let design = mirror.descendant("design") as? Font.Design {
                uiDesign = design.uiDesign
            }
            var uiWeight: UIFont.Weight?
            if let weight = mirror.descendant("weight") as? Font.Weight {
                uiWeight = weight.uiWeight
            }

            return SystemProvider(size: size, design: uiDesign, weight: uiWeight)
            
        case "TextStyleProvider":
            guard let textStyle = mirror.descendant("style") as? Font.TextStyle else {
                return nil
            }
            
            var uiDesign: UIFontDescriptor.SystemDesign?
            if let design = mirror.descendant("design") as? Font.Design {
                uiDesign = design.uiDesign
            }
            var uiWeight: UIFont.Weight?
            if let weight = mirror.descendant("weight") as? Font.Weight {
                uiWeight = weight.uiWeight
            }
            
            return TextStyleProvider(textStyle: textStyle.uiTextStyle, design: uiDesign, weight: uiWeight)
            
        case "NamedProvider":
            guard let name = mirror.descendant("name") as? String,
                  let size = mirror.descendant("size") as? CGFloat
            else {
                return nil
            }

            var style: UIFont.TextStyle?
            if let textStyle = mirror.descendant("textStyle") as? Font.TextStyle {
                style = textStyle.uiTextStyle
            }
            
            return NamedProvider(name: name, size: size, textStyle: style)
            
        default:
            // Not exhaustive, more providers need to be handled here.
            return nil
        }
    }
    
    class func resolveFont(_ font: Font) -> FontProvider? {
        let mirror = Mirror(reflecting: font)
        guard let provider = mirror.descendant("provider", "base") else {
            return nil
        }

        return self.resolveFontProvider(provider)
    }

    /// Convert a SwiftUI font to a UIKit UIFont
    /// Three types of SwiftUI Font conversion is supported. It includes system fonts, custom fonts and Fiori fonts.
    /// In some cases, the converted UIFont may be slightly different than the original SwiftUI font.
    ///
    /// -- parameter font: The SwiftUI Font
    /// -- parameter traitCollection: The traitCollection used to create UIFont
    ///
    /// - returns: an UIFont
    public class func preferredFont(from font: Font, traitCollection: UITraitCollection? = nil) -> UIFont {
        self.resolveFont(font)?.font(with: traitCollection) ?? UIFont.preferredFioriFont(forTextStyle: .body)
    }
}

extension UIFont {
    /// Get `Fiori` preferred font based on a given `UIFontTextStyle`. This is a scaled font.
    ///
    /// Supported attributes: `Regular`, `Italic`, `Light`, `Bold`, `BoldItalic`, `Black`, `Condensed`, `CondensedBold`.
    ///
    /// - parameter textStyle: The `UIFontTextStyle` text style
    /// - parameter weight: The weight of the font.
    /// - parameter isItalic: The italic version of the font.
    /// - parameter isConsensed: The condensed version of the font.
    ///
    /// - returns: The font object with specified attributes.
    class func preferredFioriFont(forTextStyle textStyle: UIFont.TextStyle, weight: UIFont.Weight = .regular, isItalic: Bool = false, isCondensed: Bool = false) -> UIFont {
        var symbolicTraits: UIFontDescriptor.SymbolicTraits = []
        if isItalic {
            symbolicTraits.formUnion(.traitItalic)
        } else if isCondensed {
            symbolicTraits.formUnion(.traitCondensed)
        }

        var traits: [UIFontDescriptor.TraitKey: Any] = [.symbolic: symbolicTraits.rawValue]
        var fontAttributes: [UIFontDescriptor.AttributeName: Any] = [:]
        if UIFont.is72FontsAvailable {
            traits[.weight] = weight.getFioriWeight(isItalic: isItalic, isCondensed: isCondensed)
            fontAttributes[.family] = "72"
            fontAttributes[.size] = textStyle.size
        } else {
            traits[.weight] = weight
            fontAttributes = UIFontDescriptor.preferredFontDescriptor(withTextStyle: textStyle).fontAttributes
        }
        fontAttributes[.traits] = traits

        let font = UIFont(descriptor: UIFontDescriptor(fontAttributes: fontAttributes), size: 0)
        if !UIFont.is72FontsAvailable {
            return font
        }
        
        let metrics: UIFontMetrics
        if textStyle == .KPI || textStyle == .largeKPI {
            metrics = UIFontMetrics(forTextStyle: .largeTitle)
        } else {
            metrics = UIFontMetrics(forTextStyle: textStyle)
        }

        let scaledFont = metrics.scaledFont(for: font)
        return scaledFont
    }
    
    /// Get `Fiori` preferred font with a given size. Not a scaled font.
    ///
    /// Supported attributes: `Regular`, `Italic`, `Light`, `Bold`, `BoldItalic`, `Black`, `Condensed`, `CondensedBold`.
    ///
    /// - parameter textStyle: The `UIFontTextStyle` text style
    /// - parameter weight: The weight of the font.
    /// - parameter isItalic: The italic version of the font.
    /// - parameter isConsensed: The condensed version of the font.
    ///
    /// - returns: The font object with fixed size.
    class func preferredFioriFont(fixedSize size: CGFloat, weight: UIFont.Weight = .regular, isItalic: Bool = false, isCondensed: Bool = false) -> UIFont {
        var symbolicTraits: UIFontDescriptor.SymbolicTraits = []
        if isItalic {
            symbolicTraits.formUnion(.traitItalic)
        } else if isCondensed {
            symbolicTraits.formUnion(.traitCondensed)
        }

        var traits: [UIFontDescriptor.TraitKey: Any] = [.symbolic: symbolicTraits.rawValue]
        var fontAttributes: [UIFontDescriptor.AttributeName: Any] = [:]
        if UIFont.is72FontsAvailable {
            traits[.weight] = weight.getFioriWeight(isItalic: isItalic, isCondensed: isCondensed)
            fontAttributes[.family] = "72"
        } else {
            traits[.weight] = weight
            fontAttributes = UIFont.systemFont(ofSize: size).fontDescriptor.fontAttributes
        }
        fontAttributes[.size] = size
        fontAttributes[.traits] = traits

        let font = UIFont(descriptor: UIFontDescriptor(fontAttributes: fontAttributes), size: 0)
        return font
    }
}
 
extension UIFont {
    // Check if 72 fonts are registed.
    static var is72FontsAvailable: Bool {
        UIFont.familyNames.contains("72")
    }
}

extension UIFont.TextStyle {
    /// KPI text style.
    static let KPI = UIFont.TextStyle(rawValue: "com.sap.sdk.ios.SAPFiori.TextStyle.KPI")
    
    /// Large KPI text style.
    static let largeKPI = UIFont.TextStyle(rawValue: "com.sap.sdk.ios.SAPFiori.TextStyle.largeKPI")
}

extension UIFont.TextStyle {
    var size: CGFloat {
        switch self {
        case .largeTitle:
            return 34
        case .title1:
            return 28
        case .title2:
            return 22
        case .title3:
            return 20
        case .headline:
            return 17
        case .body:
            return 17
        case .callout:
            return 16
        case .subheadline:
            return 15
        case .footnote:
            return 13
        case .caption1:
            return 12
        case .caption2:
            return 11
        case .largeKPI:
            return 48
        case .KPI:
            return 36
        default:
            return 17
        }
    }
}

extension UIFont.Weight {
    func getFioriWeight(isItalic: Bool, isCondensed: Bool) -> UIFont.Weight {
        isItalic ? self.italicWeight : (isCondensed ? self.condensedWeight : self.fioriWeight)
    }
    
    // Available 72 weights
    private var fioriWeight: UIFont.Weight {
        switch self {
        case .heavy, .black:
            return .black
        case .medium, .semibold, .bold:
            return .bold
        case .regular:
            return .regular
        case .ultraLight, .thin, .light:
            return .light
        default:
            return .regular
        }
    }
    
    private var italicWeight: UIFont.Weight {
        switch self.fioriWeight {
        case .black, .bold:
            return .bold
        default:
            return .regular
        }
    }
    
    private var condensedWeight: UIFont.Weight {
        switch self.fioriWeight {
        case .black, .bold:
            return .bold
        default:
            return .regular
        }
    }
    
    // Available 72 weights
    var fiori72Weight: UIFont.Weight {
        if rawValue >= 0.56 { // heavy & black; use black
            return .black
        } else if rawValue >= 0.23 { // .medium, .semibold, .bold; use bold
            return .bold
        } else if rawValue < 0 { // .ultraLight, .thin, .light; use light
            return .light
        } else { // regular
            return .regular
        }
    }
    
    var fioriDescription: String {
        let name: String
        
        switch self {
        case .black:
            name = "black"
        case .heavy:
            name = "heavy"
        case .bold:
            name = "bold"
        case .semibold:
            name = "semibold"
        case .medium:
            name = "medium"
        case .regular:
            name = "regular"
        case .light:
            name = "light"
        case .thin:
            name = "thin"
        case .ultraLight:
            name = "ultraLight"
        default:
            name = "Unknown"
        }
        
        return name
    }
}

extension Font.TextStyle {
    var uiTextStyle: UIFont.TextStyle {
        switch self {
        case .largeTitle:
            return UIFont.TextStyle.largeTitle
        case .title:
            return UIFont.TextStyle.title1
        case .title2:
            return UIFont.TextStyle.title2
        case .title3:
            return UIFont.TextStyle.title3
        case .headline:
            return UIFont.TextStyle.headline
        case .subheadline:
            return UIFont.TextStyle.subheadline
        case .body:
            return UIFont.TextStyle.body
        case .callout:
            return UIFont.TextStyle.callout
        case .footnote:
            return UIFont.TextStyle.footnote
        case .caption:
            return UIFont.TextStyle.caption1
        case .caption2:
            return UIFont.TextStyle.caption2
        @unknown default:
            return UIFont.TextStyle.body
        }
    }
}

extension Font.Weight {
    var uiWeight: UIFont.Weight {
        switch self {
        case .ultraLight:
            return UIFont.Weight.ultraLight
        case .thin:
            return UIFont.Weight.thin
        case .light:
            return UIFont.Weight.light
        case .regular:
            return UIFont.Weight.regular
        case .medium:
            return UIFont.Weight.medium
        case .semibold:
            return UIFont.Weight.semibold
        case .bold:
            return UIFont.Weight.bold
        case .heavy:
            return UIFont.Weight.heavy
        case .black:
            return UIFont.Weight.black
        default:
            return UIFont.Weight.regular
        }
    }
}

extension Font.Design {
    var uiDesign: UIFontDescriptor.SystemDesign {
        switch self {
        case .default:
            return UIFontDescriptor.SystemDesign.default
        case .monospaced:
            return UIFontDescriptor.SystemDesign.monospaced
        case .rounded:
            return UIFontDescriptor.SystemDesign.rounded
        case .serif:
            return UIFontDescriptor.SystemDesign.serif
        default:
            return UIFontDescriptor.SystemDesign.default
        }
    }
}
