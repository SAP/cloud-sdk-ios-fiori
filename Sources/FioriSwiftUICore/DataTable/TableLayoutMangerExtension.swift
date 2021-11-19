import Foundation
import SwiftUI
import UIKit

extension TableLayoutManager {
    /// Return value: whether need to reset State variables
    func layout(size: CGSize) -> Bool {
        if self.size.width == size.width && !model.needsCalculateLayout {
            // isLayoutFinished could be true or false. it is either everything has not been changed or it is in the middle of layout
            if self.layoutData != nil || layoutWorkItem != nil {
                return false
            }
        }

        if self.size != size {
            self.size = size
        }
        
        let needToInitModel = self.cacheLayoutData == nil || (self.model.needsCalculateLayout ? true : false)
        if needToInitModel {
            self.model.needsCalculateLayout = false
            self.cacheLayoutData = nil
            self.selectedIndexes = self.model.selectedIndexes
        }
    
        self.layoutData = nil
        self.resetPosition()
        
        let model = self.model
        
        var newWorkItem: DispatchWorkItem?
        newWorkItem = DispatchWorkItem {
            let tmpLayoutData = LayoutData()
            tmpLayoutData.isEditing = model.isEditing
            tmpLayoutData.sizeClass = self.sizeClass
            tmpLayoutData.size = size
            tmpLayoutData.headerCellPadding = self.headerCellPadding
            tmpLayoutData.dataCellPadding = self.dataCellPadding
            tmpLayoutData.minRowHeight = self.minRowHeight
            tmpLayoutData.minColumnWidth = self.minColumnWidth
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
//            tmpLayoutData.contentInset = TableViewLayout.contentInset(sizeClass: self.sizeClass)
             
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
            }
        }
        
        layoutWorkItem?.cancel()
        layoutWorkItem = newWorkItem
        DispatchQueue.global(qos: .userInteractive).async(execute: newWorkItem!)
        
        return true
    }
    
    func getListItems() -> [AnyView] {
        var items: [AnyView] = []
        let rows = self.model.rowData
        for row in rows {
            let view = self.makeObjectView(row: row)
            items.append(AnyView(view))
        }
        model.needsCalculateLayout = false
        
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
        let x = max(0, pos.x - self.widthPointInUnit(size: size) * size.width / 2)
        let y = max(0, pos.y - self.heightPointInUnit(size: size) * size.height / 2)
        
        return CGPoint(x: x, y: y)
    }
    
    func contentWidth() -> CGFloat {
        guard let ld = layoutData else { return 1 }
        
        let allColumnWidth = ld.columnWidths.reduce(0) { partialResult, width in
            partialResult + width
        }
        
        let totalWidth = max(1, allColumnWidth)
        return totalWidth
    }
    
    func contentHeight() -> CGFloat {
        guard let ld = layoutData else { return 1 }
        
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
    
    func validCenterPosition(pt: CGPoint, size: CGSize) -> CGPoint {
        guard let ld = layoutData else { return CGPoint(x: 0.5, y: 0.5) }
        
        let wUnit = self.widthPointInUnit(size: size)
        let minX = size.width * wUnit / 2
        let totalContentWidth = (ld.leadingAccessoryViewWidth + ld.trailingAccessoryViewWidth + self.contentWidth()) * self.scaleX(size: size)
        let totalWidth = max(size.width, totalContentWidth)
        let maxX = (totalWidth - size.width / 2) * wUnit
        
        let hUnit = self.heightPointInUnit(size: size)
        let minY = size.height * hUnit / 2
        let totalHeight = max(size.height, self.contentHeight() * self.scaleY(size: size))
        let maxY = (totalHeight - size.height / 2) * hUnit
        
        let x = max(minX, min(maxX, pt.x))
        let y = max(minY, min(maxY, pt.y))
        
        return CGPoint(x: x, y: y)
    }
    
    func centerPosition(size: CGSize) -> CGPoint {
        if let pos = self.centerPosition {
            // check if it is valid for different size of views
            return self.validCenterPosition(pt: pos, size: size)
        } else {
            let x = size.width * self.widthPointInUnit(size: size) / 2
            let y = size.height * self.heightPointInUnit(size: size) / 2
            
            return CGPoint(x: x, y: y)
        }
    }
}
