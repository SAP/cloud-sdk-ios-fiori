import Foundation
import SwiftUI
import UIKit

extension TableLayoutManager {
    // swiftlint:disable cyclomatic_complexity
    func layout(size: CGSize) {
        // either the layout is finished or in progress
        if (self.size.width == size.width && !self.model.needsCalculateLayout && self.layoutData != nil && self.layoutWorkItem == nil)
            || (self.size.width == size.width && self.layoutWorkItem != nil)
        {
            return
        }

        if self.size != size {
            self.size = size
        }
        let needToInitModel = self.cacheLayoutData == nil || self.model.needsCalculateLayout
        if needToInitModel {
            self.cacheLayoutData = nil
        }
        
        let model = self.model
        
        var newWorkItem: DispatchWorkItem?
        newWorkItem = DispatchWorkItem {
            let tmpLayoutData = LayoutData()
            tmpLayoutData.isEditing = model.isEditing
            tmpLayoutData.sizeClass = self.sizeClass
            tmpLayoutData.size = size
            tmpLayoutData.headerCellPadding = model.headerCellPadding
            tmpLayoutData.dataCellPadding = model.dataCellPadding
            tmpLayoutData.minRowHeight = model.minRowHeight
            tmpLayoutData.minColumnWidth = model.minColumnWidth
            tmpLayoutData.rowAlignment = model.rowAlignment
            
            if newWorkItem?.isCancelled ?? true {
                return
            }
            if needToInitModel {
                tmpLayoutData.rowData = tmpLayoutData.initRowData(model: model)
                let (di, fbh) = tmpLayoutData.initItems(model: model, workItem: newWorkItem)
                tmpLayoutData.allDataItems = di
                tmpLayoutData.firstBaselineHeights = fbh
            } else {
                tmpLayoutData.copyCacheData(self.cacheLayoutData)
            }
            if newWorkItem?.isCancelled ?? true {
                return
            }
            tmpLayoutData.leadingAccessoryViewWidth = tmpLayoutData.getleadingAccessoryViewWidth()
            
            if newWorkItem?.isCancelled ?? true {
                return
            }
            tmpLayoutData.trailingAccessoryViewWidth = tmpLayoutData.getTrailingAccessoryViewWidth()
             
            if newWorkItem?.isCancelled ?? true {
                return
            }
            tmpLayoutData.columnWidths = tmpLayoutData.getColumnWidths(workItem: newWorkItem)
            
            if newWorkItem?.isCancelled ?? true {
                return
            }
            tmpLayoutData.rowHeights = tmpLayoutData.getRowHeights(workItem: newWorkItem)
            
            if newWorkItem?.isCancelled ?? true {
                return
            }
            tmpLayoutData.allDataItems = tmpLayoutData.updatedItemsPos()
            
            DispatchQueue.main.async {
                self.layoutData = tmpLayoutData
                self.cacheLayoutData = tmpLayoutData
                self.layoutWorkItem = nil
                self.resetPosition()
                if needToInitModel {
                    self.selectedIndexes = self.model.selectedIndexes
                }
                if self.model.needsCalculateLayout {
                    self.model.needsCalculateLayout = false
                }
            }
        }
        
        layoutWorkItem?.cancel()
        layoutWorkItem = newWorkItem
        DispatchQueue.global(qos: .userInteractive).async(execute: newWorkItem!)
    }
    
    /// Asks the DataTable to calculate and return the size that best fits all rows & columns by giving a size.width (the passed size.height is ignored).
    /// Warning: it is a sync process so it may take long time if the DataTable has a lot of rows and columns.
    func sizeThatFits(_ size: CGSize) -> CGSize {
        /// content size for NoDataView
        if self.model.isNoData {
            let str = NSLocalizedString("There is nothing to display yet", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
            let strSize = str.boundingBoxSize(with: UIFont.preferredFont(forTextStyle: .body), lineLimit: 0, width: size.width > 0 ? size.width : CGFloat(MAXFLOAT))
            
            return CGSize(width: strSize.width + 32, height: strSize.height + 71)
        }
        
        if let cachedLD = cacheLayoutDataForMeasurement, cachedLD.size.width == size.width, cachedLD.sizeClass == self.sizeClass {
            let width = self.totalContentWidth(cachedLD, false)
            let height = self.self.totalContentHeight(cachedLD, false)
            
            return CGSize(width: width, height: height)
        }
        
        let tmpLayoutData = LayoutData()
        let needToInitModel = self.cacheLayoutDataForMeasurement == nil || self.cacheLayoutDataForMeasurement?.sizeClass != self.sizeClass
        
        if needToInitModel {
            self.cacheLayoutDataForMeasurement = nil
        }
        
        let model = self.model
        
        tmpLayoutData.isEditing = model.isEditing
        tmpLayoutData.sizeClass = self.sizeClass
        tmpLayoutData.size = size
        tmpLayoutData.headerCellPadding = model.headerCellPadding
        tmpLayoutData.dataCellPadding = model.dataCellPadding
        tmpLayoutData.minRowHeight = model.minRowHeight
        tmpLayoutData.minColumnWidth = model.minColumnWidth
        tmpLayoutData.rowAlignment = model.rowAlignment
        
        if needToInitModel {
            tmpLayoutData.rowData = tmpLayoutData.initRowData(model: model)
            let (di, fbh) = tmpLayoutData.initItems(model: model, workItem: nil)
            tmpLayoutData.allDataItems = di
            tmpLayoutData.firstBaselineHeights = fbh
        } else {
            tmpLayoutData.copyCacheData(self.cacheLayoutDataForMeasurement)
        }
        
        tmpLayoutData.leadingAccessoryViewWidth = tmpLayoutData.getleadingAccessoryViewWidth()
        tmpLayoutData.trailingAccessoryViewWidth = tmpLayoutData.getTrailingAccessoryViewWidth()
        tmpLayoutData.columnWidths = tmpLayoutData.getColumnWidths(workItem: nil)
        tmpLayoutData.rowHeights = tmpLayoutData.getRowHeights(workItem: nil)
        tmpLayoutData.allDataItems = tmpLayoutData.updatedItemsPos()
        self.cacheLayoutDataForMeasurement = tmpLayoutData
        
        let width = self.totalContentWidth(tmpLayoutData, false)
        let height = self.totalContentHeight(tmpLayoutData, false)

        return CGSize(width: width, height: height)
    }
    
    func getListItems() -> [AnyView] {
        var items: [AnyView] = []
        let rows = self.model.rowData
        for row in rows {
            let view = self.makeObjectView(row: row)
            items.append(AnyView(view))
        }
        
        return items
    }
    
    func makeObjectView(row: TableRowItem) -> some View {
        let items = row.data
        var textBindings: [ObjectViewProperty.Text: AnyView] = [:]
        var imageBindings: [ObjectViewProperty.Image: AnyView] = [:]
        for item in items {
            switch item {
            case is DataTextItem:
                if let _item = item as? DataTextItem, let binding = _item.binding {
                    textBindings[binding] = AnyView(_item.toTextView())
                }
            case is DataImageItem:
                if let _item = item as? DataImageItem, let binding = _item.binding {
                    imageBindings[binding] = AnyView(_item.image)
                }
            default:
                break
            }
        }
        
        return Group {
            if textBindings.count == 2 && textBindings.keys.contains(.title) && textBindings.keys.contains(.subtitle) {
                ObjectItem {
                    textBindings[.title]
                } subtitle: {
                    textBindings[.subtitle]
                }
            } else {
                ObjectItem {
                    textBindings[.title]
                } subtitle: {
                    textBindings[.subtitle]
                } footnote: {
                    textBindings[.footnote]
                } status: {
                    textBindings[.status] ?? imageBindings[.statusImage]
                } substatus: {
                    textBindings[.substatus] ?? imageBindings[.substatusImage]
                } detailImage: {
                    imageBindings[.detailImage]?.frame(width: 45, height: 45, alignment: .center)
                } icons: {
                    self.generateIconStack(icons: row.leadingAccessories)
                }
            }
        }
    }
    
    func generateIconStack(icons: [AccessoryItem]) -> some View {
        ForEach(0 ..< icons.count, id: \.self) { i in
            switch icons[i] {
            case .button(let button):
                Button(action: button.action) {
                    HStack {
                        Text(button.title ?? "")
                        button.image
                    }
                }
            case .icon(let value):
                value
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(TableViewLayout.defaultForegroundColor)
                    .frame(width: 16, height: 16, alignment: .center)
            }
        }
    }
    
    func visibleRowAndColumnIndexes() -> ([Int], [Int]) {
        guard let ld = layoutData else { return ([], []) }
        
        if model.needsCalculateLayout {
            return ([], [])
        }
        
        let numbOfColumns = self.numberOfColumns()
        let numbOfRows = self.numberOfRows()
        
        if numbOfColumns == 0 || numbOfRows == 0 {
            return ([], [])
        }
        
        let width: CGFloat = size.width
        
        let tmpStartPosition = self.startPosition(size: size)
        let wUnit = self.widthPointInUnit(size: size)
        let startPosX = tmpStartPosition.x / wUnit // * width

        let height = size.height
        let hUnit = self.heightPointInUnit(size: size)
        let startPosY = tmpStartPosition.y / hUnit // * height
        
        var tempStartX: CGFloat = 0
        var xStartIndex: Int = 0
        var xEndIndex: Int = numbOfColumns - 1
        var foundStartIndex = false
        for (index, w) in ld.columnWidths.enumerated() {
            tempStartX += (w * self.scaleX)
            if !foundStartIndex, tempStartX > startPosX {
                xStartIndex = index
                foundStartIndex = true
            }
            
            if foundStartIndex, tempStartX >= (startPosX + width) {
                xEndIndex = index
                break
            }
        }
        
        foundStartIndex = false
        var tempStartY: CGFloat = 0
        var yStartIndex: Int = 0
        var yEndIndex: Int = numbOfRows - 1
        for (index, h) in ld.rowHeights.enumerated() {
            tempStartY += (h * self.scaleY)
            if !foundStartIndex, tempStartY > startPosY {
                yStartIndex = index
                foundStartIndex = true
            }
            
            if foundStartIndex, tempStartY >= (startPosY + height) {
                yEndIndex = index
                break
            }
        }
        
        let indexRangeOfRows = yStartIndex ... yEndIndex
        let indexRangeOfColumn = xStartIndex ... xEndIndex
        var indexOfRows: [Int] = indexRangeOfRows.sorted()
        var indexOfColumns: [Int] = indexRangeOfColumn.sorted()
        
        if self.model.isHeaderSticky, !indexOfRows.contains(0) {
            indexOfRows.append(0)
        }
        
        if self.model.isFirstColumnSticky, !indexOfColumns.contains(0) {
            indexOfColumns.append(0)
        }
        
        return (indexOfRows, indexOfColumns)
    }
    
    func scaleX(size: CGSize) -> CGFloat {
        self.scaleX
    }
    
    func scaleY(size: CGSize) -> CGFloat {
        self.scaleX
    }
    
    func startPosition(size: CGSize) -> CGPoint {
        let pos = self.centerPosition(size: size)
        let x = pos.x - self.widthPointInUnit(size: size) * size.width / 2
        let y = pos.y - self.heightPointInUnit(size: size) * size.height / 2
        
        return CGPoint(x: x, y: y)
    }
    
    func startPositionInPoint(size: CGSize) -> CGPoint {
        let pos = self.centerPosition(size: size)
        let wUnit = self.widthPointInUnit(size: size)
        let hUnit = self.heightPointInUnit(size: size)
        let x = pos.x - wUnit * size.width / 2
        let y = pos.y - hUnit * size.height / 2
        
        return CGPoint(x: x / wUnit, y: y / hUnit)
    }
    
    func centerPosition(from startPosition: CGPoint, size: CGSize) -> CGPoint {
        let x = (startPosition.x + size.width / 2) * self.widthPointInUnit(size: size)
        let y = (startPosition.y + size.height / 2) * self.heightPointInUnit(size: size)
        
        return CGPoint(x: x, y: y)
    }
    
    /// scale is not a factor
    func contentWidth(_ layoutData: LayoutData? = nil) -> CGFloat {
        let tmpLd = layoutData != nil ? layoutData : self.layoutData
        guard let ld = tmpLd else { return 1 }
        
        let allColumnWidth = ld.columnWidths.reduce(0) { partialResult, width in
            partialResult + width
        }
        
        let totalWidth = max(1, allColumnWidth)
        return totalWidth
    }
    
    /// scale is not a factor
    func contentHeight(_ layoutData: LayoutData? = nil) -> CGFloat {
        let tmpLd = layoutData != nil ? layoutData : self.layoutData
        guard let ld = tmpLd else { return 1 }
        
        let rowHeight = ld.rowHeights.reduce(0) { partialResult, height in
            partialResult + height
        }
        let totalHeight = max(1, rowHeight)
        
        return totalHeight
    }
    
    func widthPointInUnit(size: CGSize) -> CGFloat {
        let totalWidth = max(size.width, self.contentWidth()) * self.scaleX(size: size)
        
        return 1 / totalWidth
    }
    
    func heightPointInUnit(size: CGSize) -> CGFloat {
        let totalHeight = max(size.height, self.contentHeight()) * self.scaleX(size: size)
        
        return 1 / totalHeight
    }
    
    /// view size is a factor
    func totalContentWidth(_ layoutData: LayoutData? = nil, _ isMaxValue: Bool = true) -> CGFloat {
        let tmpLd = layoutData != nil ? layoutData : self.layoutData
        guard let ld = tmpLd else { return 0 }
        let totalContentWidth = (ld.leadingAccessoryViewWidth + ld.trailingAccessoryViewWidth + self.contentWidth(ld)) * self.scaleX(size: size)
        
        return isMaxValue ? max(size.width, totalContentWidth) : totalContentWidth
    }
    
    /// view size is a factor
    func totalContentHeight(_ layoutData: LayoutData? = nil, _ isMaxValue: Bool = true) -> CGFloat {
        let height = self.contentHeight(layoutData) * self.scaleY(size: size)
        
        return isMaxValue ? max(size.height, height) : height
    }
    
    func validCenterPosition(pt: CGPoint, size: CGSize) -> CGPoint {
        if layoutData == nil {
            return CGPoint(x: 0.5, y: 0.5)
        }
    
        let wUnit = self.widthPointInUnit(size: size)
        let minX = size.width * wUnit / 2
        let totalWidth = self.totalContentWidth()
        let maxX = (totalWidth - size.width / 2) * wUnit
        
        let hUnit = self.heightPointInUnit(size: size)
        let minY = size.height * hUnit / 2
        let totalHeight = self.totalContentHeight()
        let maxY = (totalHeight - size.height / 2) * hUnit
        
        let x = max(minX, min(maxX, pt.x))
        let y = max(minY, min(maxY, pt.y))
        
        return CGPoint(x: x, y: y)
    }
    
    func centerPosition(size: CGSize) -> CGPoint {
        if let pos = self.centerPosition {
            return pos
        } else {
            let x = size.width * self.widthPointInUnit(size: size) / 2
            let y = size.height * self.heightPointInUnit(size: size) / 2
            
            return CGPoint(x: x, y: y)
        }
    }
}
