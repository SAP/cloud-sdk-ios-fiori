import Foundation
import SwiftUI
import UIKit

extension TableLayoutManager {
    // swiftlint:disable cyclomatic_complexity force_unwrapping function_body_length
    func createLayoutWorkItem(_ size: CGSize) {
        let needToInitModel = cacheLayoutData == nil || needsCalculateLayout
        if needToInitModel, cacheLayoutData != nil {
            self.cacheLayoutData = nil
        }

        var newWorkItem: DispatchWorkItem?
        let tmpLayoutData = LayoutData()
        tmpLayoutData.size = size
        workingLayoutData = tmpLayoutData
        
        newWorkItem = DispatchWorkItem {
            tmpLayoutData.editMode = self.model.editMode
            tmpLayoutData.sizeClass = self.sizeClass
            tmpLayoutData.size = size
            tmpLayoutData.headerCellPadding = self.model.headerCellPadding
            tmpLayoutData.dataCellPadding = self.model.dataCellPadding
            tmpLayoutData.minRowHeight = self.model.minRowHeight
            tmpLayoutData.minColumnWidth = self.model.minColumnWidth
            tmpLayoutData.rowAlignment = self.model.rowAlignment
            
            if newWorkItem?.isCancelled ?? true {
                return
            }
            if needToInitModel {
                tmpLayoutData.rowData = tmpLayoutData.initRowData(model: self.model)
                let (di, fbh) = tmpLayoutData.initItems(model: self.model, workItem: newWorkItem)
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
                if self.cacheLayoutData == nil || self.model.editMode != .inline {
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
                self.currentCell = nil
                self.layoutData = tmpLayoutData
                // check if prev startPosition is valid
                let tmpPos = self.validStartPosition(pt: self.startPosition, size: self.size)
                if self.startPosition != tmpPos {
                    self.startPosition = tmpPos
                }
                self.model.layoutManager = self
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
        
        if let ld = layoutData, ld.size.width == size.width {
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
        
        tmpLayoutData.editMode = model.editMode
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
        
        let tmpStartPosition = self.startPosition
        let wUnit = self.widthPointInUnit(size: size)
        let startPosX = tmpStartPosition.x / wUnit // * width

        let height = size.height
        let hUnit = self.heightPointInUnit(size: size)
        let startPosY = tmpStartPosition.y / hUnit // * height
        
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

    /*
         func startPosition(size: CGSize) -> CGPoint {
     //        let pos = self.centerPosition(size: size)
     //        let x = pos.x - self.widthPointInUnit(size: size) * size.width / 2
     //        let y = pos.y - self.heightPointInUnit(size: size) * size.height / 2
     //
     //        return CGPoint(x: x, y: y)
             return startPosition
         }
         */
    
    /// contentOffset: x:  0 ~ contentWidth;  y: 0 ~ contentHeight
    func startPosition(from contentOffset: CGPoint) -> CGPoint {
        let contentSizeWidth = self.totalContentWidth()
        let contentSizeHeight = self.totalContentHeight()
        
        return CGPoint(x: contentOffset.x / contentSizeWidth, y: contentOffset.y / contentSizeHeight)
    }
    
    func convertUnitPointToContentPoint(_ pt: CGPoint, size: CGSize) -> CGPoint {
        let wUnit = self.widthPointInUnit(size: size)
        let hUnit = self.heightPointInUnit(size: size)
        
        return CGPoint(x: pt.x / wUnit, y: pt.y / hUnit)
    }
    
    func startPositionInPoint(size: CGSize) -> CGPoint {
        let pos = self.startPosition
        let wUnit = self.widthPointInUnit(size: size)
        let hUnit = self.heightPointInUnit(size: size)
        
        return CGPoint(x: pos.x / wUnit, y: pos.y / hUnit)
    }
    
    /**
     startPosition is in point
     */
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
//        let totalWidth = max(size.width, self.contentWidth()) * self.scaleX(size: size)
        let totalWidth = max(1, totalContentWidth())
        
        return 1 / totalWidth
    }
    
    func heightPointInUnit(size: CGSize) -> CGFloat {
//        let totalHeight = max(size.height, self.contentHeight()) * self.scaleX(size: size)
        let totalHeight = max(1, totalContentHeight())
        
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
    
    // check if pt as startPosition is valid; if not return the valid pos
    func validStartPosition(pt: CGPoint, size: CGSize) -> CGPoint {
        if layoutData == nil {
            return .zero
        }
    
        let wUnit = self.widthPointInUnit(size: size)
        let totalWidth = self.totalContentWidth()
        let maxX = (totalWidth - size.width) * wUnit
        
        let hUnit = self.heightPointInUnit(size: size)
        let totalHeight = self.totalContentHeight()
        let maxY = (totalHeight - size.height) * hUnit
        
        let x = max(0, min(maxX, pt.x))
        let y = max(0, min(maxY, pt.y))
        
        return CGPoint(x: x, y: y)
    }
}
