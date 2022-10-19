import Combine
import SwiftUI

/**
 TableModel is the data structure being used in DataTable View.
 ## Code Usage:
 ```
 let header = TableRowItem(leadingAccessories: [], trailingAccessory: nil, data: titles)
 let model = TableModel(headerData: header, rowData: res, isFirstRowSticky: true, isFirstColumnSticky: true, showListView: true)
 model.columnAttributes = ...
 model.didSelectRowAt = { _ in
 print(model.selectedIndexes)
 }
 ```
 */

public class TableModel: ObservableObject {
    /// `TableRowItem`, header data for displaying.
    @Published public var headerData: TableRowItem?
    
    internal var hasHeader: Bool {
        if let header = self.headerData, !header.data.isEmpty {
            return true
        }
        return false
    }
    
    /// Data for each row.
    public var rowData: [TableRowItem] {
        get {
            self._rowData
        }
        set {
            self._rowData = newValue.map { rowItem in
                getMappedRowItem(for: rowItem)
            }
            
            self.needsCalculateLayout = true
        }
    }
    
    @Published var needsCalculateLayout: Bool = false
    
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
            self.needsCalculateLayout = true
        }
    }
    
    /// row alignment
    @Published public var rowAlignment: RowAlignment = .top {
        didSet {
            self.needsCalculateLayout = true
        }
    }
    
    /// Switching between normal and editing mode.
    @Published public var isEditing: Bool = false {
        didSet {
            self.needsCalculateLayout = true
        }
    }
    
    /// Enable or disable pinch and zoom.
    @Published public var isPinchZoomEnable: Bool = false
    
    /// Selection did change handler.
    @Published public var didSelectRowAt: ((_ index: Int) -> Void)?
    
    /// Selected Indexes.
    @Published public var selectedIndexes: [Int] = []
    
    internal var centerPosition: CGPoint?
    
    @Published private var _rowData: [TableRowItem] = []
    
    /// show row dividers in every number of Rows; The values must be >= 1; The default is 1.
    @Published public var everyNumOfRowsToShowDivider: Int = 1
    
    /// show or hide row dividers
    @Published public var showRowDivider: Bool = true
    
    /// show or hide first column divider
    @Published public var showColoumnDivider: Bool = true
    
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
    ///   - everyNumOfRowsToShowDivider: Show row dividers in every number of Rows; The values must be >= 1; The default is 1.
    ///   - showColoumnDivider:Show or hide first column divider
    ///   - headerCellPadding: Custom header cell's padding
    ///   - dataCellPadding: Custom data cell's padding
    ///   - minRowHeight: Min row height
    ///   - minColumnWidth: Min column width
    ///   - allowsPartialRowDisplay: Whether allows to display partial row; For Table Card, set this to false
    ///   - backgroundColor: background color
    ///   - showListView: Show list view in iPhone protrait mode
    public init(headerData: TableRowItem? = nil,
                rowData: [TableRowItem] = [],
                isHeaderSticky: Bool = false,
                isFirstColumnSticky: Bool = false,
                columnAttributes: [ColumnAttribute] = [],
                rowAlignment: RowAlignment = .top,
                isPinchZoomEnable: Bool = false,
                showRowDivider: Bool = true,
                everyNumOfRowsToShowDivider: Int = 1,
                showColoumnDivider: Bool = true,
                headerCellPadding: EdgeInsets? = nil,
                dataCellPadding: EdgeInsets? = nil,
                minRowHeight: CGFloat = 48,
                minColumnWidth: CGFloat = 48,
                allowsPartialRowDisplay: Bool = true,
                backgroundColor: Color = Color.preferredColor(.secondaryGroupedBackground),
                showListView: Bool = false)
    {
        self.headerData = headerData
        self.rowData = rowData
        self.isHeaderSticky = headerData == nil ? false : isHeaderSticky
        self.isFirstColumnSticky = isFirstColumnSticky
        self.columnAttributes = columnAttributes
        self.rowAlignment = rowAlignment
        self.isPinchZoomEnable = isPinchZoomEnable
        self.showRowDivider = showRowDivider
        self.everyNumOfRowsToShowDivider = max(1, everyNumOfRowsToShowDivider)
        self.showColoumnDivider = showColoumnDivider
        self.headerCellPadding = headerCellPadding
        self.dataCellPadding = dataCellPadding
        self.minRowHeight = max(1, minRowHeight)
        self.minColumnWidth = max(1, minColumnWidth)
        self.allowsPartialRowDisplay = allowsPartialRowDisplay
        self.backgroundColor = backgroundColor
        self.showListView = showListView
    }
    
    func getMappedRowItem(for row: TableRowItem) -> TableRowItem {
        let items = row.data
        
        var newRow = row
        var newItems: [DataItem] = []
        
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
            
            for item in items {
                switch item {
                case is DataTextItem:
                    var _item = item as! DataTextItem
                    _item.binding = textBinding(forIndex: labelIndex)
                    labelIndex += 1
                    newItems.append(_item)
                case is DataImageItem:
                    var _item = item as! DataImageItem
                    _item.binding = imageBinding(forIndex: imageIndex)
                    imageIndex += 1
                    newItems.append(_item)
                default:
                    break
                }
            }
            newRow.data = newItems
        }
                
        return newRow
    }
    
    public var isNoData: Bool {
        self.headerData == nil && self.rowData.isEmpty
    }
}
