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
    
    /// Data for each row.
    @Published public var rowData: [TableRowItem] = []
    
    /// Set header to be sticky.
    @Published public var isHeaderSticky: Bool = false
    
    /// Set first column to be sticky.
    @Published public var isFirstColumnSticky: Bool = false
    
    /// Set horizontal scrolling.
    @Published public var horizontalScrolling: Bool = true
    
    /// Show list view in iPhone protrait mode.
    @Published public var showListView: Bool = true
        
    /// Column attribute for each column.
    @Published public var columnAttributes: [ColumnAttribute] = []
    
    /// Switching between normal and editing mode.
    @Published public var isEditing: Bool = false
    
    /// Enable or disable pinch and zoom.
    @Published public var isPinchZoomEnable: Bool = false
    
    /// Selection did change handler.
    public var didSelectRowAt: ((_ index: Int) -> Void)?
    
    /// Selected Indexes.
    @Published public var selectedIndexes: [Int] = []
    
    internal var centerPosition: CGPoint?
    
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
                showListView: Bool = true)
    {
        self.headerData = headerData
        self.rowData = rowData
        self.isHeaderSticky = isHeaderSticky
        self.isFirstColumnSticky = isFirstColumnSticky
        self.columnAttributes = columnAttributes
        self.isPinchZoomEnable = isPinchZoomEnable
        self.showListView = showListView
    }
}
