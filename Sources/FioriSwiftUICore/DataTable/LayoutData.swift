import Foundation
import SwiftUI

class LayoutData {
    var size: CGSize = .zero
    
    var sizeClass: UserInterfaceSizeClass = .compact

    var isEditing: Bool = false
    
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
        for i in 0 ..< numbOfRows {
            if workItem?.isCancelled ?? true {
                return ([[]], [])
            }
            
            let (items, maxFirstBaselineHeight) = self.createDataItemForRow(model: model, at: i, workItem: workItem)
            res.append(items)
            maxFirstBaselineHeights.append(maxFirstBaselineHeight)
        }
        
        return (res, maxFirstBaselineHeights)
    }
    
    func createDataItemForRow(model: TableModel, at index: Int, workItem: DispatchWorkItem?) -> ([DataTableItem], CGFloat) {
        let numOfColumns = self.numberOfColumns()
        
        let dataInEachRow = self.rowData[index].data
        let isHeader: Bool = index == 0 && self.hasHeader
        
        var maxFirstBaselineHeight: CGFloat = 0
        var res: [DataTableItem] = []
        for i in 0 ..< numOfColumns {
            if workItem?.isCancelled ?? true {
                return ([], 0)
            }
            
            var contentWidth = CGFloat(MAXFLOAT)
            var textAlignment: TextAlignment = .leading
            if self.columnAttributes.indices.contains(i) {
                textAlignment = self.columnAttributes[i].textAlignment
                switch self.columnAttributes[i].width {
                case .fixed(let value):
                    contentWidth = max(1, value)
                default:
                    contentWidth = CGFloat(MAXFLOAT)
                }
            }
            
            let contentInset = self.cellContentInsets(for: index, columnIndex: i)
            contentWidth -= contentInset.horizontal * 2
            
            // miss the data item fill with a empty text
            if !dataInEachRow.indices.contains(i) {
                res.append(DataTableItem(index: index,
                                         columnIndex: i,
                                         value: .text(""),
                                         pos: .zero,
                                         font: Font.body,
                                         foregroundColor: .clear,
                                         size: .zero,
                                         textAlignment: .leading,
                                         lineLimit: 1))
                continue
            }
            let currentItem = dataInEachRow[i]
            
            switch currentItem.type {
            case .text:
                guard let item = currentItem as? DataTextItem else {
                    break
                }
                
                let title = item.text
                var uifont: UIFont
                if let tmpUIFont = item.uifont {
                    uifont = tmpUIFont
                } else if let _font = item.font {
                    uifont = UIFont.preferredFont(from: _font)
                } else {
                    uifont = TableViewLayout.defaultUIFont(isHeader)
                }
                let firstBaselineHeight = uifont.lineHeight + uifont.descender
                maxFirstBaselineHeight = max(maxFirstBaselineHeight, firstBaselineHeight)
                let textColor = item.textColor ?? TableViewLayout.defaultFontColor(isHeader)
                var size: CGSize = .zero
                if contentWidth > 0 {
                    size = title.boundingBoxSize(with: uifont, width: contentWidth, height: CGFloat(MAXFLOAT))
                }
                
                let font = item.font ?? TableViewLayout.defaultFont(isHeader)
                res.append(DataTableItem(index: index,
                                         columnIndex: i,
                                         value: .text(title),
                                         firstBaselineHeight: firstBaselineHeight,
                                         pos: .zero,
                                         font: font,
                                         uifont: item.uifont,
                                         foregroundColor: textColor,
                                         size: size,
                                         textAlignment: textAlignment,
                                         lineLimit: item.lineLimit))
            case .image:
                guard let item = (currentItem as? DataImageItem) else {
                    break
                }
                res.append(DataTableItem(index: index,
                                         columnIndex: i,
                                         value: .image(item.image),
                                         pos: .zero,
                                         font: nil,
                                         foregroundColor: item.tintColor,
                                         size: CGSize(width: TableViewLayout.imageSize, height: TableViewLayout.imageSize),
                                         textAlignment: textAlignment))
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
            currentButtons += self.isEditing ? 1 : 0
            buttons = max(buttons, currentButtons)
            icons = max(icons, currentIcons)
        }
        
        width = CGFloat(buttons) * TableViewLayout.buttonSize + CGFloat(icons) * TableViewLayout.iconSize + CGFloat(max(0, buttons + icons - 1)) * TableViewLayout.accessorySpacing
        
        if width > 0 {
            width += TableViewLayout.rightPaddingForLeadingAccessoryView(self.sizeClass)
        }
        
        return width
    }
    
    func getColumnWidths(workItem: DispatchWorkItem?) -> [CGFloat] {
        let numberOfColumns = self.numberOfColumns()
        let numberOfRows = self.numberOfRows()
        if numberOfColumns < 1 || numberOfRows < 1 {
            return []
        }
        
        var columnWidths: [CGFloat] = []
        
        // first round
        for j in 0 ..< numberOfColumns {
            var maxItemWidth: CGFloat = 0
            
            if workItem?.isCancelled ?? true {
                return []
            }
            
            for i in 0 ..< numberOfRows {
                let currentItemWidth: CGFloat = self.cellWidth(rowIndex: i, columnIndex: j, containerWidth: self.size.width, applyMaxColumnWidthRule: false)
                maxItemWidth = max(maxItemWidth, currentItemWidth)
            }
            columnWidths.append(maxItemWidth)
        }
        
        if workItem?.isCancelled ?? true {
            return []
        }
        
        var allColumnWidth = columnWidths.reduce(0) { partialResult, width in
            partialResult + width
        }
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
        
        // all columns fit in the container width
        var totalWidth = self.leadingAccessoryViewWidth + self.trailingAccessoryViewWidth + allColumnWidth
        if totalWidth <= self.size.width {
            columnWidths[infinityIndex] += self.size.width - totalWidth
            self.columnWidths = columnWidths
            return columnWidths
        }
        
        // second round
        for j in 0 ..< numberOfColumns {
            var maxItemWidth: CGFloat = 0
            
            if workItem?.isCancelled ?? true {
                return []
            }
            
            for i in 0 ..< numberOfRows {
                let currentItemWidth: CGFloat = self.cellWidth(rowIndex: i, columnIndex: j, containerWidth: self.size.width, applyMaxColumnWidthRule: true)
                maxItemWidth = max(maxItemWidth, currentItemWidth)
            }
            columnWidths[j] = maxItemWidth
        }
        
        // check it again, all columns fit in the container width
        allColumnWidth = columnWidths.reduce(0) { partialResult, width in
            partialResult + width
        }
        totalWidth = self.leadingAccessoryViewWidth + self.trailingAccessoryViewWidth + allColumnWidth
        if totalWidth <= self.size.width {
            columnWidths[infinityIndex] += self.size.width - totalWidth
            self.columnWidths = columnWidths
            return columnWidths
        }
        
        return columnWidths
    }
    
    func cellWidth(rowIndex: Int, columnIndex: Int, containerWidth: CGFloat, applyMaxColumnWidthRule: Bool = true) -> CGFloat {
        if self.columnAttributes.indices.contains(columnIndex) {
            let columnAttri = self.columnAttributes[columnIndex]
            
            switch columnAttri.width {
            case .fixed(let value):
                return max(1, value)
            default:
                break
            }
        }
        
        let currentItem = self.allDataItems[rowIndex][columnIndex]
        let contentWidth = currentItem.size.width
        let maxColumnWidth: CGFloat = containerWidth * TableViewLayout.maxColumnWidth
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
            if workItem?.isCancelled ?? true {
                return []
            }
            
            var itemHeight: CGFloat = 0
            let isHeader = self.hasHeader && rowIndex == 0
            
            for columnIndex in self.allDataItems[rowIndex].indices {
                if workItem?.isCancelled ?? true {
                    return []
                }
                
                let contentInset = self.cellContentInsets(for: rowIndex, columnIndex: columnIndex)
                let item = self.allDataItems[rowIndex][columnIndex]
                switch item.value {
                case .text(let title):
                    var uifont: UIFont
                    if let tmpUIFont = item.uifont {
                        uifont = tmpUIFont
                    } else if let _font = item.font {
                        uifont = UIFont.preferredFont(from: _font)
                    } else {
                        uifont = TableViewLayout.defaultUIFont(isHeader)
                    }
             
                    let contentWidth = self.columnWidths[columnIndex] - contentInset.horizontal
                    if contentWidth > 0 {
                        let numOfLines = item.lineLimit ?? 0
                        var size = CGSize.zero
                        DispatchQueue.main.sync {
                            let tmpSize = multipleLineTextSize(text: title, font: uifont, numberOfLines: numOfLines, width: contentWidth)
                            
                            DispatchQueue.global(qos: .userInteractive).sync {
                                size = tmpSize
                            }
                        }

                        itemHeight = max(size.height, itemHeight)
                        if self.rowAlignment == .baseline {
                            let baselineHeightOffset = self.firstBaselineHeights[rowIndex] - item.firstBaselineHeight
                            itemHeight += baselineHeightOffset
                        }
                    }
                    
                case .image:
                    itemHeight = max(item.size.height, itemHeight)
                }
            }
            
            let verticalPadding = self.cellContentInsets(for: rowIndex, columnIndex: 0).vertical
            let rowHeight = max(itemHeight + verticalPadding, self.minRowHeight)
            heights.append(rowHeight)
        }
        
        return heights
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
    
    func copyCacheData(_ layoutData: LayoutData?) {
        guard let ld = layoutData else { return }
        
        self.hasHeader = ld.hasHeader
        self.rowData = ld.rowData
        self.columnAttributes = ld.columnAttributes
        self.allDataItems = ld.allDataItems
        self.firstBaselineHeights = ld.firstBaselineHeights
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
    func boundingBoxSize(with font: UIFont, width: CGFloat = CGFloat(MAXFLOAT), height: CGFloat = CGFloat(MAXFLOAT)) -> CGSize {
        let size = (self as NSString)
            .boundingRect(with: CGSize(width: width, height: height),
                          options: .usesLineFragmentOrigin,
                          attributes: [NSAttributedString.Key.font: font],
                          context: nil).size

        return size
    }
}

extension UIFont {
    class func preferredFont(from font: Font) -> UIFont {
        let uiFont: UIFont

        if #available(iOS 14.0, *) {
            switch font {
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
                uiFont = UIFont.preferredFont(forTextStyle: .body)
            }
        } else {
            uiFont = UIFont.preferredFont(forTextStyle: .body)
        }

        return uiFont
    }
}
