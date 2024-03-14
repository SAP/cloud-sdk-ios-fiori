import Foundation
import SwiftUI

class TableLayoutManager: ObservableObject {
    let maxScaleAllowed: CGFloat = 4
    let minScaleAllowed: CGFloat = 0.5
    
    var model: TableModel {
        didSet {
            self.numOfColumns = -1
        }
    }
    
    var horizontalScrolling: Bool = true

    var sizeClass: UserInterfaceSizeClass = .compact
    
    var dynamicTypeSize: DynamicTypeSize? {
        didSet {
            self.needsCalculateLayout = true
        }
    }
       
    var size: CGSize = .zero
    
    var needsCalculateLayout: Bool = false
    
    var cachedKeyboardHeight: CGFloat = 0
    
    /// keyboard frame
    var keyboardFrame: CGRect = .zero
    
    @Published var keyboardHeight: CGFloat = 0
    
    @Published var currentCell: (Int, Int)? = nil
    
    // contentOffset in the UIScrollView
    @Published var startPosition: CGPoint = .zero
    
    @Published var selectedIndexes: [Int] = []
    
    var isValid: (Bool, String?) = (true, nil)
    
    /// it will not be nil after layout process is completed
    @Published var layoutData: LayoutData? = nil
    
    /// toggle this to trigger a refresh of the DataTable
    @Published var needRefresh = false
    
    var inlineEditingModel = InlineEditingModel()
    
    /// private: X direction scale factor; the minimum scale is to display all data in the view
    private var _scaleX: CGFloat = 1.0
    
    /// X direction scale factor, scale is not allowed to be less than 0.5
    public var scaleX: CGFloat {
        get {
            self._scaleX
        }
        
        set {
            if newValue > self.maxScaleAllowed {
                self._scaleX = self.maxScaleAllowed
            } else if newValue < self.minScaleAllowed {
                self._scaleX = self.minScaleAllowed
            } else {
                self._scaleX = newValue
            }
        }
    }
    
    /// private: Y direction scale factor; the minimum scale is to display all data in the view
    private var _scaleY: CGFloat = 1.0
    
    /// Y direction scale factor, scale is not allowed to be less than 0.5
    public var scaleY: CGFloat {
        get {
            self._scaleY
        }
        
        set {
            if newValue > self.maxScaleAllowed {
                self._scaleY = self.maxScaleAllowed
            } else if newValue < self.minScaleAllowed {
                self._scaleY = self.minScaleAllowed
            } else {
                self._scaleY = newValue
            }
        }
    }

    /// current layout out work item
    var layoutWorkItem: DispatchWorkItem?
    
    /// current working LayoutData
    var workingLayoutData: LayoutData?
    
    /// layout queue
    let layoutQueue = DispatchQueue(label: "TableLayoutManager_layout")

    /// cached LayoutData for DataTable size measurement giving by View's Width
    var cacheLayoutDataForMeasurement: LayoutData?
    
    /// cached LayoutData for display
    var cacheLayoutData: LayoutData?
    
    /// cache editing text to save if users tap another cell before the editing text has been saved explicitly
    var cacheEditingText: String?
    
    /// cache the result
    var numOfColumns: Int = -1
    
    /// check if layout process is finished
    func isLayoutFinished(_ size: CGSize) -> Bool {
        if let ld = layoutData {
            return (ld.size.width == size.width && self.layoutWorkItem == nil) || (ld.size.width == size.width && (self.workingLayoutData?.rowData.count ?? 0) > ld.rowData.count)
        }
        
        return false
    }
    
    public func numberOfColumns() -> Int {
        guard let ld = layoutData else { return 0 }
        
        return ld.numberOfColumns()
    }
    
    public func numberOfRows() -> Int {
        guard let ld = layoutData else { return 0 }
        
        return ld.numberOfRows()
    }
    
    init(model: TableModel) {
        self.model = model
        self.horizontalScrolling = model.horizontalScrolling
        self.selectedIndexes = model.selectedIndexes
    }
    
    // swiftlint:disable cyclomatic_complexity function_body_length
    func queryInlineEditChanges(applyValidation: Bool = true, findFirstChangeThenReturn: Bool = false) -> (newRowData: [TableRowItem], changes: [DataTableChange], isThereRejectedErrors: Bool) {
        if self.model.editMode != .inline {
            return ([], [], false)
        }
        
        guard let ld = layoutData, let cacheLd = cacheLayoutData else { return ([], [], false) }
        
        var isThereRejectedErrors = false
        var changes: [DataTableChange] = []
        var newRowData: [TableRowItem] = ld.rowData
        
        // cacheLd.allDataItems may contain less data than ld.rowData because new rows could be added during scrolling from the app
        for i in 0 ..< min(cacheLd.allDataItems.count, newRowData.count) {
            for j in 0 ..< newRowData[i].data.count {
                switch newRowData[i].data[j].type {
                case .text:
                    /// compare two if there is a change
                    if var item = newRowData[i].data[j] as? DataTextItem, ld.allDataItems[i][j].text != item.text {
                        /// return here if it is for "Cancel"
                        if findFirstChangeThenReturn {
                            return ([], [DataTableChange(rowIndex: i, columnIndex: j, value: .text(item.text), text: item.text)], false)
                        }
                        
                        /// if the change is valid, then save it back to model
                        if !applyValidation || (applyValidation && ld.allDataItems[i][j].isValid) {
                            item.text = ld.allDataItems[i][j].text ?? ""
                            newRowData[i].data[j] = item
                            changes.append(DataTableChange(rowIndex: i, columnIndex: j, value: .text(item.text), text: item.text))
                        } else { /// if it is not valid then discard the change and restore the original data
                            isThereRejectedErrors = true
                            ld.allDataItems[i][j] = cacheLd.allDataItems[i][j]
                        }
                    }
                case .date:
                    if var item = newRowData[i].data[j] as? DataDateItem, let date = ld.allDataItems[i][j].date, date != item.date {
                        if findFirstChangeThenReturn {
                            return ([], [DataTableChange(rowIndex: i, columnIndex: j, value: .text(item.text), text: item.text)], false)
                        }
                        
                        if !applyValidation || (applyValidation && ld.allDataItems[i][j].isValid) {
                            item.text = ld.allDataItems[i][j].text ?? ""
                            item.date = date
                            newRowData[i].data[j] = item
                            changes.append(DataTableChange(rowIndex: i, columnIndex: j, value: .date(date), text: item.text))
                        } else {
                            isThereRejectedErrors = true
                            ld.allDataItems[i][j] = cacheLd.allDataItems[i][j]
                        }
                    }
                case .time:
                    if var item = newRowData[i].data[j] as? DataTimeItem, let date = ld.allDataItems[i][j].date, date != item.date {
                        if findFirstChangeThenReturn {
                            return ([], [DataTableChange(rowIndex: i, columnIndex: j, value: .date(date), text: item.text)], false)
                        }
                        
                        if !applyValidation || (applyValidation && ld.allDataItems[i][j].isValid) {
                            item.text = ld.allDataItems[i][j].text ?? ""
                            item.date = date
                            newRowData[i].data[j] = item
                            changes.append(DataTableChange(rowIndex: i, columnIndex: j, value: .date(date), text: item.text))
                        } else {
                            isThereRejectedErrors = true
                            ld.allDataItems[i][j] = cacheLd.allDataItems[i][j]
                        }
                    }
                case .duration:
                    if var item = newRowData[i].data[j] as? DataDurationItem, let ti = ld.allDataItems[i][j].ti, ti != item.duration {
                        if findFirstChangeThenReturn {
                            return ([], [DataTableChange(rowIndex: i, columnIndex: j, value: .duration(ti), text: item.text)], false)
                        }
                        
                        if !applyValidation || (applyValidation && ld.allDataItems[i][j].isValid) {
                            item.text = ld.allDataItems[i][j].text ?? ""
                            item.duration = ti
                            newRowData[i].data[j] = item
                            changes.append(DataTableChange(rowIndex: i, columnIndex: j, value: .duration(ti), text: item.text))
                        } else {
                            isThereRejectedErrors = true
                            ld.allDataItems[i][j] = cacheLd.allDataItems[i][j]
                        }
                    }
                case .listitem:
                    if var item = newRowData[i].data[j] as? DataListItem, ld.allDataItems[i][j].text != item.text {
                        if findFirstChangeThenReturn {
                            return ([], [DataTableChange(rowIndex: i, columnIndex: j, value: .text(item.text), text: item.text)], false)
                        }
                        
                        item.text = ld.allDataItems[i][j].text ?? ""
                        newRowData[i].data[j] = item
                        changes.append(DataTableChange(rowIndex: i, columnIndex: j, value: .text(item.text), text: item.text))
                    }
                default:
                    break
                }
            }
        }
        
        return (newRowData, changes, isThereRejectedErrors)
    }
    
    /// Save the model after the editing. If chagnes were not valid then those changes are rolled back to original values.
    /// - Parameter isSave: Save it or not
    /// - Returns: Return an array of changes
    func onSave(_ isSave: Bool) -> [DataTableChange] {
        if self.model.editMode != .inline {
            return []
        }
        
        let cacheCurrentCell = self.currentCell
        self.currentCell = nil
        if !isSave {
            let changeResult = self.queryInlineEditChanges(applyValidation: false, findFirstChangeThenReturn: true)
            if !changeResult.changes.isEmpty {
                self.layoutData = self.cacheLayoutData?.copy()
                self.layoutData = nil
            }
            return []
        }
        
        // update model
        guard let ld = layoutData else { return [] }
        
        // save text changes if an other cell is tapped
        if let tmpCell = cacheCurrentCell, ld.allDataItems[tmpCell.0][tmpCell.1].type == .text {
            self.updateText(rowIndex: tmpCell.0, columnIndex: tmpCell.1, updateItValidOnly: true)
        }
        
        guard self.cacheLayoutData != nil else { return [] }
        let changeResult = self.queryInlineEditChanges(applyValidation: true, findFirstChangeThenReturn: false)
        let isThereRejectedErrors: Bool = changeResult.isThereRejectedErrors
        let changes: [DataTableChange] = changeResult.changes
        let newRowData: [TableRowItem] = changeResult.newRowData
        
        self.model._rowData = newRowData.suffix(self.model._rowData.count)
        self.layoutData?.rowData = newRowData
        if isThereRejectedErrors {
            // need to update numOfErrors
            var numOfErrors = 0
            for row in ld.allDataItems {
                for cell in row {
                    numOfErrors += cell.isValid ? 0 : 1
                }
            }
            ld.numOfErrors = numOfErrors
            self.cacheLayoutData = ld.copy()
            self.layoutData = nil
        } else {
            self.cacheLayoutData = self.layoutData?.copy()
        }
        return changes
    }
    
    func saveEditingTextChange() {
        // save text changes
        guard self.model.editMode == .inline else { return }
        
        if let tmpCell = currentCell, let ld = layoutData, ld.allDataItems[tmpCell.0][tmpCell.1].type == .text {
            self.updateText(rowIndex: tmpCell.0, columnIndex: tmpCell.1, updateItValidOnly: false)
            
            self.currentCell = nil
        }
    }
    
    func updateText(rowIndex: Int, columnIndex: Int, updateItValidOnly: Bool = false) {
        guard let ld = layoutData, let editingText = self.cacheEditingText else { return }
        
        var dataItem = ld.allDataItems[rowIndex][columnIndex]
        if dataItem.text != editingText {
            let originalText = dataItem.text
            dataItem.text = editingText
            let validState = self.checkIsValid(for: dataItem)
            
            // not valid then roll back
            if updateItValidOnly, !validState.0 {
                dataItem.text = originalText
                return
            }
            
            let errorChange: Int = dataItem.isValid != validState.0 ? (validState.0 ? -1 : 1) : 0
            ld.numOfErrors += errorChange
            dataItem.isValid = validState.0
            dataItem.size = ld.calcDataItemSize(dataItem)
            ld.allDataItems[rowIndex][columnIndex] = dataItem
            ld.updateCellLayout(for: rowIndex, columnIndex: columnIndex)
            self.model.valueDidChange?(DataTableChange(rowIndex: rowIndex, columnIndex: columnIndex, value: .text(editingText), text: editingText))
            self.cacheEditingText = nil
            self.isValid = validState
            self.needRefresh.toggle()
        }
    }
    
    func checkIsValid(for dti: DataTableItem) -> (Bool, String?) {
        var tmpDi: DataItem?
        
        switch dti.type {
        case .date:
            tmpDi = DataDateItem(dti.date ?? Date())
        case .time:
            tmpDi = DataTimeItem(dti.date ?? Date())
        case .duration:
            tmpDi = DataDurationItem(dti.ti ?? 0)
        default:
            tmpDi = DataTextItem(dti.text ?? "")
        }
        
        if let di = tmpDi {
            return self.model.checkIsValid(for: di, rowIndex: dti.rowIndex, columnIndex: dti.columnIndex)
        }
        
        return (true, nil)
    }
    
    /// Returns the rect for the specified cell with rowIndex and columnIndex
    /// - Parameter rowIndex: the row index; rowIndex starts from header if it exists
    /// - Parameter columnIndex: the column index
    /// - Parameter isRelativeToContentOffset: subtract ScrollView's contentOffset if it is true
    /// - Returns: Return the rect
    func rectForCell(at rowIndex: Int, columnIndex: Int, isRelativeToContentOffset: Bool = false) -> CGRect {
        guard let layoutData, rowIndex < layoutData.allDataItems.count, columnIndex < layoutData.allDataItems[rowIndex].count else { return .zero }
        
        let dataItem = layoutData.allDataItems[rowIndex][columnIndex]
        let tmpScaleX = self.scaleX(size: self.size)
        let tmpScaleY = self.scaleY(size: self.size)
        
        let contentSizeWidth = totalContentWidth()
        let contentSizeHeight = totalContentHeight()
        // check & restore scrollView's contentOffset
        let tmpOffsetX = contentSizeWidth * self.startPosition.x
        let tmpOffsetY = contentSizeHeight * self.startPosition.y
        
        let cellWidth = layoutData.columnWidths[columnIndex] * tmpScaleX
        let x: CGFloat = dataItem.pos.x * tmpScaleX - cellWidth / 2 - (isRelativeToContentOffset ? tmpOffsetX : 0)
        
        let cellHeight = layoutData.rowHeights[rowIndex] * tmpScaleY
        let y: CGFloat = dataItem.pos.y * tmpScaleY - cellHeight / 2 - (isRelativeToContentOffset ? tmpOffsetY : 0)
    
        return CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width: cellWidth, height: cellHeight))
    }
    
    func accessibilityLabelForCell(_ item: DataTableItem) -> String {
        let isHeader = self.model.hasHeader && item.rowIndex == 0
        /// row index starts from 1 for voice over
        let rowIndex = item.rowIndex + (self.model.hasHeader ? 0 : 1)
        /// column index starts from 1 for voice over
        let columnIndex = item.columnIndex + 1
        var label = ""
        let rowHeader = NSLocalizedString("row header", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        let rowFormat = NSLocalizedString("row %d", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        let columnFormat = NSLocalizedString("column %d", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        let columnLabel = String.localizedStringWithFormat(columnFormat, columnIndex)
        let rowLabel = isHeader ? rowHeader : String.localizedStringWithFormat(rowFormat, rowIndex)
        var cellType = NSLocalizedString("image", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
        switch item.type {
        case .image:
            label = "\(rowLabel), \(columnLabel), \(cellType)"
        case .text:
            label = "\(rowLabel), \(columnLabel), \(item.text ?? "")"
        case .date:
            cellType = NSLocalizedString("date", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
            label = "\(rowLabel), \(columnLabel), \(item.text ?? ""), \(cellType)"
        case .time:
            cellType = NSLocalizedString("time", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
            label = "\(rowLabel), \(columnLabel), \(item.text ?? ""), \(cellType)"
        case .duration:
            cellType = NSLocalizedString("duration", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
            label = "\(rowLabel), \(columnLabel), \(item.text ?? ""), \(cellType)"
        case .listitem:
            cellType = NSLocalizedString("list item", tableName: "FioriSwiftUICore", bundle: Bundle.accessor, comment: "")
            label = "\(rowLabel), \(columnLabel), \(item.text ?? ""), \(cellType)"
        }
        
        return label
    }
}
