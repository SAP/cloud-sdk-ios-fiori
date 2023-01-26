import Foundation
import SwiftUI

class TableLayoutManager: ObservableObject {
    var model: TableModel {
        didSet {
            self.numOfColumns = -1
        }
    }
    
    var horizontalScrolling: Bool = true

    var sizeClass: UserInterfaceSizeClass = .compact
    
    var sizeCategory: ContentSizeCategory? {
        didSet {
            self.needsCalculateLayout = true
        }
    }
       
    var size: CGSize = .zero
    
    var needsCalculateLayout: Bool = false {
        didSet {
            if self.needsCalculateLayout {
                DispatchQueue.main.async {
                    self.layoutData = nil
                    self.cacheLayoutData = nil
                }
            }
        }
    }
    
    var cachedKeyboardHeight: CGFloat = 0
    
    @Published var keyboardHeight: CGFloat = 0
    
    var cacheCurrentCell: (Int, Int)?
    
    @Published var currentCell: (Int, Int)? = nil
    
    @Published var startPosition: CGPoint = .zero
    
    @Published var selectedIndexes: [Int] = []
    
    @Published var isValid: (Bool, String?) = (true, nil)
    
    /// it will not be nil after layout process is completed
    @Published var layoutData: LayoutData? = nil
    
    var inlineEditingModel = InlineEditingModel()
    
    /// private: X direction scale factor; the minimum scale is to display all data in the view
    private var _scaleX: CGFloat = 1.0
    
    /// X direction scale factor, scale is not allowed to be less than 0.5
    public var scaleX: CGFloat {
        get {
            self._scaleX
        }
        
        set {
            if newValue > 4 {
                self._scaleX = 4
            } else if newValue < 0.5 {
                self._scaleX = 0.5
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
            if newValue > 4 {
                self._scaleY = 4
            } else if newValue < 0.5 {
                self._scaleY = 0.5
            } else {
                self._scaleY = newValue
            }
        }
    }

    var layoutWorkItem: DispatchWorkItem?
    var workingLayoutData: LayoutData?
    
    let layoutQueue = DispatchQueue(label: "TableLayoutManager_layout")

    /// cached LayoutData for DataTable size measurement giving by View's Width
    var cacheLayoutDataForMeasurement: LayoutData?
    
    /// cached LayoutData for display
    var cacheLayoutData: LayoutData?
    
    /// cache the result
    var numOfColumns: Int = -1
    
    /// check if layout process is finished
    func isLayoutFinished(_ size: CGSize) -> Bool {
        if let ld = layoutData {
            return ld.size.width == size.width && self.layoutWorkItem == nil
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
        
        var isThereRejectedErrors: Bool = false
        var changes: [DataTableChange] = []
        var newRowData: [TableRowItem] = ld.rowData
        
        for i in 0 ..< newRowData.count {
            for j in 0 ..< newRowData[i].data.count {
                switch newRowData[i].data[j].type {
                case .text:
                    if var item = newRowData[i].data[j] as? DataTextItem, ld.allDataItems[i][j].text != item.text {
                        if findFirstChangeThenReturn {
                            return ([], [DataTableChange(rowIndex: i, columnIndex: j, value: .text(item.text), text: item.text)], false)
                        }
                        
                        if !applyValidation || (applyValidation && ld.allDataItems[i][j].isValid) {
                            item.text = ld.allDataItems[i][j].text ?? ""
                            newRowData[i].data[j] = item
                            changes.append(DataTableChange(rowIndex: i, columnIndex: j, value: .text(item.text), text: item.text))
                        } else {
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
    
    func onSave(_ isSave: Bool) -> [DataTableChange] {
        if self.model.editMode != .inline {
            return []
        }
        
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
        guard let ld = layoutData, cacheLayoutData != nil else { return [] }
        
        let changeResult = self.queryInlineEditChanges(applyValidation: true, findFirstChangeThenReturn: false)
        let isThereRejectedErrors: Bool = changeResult.isThereRejectedErrors
        let changes: [DataTableChange] = changeResult.changes
        let newRowData: [TableRowItem] = changeResult.newRowData
        
        self.model._rowData = newRowData.suffix(self.model._rowData.count)
        if isThereRejectedErrors {
            self.cacheLayoutData = ld.copy()
            self.layoutData = nil
        } else {
            self.cacheLayoutData = self.layoutData?.copy()
        }
        return changes
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
}
