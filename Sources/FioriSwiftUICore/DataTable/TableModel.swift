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
    @Published public var columnAttributes: [ColumnAttribute] = []
    
    /// Switching between normal and editing mode.
    @Published public var isEditing: Bool = false
    
    /// Enable or disable pinch and zoom.
    @Published public var isPinchZoomEnable: Bool = false
    
    /// Selection did change handler.
    @Published public var didSelectRowAt: ((_ index: Int) -> Void)?
    
    /// Selected Indexes.
    @Published public var selectedIndexes: [Int] = []
    
    internal var centerPosition: CGPoint?
    
    @Published private var _rowData: [TableRowItem] = []
    
    /// Public initializer for TableModel.
    /// - Parameters:
    ///   - headerData: Header data for displaying.
    ///   - rowData: Data for each row.
    ///   - isHeaderSticky: Set header to be sticky.
    ///   - isFirstColumnSticky: Set first column to be sticky.
    ///   - columnAttributes: Column attribute for each column.
    ///   - isPinchZoomEnable: Set if pinch and zoom enble, the default is false.
    ///   - showListView: Show list view in iPhone protrait mode.
    public init(headerData: TableRowItem? = nil,
                rowData: [TableRowItem] = [],
                isHeaderSticky: Bool = false,
                isFirstColumnSticky: Bool = false,
                columnAttributes: [ColumnAttribute] = [],
                isPinchZoomEnable: Bool = false,
                showListView: Bool = false)
    {
        self.headerData = headerData
        self.rowData = rowData
        self.isHeaderSticky = headerData == nil ? false : isHeaderSticky
        self.isFirstColumnSticky = isFirstColumnSticky
        self.columnAttributes = columnAttributes
        self.isPinchZoomEnable = isPinchZoomEnable
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
}
