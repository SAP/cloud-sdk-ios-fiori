import Foundation
import SwiftUI
import UIKit

extension TableLayoutManager {
    // swiftlint:disable cyclomatic_complexity force_unwrapping function_body_length
    func createLayoutWorkItem(_ size: CGSize) {
        let needToInitModel = cacheLayoutData == nil || needsCalculateLayout
        var newWorkItem: DispatchWorkItem?
        let tmpLayoutData = LayoutData()
        tmpLayoutData.size = size
        workingLayoutData = tmpLayoutData
        
        newWorkItem = DispatchWorkItem {
            tmpLayoutData.editMode = self.model.editMode
            tmpLayoutData.sizeClass = self.sizeClass
            tmpLayoutData.dynamicTypeSize = self.dynamicTypeSize
            tmpLayoutData.size = size
            tmpLayoutData.headerCellPadding = self.model.headerCellPadding
            tmpLayoutData.dataCellPadding = self.model.dataCellPadding
            tmpLayoutData.minRowHeight = self.model.minRowHeight
            tmpLayoutData.minColumnWidth = self.model.minColumnWidth
            tmpLayoutData.rowAlignment = self.model.rowAlignment
            tmpLayoutData.rowDataChanges = self.model.rowDataChanges
            
            if newWorkItem?.isCancelled ?? true {
                return
            }
            
            if needToInitModel {
                tmpLayoutData.rowData = tmpLayoutData.initRowData(model: self.model)
                /// minimize efforts to init items by using layoutData with rowDataChanges
                let (di, fbh) = tmpLayoutData.initItems(model: self.model, fromLayoutData: self.layoutData, workItem: newWorkItem)
                tmpLayoutData.allDataItems = di
                tmpLayoutData.firstBaselineHeights = fbh
            } else {
                if let tmpLd = self.layoutData, self.model.editMode == .inline {
                    tmpLayoutData.copyCacheData(tmpLd)
                } else {
                    tmpLayoutData.copyCacheData(self.cacheLayoutData)
                }
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
            tmpLayoutData.columnWidths = tmpLayoutData.calcColumnWidths(fromLayoutData: self.layoutData, workItem: newWorkItem)
            if newWorkItem?.isCancelled ?? true {
                return
            }
            tmpLayoutData.rowHeights = tmpLayoutData.calcRowHeights(fromLayoutData: self.layoutData, workItem: newWorkItem)
            if newWorkItem?.isCancelled ?? true {
                return
            }
            tmpLayoutData.allDataItems = tmpLayoutData.updatedItemsPos()
            
            DispatchQueue.main.async {
                if self.cacheLayoutData == nil || self.model.editMode != .inline || (tmpLayoutData.allDataItems.count > (self.cacheLayoutData?.allDataItems.count ?? 0)) {
                    self.cacheLayoutData = tmpLayoutData.copy()
                }
                
                if needToInitModel {
                    self.selectedIndexes = self.model.selectedIndexes
                }
                if self.needsCalculateLayout {
                    self.needsCalculateLayout = false
                }
                
                self.workingLayoutData = nil
                self.layoutWorkItem = nil
                if self.currentCell != nil {
                    self.currentCell = nil
                }
                self.cacheEditingText = nil
                
                // check if prev startPosition is valid
                let tmpPos = self.validStartPosition(pt: self.startPosition, size: self.size)
                if self.startPosition != tmpPos {
                    self.startPosition = tmpPos
                }
                
                var errMsg: String?
                if tmpLayoutData.numOfErrors > 0 {
                    let errFormat = NSLocalizedString("There are %d errors in the data table.", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
                    errMsg = String(format: errFormat, tmpLayoutData.numOfErrors)
                }
                self.isValid = (tmpLayoutData.numOfErrors > 0 ? true : false, errMsg)
                
                self.layoutData = tmpLayoutData
                self.model.layoutManager = self
                self.model.rowDataChanges = []
            }
        }
        
        self.layoutWorkItem?.cancel()
        self.layoutWorkItem = newWorkItem
        layoutQueue.async(execute: newWorkItem!)
    }
    
    func layout(_ size: CGSize) {
        if size.width <= 0 || size.height <= 0 {
            return
        }
        
        if self.size != size {
            self.size = size
        }
        
        // redo layout
        if self.needsCalculateLayout, workingLayoutData == nil || (workingLayoutData != nil && workingLayoutData!.rowDataChanges != self.model.rowDataChanges) {
            self.createLayoutWorkItem(size)
            return
        }
        
        if let ld = layoutData, ld.size.width == size.width {
            return
        }
        
        // use cacheLayoutDataForMeasurement
        if let ld = cacheLayoutDataForMeasurement, ld.size.width == size.width {
            DispatchQueue.main.async {
                if self.cacheLayoutData == nil || self.model.editMode != .inline {
                    self.cacheLayoutData = ld.copy()
                }
                
                if self.needsCalculateLayout {
                    self.needsCalculateLayout = false
                }
                
                self.workingLayoutData = nil
                self.layoutWorkItem = nil
                if self.currentCell != nil {
                    self.currentCell = nil
                }
                
                self.layoutData = ld
                // check if prev startPosition is valid
                let tmpPos = self.validStartPosition(pt: self.startPosition, size: self.size)
                if self.startPosition != tmpPos {
                    self.startPosition = tmpPos
                }
                self.model.layoutManager = self
            }
            
            return
        }
        
        if (workingLayoutData?.size ?? .zero).width == size.width {
            return
        } else {
            self.createLayoutWorkItem(size)
        }
        // there is one ongoing layout process, continue it
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
        
        if let cachedLD = cacheLayoutDataForMeasurement, cachedLD.size.width == size.width, cachedLD.sizeClass == self.sizeClass, cachedLD.dynamicTypeSize == self.dynamicTypeSize {
            let width = self.totalContentWidth(cachedLD, false)
            let height = self.totalContentHeight(cachedLD, false)
            
            return CGSize(width: width, height: height)
        }
        
        let tmpLayoutData = LayoutData()
        let needToInitModel = self.cacheLayoutDataForMeasurement == nil || self.cacheLayoutDataForMeasurement?.sizeClass != self.sizeClass
        
        if needToInitModel {
            self.cacheLayoutDataForMeasurement = nil
        }
        
        let model = self.model
        
        tmpLayoutData.editMode = model.editMode
        tmpLayoutData.sizeClass = self.sizeClass
        tmpLayoutData.dynamicTypeSize = self.dynamicTypeSize
        tmpLayoutData.size = size
        tmpLayoutData.headerCellPadding = model.headerCellPadding
        tmpLayoutData.dataCellPadding = model.dataCellPadding
        tmpLayoutData.minRowHeight = model.minRowHeight
        tmpLayoutData.minColumnWidth = model.minColumnWidth
        tmpLayoutData.rowAlignment = model.rowAlignment
        
        if needToInitModel {
            tmpLayoutData.rowData = tmpLayoutData.initRowData(model: model)
            let (di, fbh) = tmpLayoutData.initItems(model: model)
            tmpLayoutData.allDataItems = di
            tmpLayoutData.firstBaselineHeights = fbh
        } else {
            tmpLayoutData.copyCacheData(self.cacheLayoutDataForMeasurement)
        }
        
        tmpLayoutData.leadingAccessoryViewWidth = tmpLayoutData.getleadingAccessoryViewWidth()
        tmpLayoutData.trailingAccessoryViewWidth = tmpLayoutData.getTrailingAccessoryViewWidth()
        tmpLayoutData.columnWidths = tmpLayoutData.calcColumnWidths()
        tmpLayoutData.rowHeights = tmpLayoutData.calcRowHeights()
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
                    textBindings[binding] = _item.toView() // AnyView(_item.toTextView())
                }
            case is DataImageItem:
                if let _item = item as? DataImageItem, let binding = _item.binding {
                    imageBindings[binding] = _item.toView() // AnyView(_item.image)
                }
            default:
                break
            }
        }
        
        return Group {
            if textBindings.count == 2, textBindings.keys.contains(.title), textBindings.keys.contains(.subtitle) {
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
        
        let numbOfColumns = self.numberOfColumns()
        let numbOfRows = self.numberOfRows()
        
        if numbOfColumns == 0 || numbOfRows == 0 {
            return ([], [])
        }
        
        let width: CGFloat = size.width
        let startPosX = self.startPosition.x
        
        let height = size.height
        let startPosY = self.startPosition.y
        
        var tempStartX: CGFloat = 0
        var xStartIndex = 0
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
        var yStartIndex = 0
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
        
        /// add the row 0 to the end so it can be displayed on top of other rows
        if self.model.isHeaderSticky {
            if let index = indexOfRows.firstIndex(of: 0) {
                indexOfRows.remove(at: index)
            }
            
            indexOfRows.append(0)
        }
        
        /// add the column 0 to the end so it can be displayed on top of other columns
        if self.model.isFirstColumnSticky {
            if let index = indexOfColumns.firstIndex(of: 0) {
                indexOfColumns.remove(at: index)
            }
            
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
    
    // check if pt as startPosition is valid; if not return the valid pos
    func validStartPosition(pt: CGPoint, size: CGSize) -> CGPoint {
        if layoutData == nil {
            return .zero
        }

        let totalWidth = self.totalContentWidth()
        let maxX = totalWidth - size.width
        
        let totalHeight = self.totalContentHeight()
        let maxY = totalHeight - size.height
        
        let x = max(0, min(maxX, pt.x))
        let y = max(0, min(maxY, pt.y))
        
        return CGPoint(x: x, y: y)
    }
}
