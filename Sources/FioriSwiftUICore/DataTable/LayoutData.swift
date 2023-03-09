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
    
    var rowData: [TableRowItem] = []
    
    var columnAttributes: [ColumnAttribute] = []
    
    var rowAlignment: RowAlignment = .top
    
    var allDataItems: [[DataTableItem]] = []
    
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
    
    func initItems(model: TableModel, workItem: DispatchWorkItem?) -> ([[DataTableItem]], [CGFloat]) {
        let numbOfRows = self.numberOfRows()
        var res: [[DataTableItem]] = []
        var maxFirstBaselineHeights = [CGFloat]()
        // reset it
        numOfErrors = 0
        for i in 0 ..< numbOfRows {
            if workItem?.isCancelled ?? false {
                return ([[]], [])
            }
            
            let (items, maxFirstBaselineHeight) = self.createDataItemForRow(model: model, at: i, workItem: workItem)
            res.append(items)
            maxFirstBaselineHeights.append(maxFirstBaselineHeight)
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
    func getColumnWidths(workItem: DispatchWorkItem?) -> [CGFloat] {
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
    
    func getRowHeights(workItem: DispatchWorkItem?) -> [CGFloat] {
        var heights: [CGFloat] = []
    
        for rowIndex in self.allDataItems.indices {
            if workItem?.isCancelled ?? false {
                return []
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
        var infinityIndex: Int = 0
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

extension UIFont {
    class func preferredFont(from font: Font) -> UIFont {
        let uiFont: UIFont

        if #available(iOS 14.0, *) {
            switch font {
            /// fiori font
            case .fiori(forTextStyle: .largeTitle):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .largeTitle)
            case .fiori(forTextStyle: .title1):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .title1)
            case .fiori(forTextStyle: .title2):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .title2)
            case .fiori(forTextStyle: .title3):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .title3)
            case .fiori(forTextStyle: .headline):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .headline)
            case .fiori(forTextStyle: .body):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .body)
            case .fiori(forTextStyle: .callout):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .callout)
            case .fiori(forTextStyle: .subheadline):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .subheadline)
            case .fiori(forTextStyle: .footnote):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .footnote)
            case .fiori(forTextStyle: .caption1):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .caption1)
            case .fiori(forTextStyle: .caption2):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .caption2)
            case .fiori(forTextStyle: .KPI):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .KPI)
            case .fiori(forTextStyle: .largeKPI):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .largeKPI)

            /// fiori condensed font
            case .fioriCondensed(forTextStyle: .largeTitle):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .largeTitle, isCondensed: true)
            case .fioriCondensed(forTextStyle: .title1):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .title1, isCondensed: true)
            case .fioriCondensed(forTextStyle: .title2):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .title2, isCondensed: true)
            case .fioriCondensed(forTextStyle: .title3):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .title3, isCondensed: true)
            case .fioriCondensed(forTextStyle: .headline):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .headline, isCondensed: true)
            case .fioriCondensed(forTextStyle: .body):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .body, isCondensed: true)
            case .fioriCondensed(forTextStyle: .callout):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .callout, isCondensed: true)
            case .fioriCondensed(forTextStyle: .subheadline):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .subheadline, isCondensed: true)
            case .fioriCondensed(forTextStyle: .footnote):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .footnote, isCondensed: true)
            case .fioriCondensed(forTextStyle: .caption1):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .caption1, isCondensed: true)
            case .fioriCondensed(forTextStyle: .caption2):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .caption2, isCondensed: true)
            case .fioriCondensed(forTextStyle: .KPI):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .KPI, isCondensed: true)
            case .fioriCondensed(forTextStyle: .largeKPI):
                uiFont = UIFont.preferredFioriFont(forTextStyle: .largeKPI, isCondensed: true)
                
            /// system font
            case .largeTitle:
                uiFont = UIFont.preferredFont(forTextStyle: .largeTitle)
            case .title:
                uiFont = UIFont.preferredFont(forTextStyle: .title1)
            case .title2:
                uiFont = UIFont.preferredFont(forTextStyle: .title2)
            case .title3:
                uiFont = UIFont.preferredFont(forTextStyle: .title3)
            case .headline:
                uiFont = UIFont.preferredFont(forTextStyle: .headline)
            case .subheadline:
                uiFont = UIFont.preferredFont(forTextStyle: .subheadline)
            case .callout:
                uiFont = UIFont.preferredFont(forTextStyle: .callout)
            case .caption:
                uiFont = UIFont.preferredFont(forTextStyle: .caption1)
            case .caption2:
                uiFont = UIFont.preferredFont(forTextStyle: .caption2)
            case .footnote:
                uiFont = UIFont.preferredFont(forTextStyle: .footnote)
                
            default:
                uiFont = UIFont.preferredFioriFont(forTextStyle: .body)
            }
        } else {
            uiFont = UIFont.preferredFioriFont(forTextStyle: .body)
        }

        return uiFont
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
        guard var font = UIFont(name: get72FontName(weight: weight.fioriWeight), size: textStyle.size) else {
            var font = UIFont.preferredFont(forTextStyle: textStyle).withWeight(weight)
            
            if isItalic {
                font = font.italic
            }
            if isCondensed {
                font = font.with(.traitCondensed)
            }
            
            return font
        }
        
        let metrics: UIFontMetrics
        if textStyle == .KPI || textStyle == .largeKPI {
            metrics = UIFontMetrics(forTextStyle: .largeTitle)
        } else {
            metrics = UIFontMetrics(forTextStyle: textStyle)
        }
        
        if isItalic {
            font = font.italic
        }
        if isCondensed {
            font = font.with(.traitCondensed)
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
        guard var font = UIFont(name: get72FontName(weight: weight.fioriWeight), size: size) else {
            var font = UIFont.systemFont(ofSize: size, weight: weight)
            
            if isItalic {
                font = font.italic
            }
            if isCondensed {
                font = font.with(.traitCondensed)
            }
            
            return font
        }
        
        if isItalic {
            font = font.italic
        }
        if isCondensed {
            font = font.with(.traitCondensed)
        }
        
        return font
    }
    
    static func get72FontName(weight: UIFont.Weight) -> String {
        let description: String
        
        switch weight {
        case .black:
            description = "black"
        case .heavy:
            description = "heavy"
        case .bold:
            description = "bold"
        case .semibold:
            description = "semibold"
        case .medium:
            description = "medium"
        case .regular:
            description = "regular"
        case .light:
            description = "light"
        case .thin:
            description = "thin"
        case .ultraLight:
            description = "ultraLight"
        default:
            description = "Unknown"
        }

        if weight == .black {
            return "72\(description)"
        }
        
        return "72-\(description)"
    }
}

extension UIFont {
    var bold: UIFont {
        self.with(.traitBold)
    }

    var italic: UIFont {
        self.with(.traitItalic)
    }

    var boldItalic: UIFont {
        self.with([.traitBold, .traitItalic])
    }

    func with(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits).union(self.fontDescriptor.symbolicTraits)) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }

    func without(_ traits: UIFontDescriptor.SymbolicTraits...) -> UIFont {
        guard let descriptor = self.fontDescriptor.withSymbolicTraits(self.fontDescriptor.symbolicTraits.subtracting(UIFontDescriptor.SymbolicTraits(traits))) else {
            return self
        }
        return UIFont(descriptor: descriptor, size: 0)
    }
    
    func withWeight(_ weight: UIFont.Weight) -> UIFont {
        let newDescriptor = fontDescriptor.addingAttributes([.traits: [UIFontDescriptor.TraitKey.weight: weight]])
        return UIFont(descriptor: newDescriptor, size: 0)
    }
}
 
public extension UIFont.TextStyle {
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
    // Available 72 weights
    var fioriWeight: UIFont.Weight {
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
}
