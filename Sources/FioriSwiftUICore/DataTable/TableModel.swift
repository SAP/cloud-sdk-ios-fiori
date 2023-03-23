import Combine
import SwiftUI

/**
 TableModel is the data structure being used in DataTable View.
 ## Code Usage:
 ```
 let header = TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: titles)
 let model = TableModel(headerData: header, rowData: res, isFirstRowSticky: true, isFirstColumnSticky: true, showListView: true)
 model.columnAttributes = ...
 model.didSelectRowAt = { rowIndex in
    print("Tapped row \(rowIndex)")
 }
 
 /// set a closure to check whether a dataItem located at (rowIndex, columnIndex) is valid; If it is valid, returns (true, nil); if it is not valid, returns false and an error message which is shown to users.
 model.validateDataItem = { rowIndex, columnIndex, dataItem in
 ...
 }
 
 /// set a closure to provide a `DataListItem` type dataItem located at (rowIndex, columnIndex) for an array of Strings and a title for inline editing mode
 model.listItemDataAndTitle = { rowIndex, columnIndex in
 ...
 }
 
 /// set a closure to observe a value change for inline editing mode
 model.valueDidChange = { change in
     print("valueDidChange: \(change.description)")
 }
 ```
 */
public class TableModel: ObservableObject {
    /// Edit mode for DataTable
    public enum EditMode: Int, CaseIterable {
        /// none edit mode
        case none
        
        /// selection mode
        case select
        
        /// inline editing mode
        case inline
    }
    
    /// `TableRowItem`, header data for displaying.
    @Published public var headerData: TableRowItem?
    
    internal var hasHeader: Bool {
        if let header = self.headerData, !header.data.isEmpty {
            return true
        }
        return false
    }
    
    /// Data for each row. Header is not included.
    public var rowData: [TableRowItem] {
        get {
            self._rowData
        }
        set {
            self._rowData = newValue.map { rowItem in
                // process binding and generate titles for cells like .date, .time and .duration
                processRowItem(for: rowItem)
            }
            
            self.layoutManager?.needsCalculateLayout = true
        }
    }
    
    /// Set header to be sticky.
    @Published public var isHeaderSticky: Bool = false
    
    /// Set first column to be sticky.
    @Published public var isFirstColumnSticky: Bool = false
    
    /// Set horizontal scrolling.
    @Published public var horizontalScrolling: Bool = true
    
    /// Show list view in iPhone protrait mode.
    @Published public var showListView: Bool = false
    
    /// Column attribute for each column.
    @Published public var columnAttributes: [ColumnAttribute] = [] {
        didSet {
            self.layoutManager?.needsCalculateLayout = true
        }
    }
    
    public func columnAttribute(for columnIndex: Int) -> ColumnAttribute {
        if columnIndex < self.columnAttributes.count {
            return self.columnAttributes[columnIndex]
        }
        
        return ColumnAttribute()
    }
    
    /// row alignment
    @Published public var rowAlignment: RowAlignment = .top {
        didSet {
            self.layoutManager?.needsCalculateLayout = true
        }
    }
    
    /// Switching between normal and editing mode.
    @available(*, deprecated, renamed: "editMode")
    @Published public var isEditing: Bool = false {
        didSet {
            if self.isEditing == true {
                self.editMode = .select
            } else {
                self.editMode = .none
            }
        }
    }
    
    @Published public var editMode: EditMode = .none {
        didSet {
            if oldValue == self.editMode {
                return
            }

            if self.editMode == .select || oldValue == .select {
                self.layoutManager?.needsCalculateLayout = true
            }
        }
    }
    
    /// Enable or disable pinch and zoom.
    @Published public var isPinchZoomEnable: Bool = false
    
    /// Selection did change handler.
    public var didSelectRowAt: ((_ index: Int) -> Void)?
    
    /// value did change
    public var valueDidChange: ((DataTableChange) -> Void)?
    
    /// Selected Indexes.
    @Published public var selectedIndexes: [Int] = []
    
    @Published internal var _rowData: [TableRowItem] = []
    
    /// show row dividers in every number of Rows; The values must be >= 1; The default is 1.
    @Published public var everyNumOfRowsToShowDivider: Int = 1
    
    /// show or hide row dividers
    @Published public var showRowDivider: Bool = true
    
    /// show or hide first column divider
    @Published public var showColoumnDivider: Bool = true
    
    /// the row divider height
    @Published public var rowDividerHeight: CGFloat = 1
    
    /// the row divider color
    @Published public var rowDividerColor = Color.preferredColor(.separator)
    
    /// the column divider width
    @Published public var columnDividerWidth: CGFloat = 1
    
    /// the column divider color
    @Published public var columnDividerColor = Color.preferredColor(.separator)
    
    // custom header cell's padding; if set it overwrites default value
    @Published public var headerCellPadding: EdgeInsets? = nil
    
    // custom data cell's padding; if set it overwrites default value
    @Published public var dataCellPadding: EdgeInsets? = nil
    
    /// min row height
    @Published public var minRowHeight: CGFloat = 48
    
    /// min column width
    @Published public var minColumnWidth: CGFloat = 48
    
    /// whether allows to display partial row; For Table Card, set this to false
    @Published public var allowsPartialRowDisplay: Bool = true
    
    /// background color
    @Published public var backgroundColor: Color = TableViewLayout.defaultBackgroundColor
    
    /// a closure to check whether a dataItem located at (rowIndex, columnIndex) is valid; If it is valid, returns (true, nil); if it is not valid, returns false and an error message which is shown to users
    public var validateDataItem: ((_ rowIndex: Int, _ columnIndex: Int, _ dataItem: DataItem) -> (Bool, String?))?
    
    /// a closure to provide a `DataListItem` type dataItem located at (rowIndex, columnIndex) for an array of Strings and a title for inline editing mode
    public var listItemDataAndTitle: ((_ rowIndex: Int, _ columnIndex: Int) -> (listItems: [String], title: String))?
    
    // cached TableLayoutManager
    weak var layoutManager: TableLayoutManager?
    
    /// Public initializer for TableModel.
    /// - Parameters:
    ///   - headerData: Header data for displaying
    ///   - rowData: Data for each row
    ///   - isHeaderSticky: Set header to be sticky
    ///   - isFirstColumnSticky: Set first column to be sticky
    ///   - columnAttributes: Column attribute for each column
    ///   - rowAlignment: Row alighnemt
    ///   - isPinchZoomEnable: Set if pinch and zoom enble, the default is false.
    ///   - showRowDivider: Show or hide row dividers
    ///   - rowDividerHeight:The row divider height
    ///   - rowDividerColor: The row divider color
    ///   - everyNumOfRowsToShowDivider: Show row dividers in every number of Rows; The values must be >= 1; The default is 1.
    ///   - showColoumnDivider: Show or hide first column divider
    ///   - columnDividerWidth: The column divider width
    ///   - columnDividerColor: The column divider color
    ///   - headerCellPadding: Custom header cell's padding
    ///   - dataCellPadding: Custom data cell's padding
    ///   - minRowHeight: Min row height
    ///   - minColumnWidth: Min column width
    ///   - allowsPartialRowDisplay: Whether allows to display partial row; For Table Card, set this to false
    ///   - backgroundColor: Background color
    ///   - showListView: Show list view in iPhone protrait mode
    ///   - editMode: one of edit mode; The default is `.none`.
    public init(headerData: TableRowItem? = nil,
                rowData: [TableRowItem] = [],
                isHeaderSticky: Bool = false,
                isFirstColumnSticky: Bool = false,
                columnAttributes: [ColumnAttribute] = [],
                rowAlignment: RowAlignment = .top,
                isPinchZoomEnable: Bool = false,
                showRowDivider: Bool = true,
                rowDividerHeight: CGFloat = 1,
                rowDividerColor: Color = Color.preferredColor(.separator),
                everyNumOfRowsToShowDivider: Int = 1,
                showColoumnDivider: Bool = true,
                columnDividerWidth: CGFloat = 1,
                columnDividerColor: Color = Color.preferredColor(.separator),
                headerCellPadding: EdgeInsets? = nil,
                dataCellPadding: EdgeInsets? = nil,
                minRowHeight: CGFloat = 48,
                minColumnWidth: CGFloat = 48,
                allowsPartialRowDisplay: Bool = true,
                backgroundColor: Color = Color.preferredColor(.secondaryGroupedBackground),
                showListView: Bool = false,
                editMode: EditMode = .none)
    {
        self.headerData = headerData
        self.isHeaderSticky = headerData == nil ? false : isHeaderSticky
        self.isFirstColumnSticky = isFirstColumnSticky
        self.columnAttributes = columnAttributes
        self.rowAlignment = rowAlignment
        self.isPinchZoomEnable = isPinchZoomEnable
        self.showRowDivider = showRowDivider
        self.rowDividerHeight = rowDividerHeight
        self.rowDividerColor = rowDividerColor
        self.everyNumOfRowsToShowDivider = max(1, everyNumOfRowsToShowDivider)
        self.showColoumnDivider = showColoumnDivider
        self.columnDividerWidth = columnDividerWidth
        self.columnDividerColor = columnDividerColor
        self.headerCellPadding = headerCellPadding
        self.dataCellPadding = dataCellPadding
        self.minRowHeight = max(1, minRowHeight)
        self.minColumnWidth = max(1, minColumnWidth)
        self.allowsPartialRowDisplay = allowsPartialRowDisplay
        self.backgroundColor = backgroundColor
        self.showListView = showListView
        self.editMode = editMode
        
        self.rowData = rowData
    }
    
    // make a deep copy
    public func copy() -> TableModel {
        let copy = TableModel(headerData: self.headerData,
                              rowData: self.rowData,
                              isHeaderSticky: self.isHeaderSticky,
                              isFirstColumnSticky: self.isFirstColumnSticky,
                              columnAttributes: self.columnAttributes,
                              rowAlignment: self.rowAlignment,
                              isPinchZoomEnable: self.isPinchZoomEnable,
                              showRowDivider: self.showRowDivider,
                              rowDividerHeight: self.rowDividerHeight,
                              rowDividerColor: self.rowDividerColor,
                              everyNumOfRowsToShowDivider: self.everyNumOfRowsToShowDivider,
                              showColoumnDivider: self.showColoumnDivider,
                              columnDividerWidth: self.columnDividerWidth,
                              columnDividerColor: self.columnDividerColor,
                              headerCellPadding: self.headerCellPadding,
                              dataCellPadding: self.dataCellPadding,
                              minRowHeight: self.minRowHeight,
                              minColumnWidth: self.minColumnWidth,
                              allowsPartialRowDisplay: self.allowsPartialRowDisplay,
                              backgroundColor: self.backgroundColor,
                              showListView: self.showListView,
                              editMode: self.editMode)
        
        return copy
    }
    
    // process binding and generate titles for cells like .date, .time and .duration
    func processRowItem(for row: TableRowItem) -> TableRowItem {
        let items = row.data
        var newRow = row
        
        if items.filter({ ($0 as? CheckBinding)?.hasBinding ?? false }).isEmpty {
            var labelIndex: Int = 0
            var imageIndex: Int = 0
            
            func textBinding(forIndex index: Int) -> ObjectViewProperty.Text? {
                switch index {
                case 0:
                    return .title
                case 1:
                    return .subtitle
                case 2:
                    return .footnote
                case 3:
                    return imageIndex < 2 ? .status : imageIndex < 3 ? .substatus : nil
                case 4:
                    return imageIndex < 2 ? .substatus : nil
                default:
                    return nil
                }
            }
            
            func imageBinding(forIndex index: Int) -> ObjectViewProperty.Image? {
                switch index {
                case 0:
                    return .detailImage
                case 1:
                    return labelIndex < 4 ? .statusImage : labelIndex < 5 ? .substatusImage : nil
                case 2:
                    return labelIndex < 4 ? .substatusImage : nil
                default:
                    return nil
                }
            }
            
            newRow.data = items.map {
                if var item = $0 as? DataItemTextComponent {
                    item.binding = textBinding(forIndex: labelIndex)
                    labelIndex += 1
                    
                    return item
                }

                if var item = $0 as? DataItemImageComponent {
                    item.binding = imageBinding(forIndex: imageIndex)
                    imageIndex += 1
                    
                    return item
                }
                
                return $0
            }
        }
        
        // format text for cells like .date, .time and .duration
        for i in 0 ..< newRow.data.count {
            if var item = newRow.data[i] as? DataItemTextComponent {
                item.text = item.string(for: self.columnAttribute(for: i))
                newRow.data[i] = item
            }
        }

        return newRow
    }
    
    func checkIsValid(for di: DataItem, rowIndex: Int, columnIndex: Int) -> (Bool, String?) {
        let needToCheckTypes: [DataItemType] = [.text, .date, .time, .duration]
        var isValid: (Bool, String?) = (true, nil)
        if let validateClosure = validateDataItem, needToCheckTypes.contains(di.type) {
            isValid = validateClosure(rowIndex, columnIndex, di)

            if !isValid.0 {
                return isValid
            }
        }

        return (true, nil)
    }
    
    /// check if the model contains no data
    public var isNoData: Bool {
        self.headerData == nil && self.rowData.isEmpty
    }
    
    private func dataItem(for rowIndex: Int, columnIndex: Int) -> DataItem {
        if let header = headerData, rowIndex == 0 {
            return header.data[columnIndex]
        }
        
        return self.rowData[rowIndex - (self.hasHeader ? 1 : 0)].data[columnIndex]
    }
    
    /// Save the model after the editing. If chagnes were not valid then those changes are rolled back to original values.
    /// - Parameter isSave: Save it or not
    /// - Returns: Return an array of changes
    public func onSave(_ isSave: Bool) -> [DataTableChange] {
        self.layoutManager?.onSave(isSave) ?? []
    }
}

/// DataTable change for inline editing
public struct DataTableChange: CustomStringConvertible {
    public let rowIndex: Int
    public let columnIndex: Int
    
    /// value type for DataTableChange
    public enum ValueType {
        case text(String)
        case date(Date)
        case duration(TimeInterval)
        case image
    }
    
    /// value type
    public let value: ValueType
    
    // the text description for the value
    public let text: String
    
    /// the selected index for DataListItem
    public let selectedIndex: Int?
    
    /// init
    public init(rowIndex: Int, columnIndex: Int, value: ValueType, text: String, selectedIndex: Int? = nil) {
        self.rowIndex = rowIndex
        self.columnIndex = columnIndex
        self.value = value
        self.text = text
        self.selectedIndex = selectedIndex
    }
    
    /// debug description
    public var description: String {
        "rowIndex: \(self.rowIndex), columnIndex: \(self.columnIndex), value: \(self.text), selectedIndex = \(String(describing: self.selectedIndex))"
    }
}
