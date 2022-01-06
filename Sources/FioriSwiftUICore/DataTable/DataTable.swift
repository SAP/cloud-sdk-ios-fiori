import SwiftUI

/**
 A Data Table is a View that is used for displaying data in either list view or grid table view.
 
 ## Code usage:
 ```
 let model = TableModel(headerData: header, rowData: res, isFirstRowSticky: true, isFirstColumnSticky: true, showListView: false)
 model.columnAttributes = ...
 model.didSelectRowAt = { _ in
     print(model.selectedIndexes)
 }
 model.selectedIndexes = [2, 3]
 DataTable(model: model)
 ```
 */

public struct DataTable: View {
    /// Data table's data model
    @ObservedObject public var model: TableModel
    @ObservedObject var layoutManager: TableLayoutManager
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    /// Public initializer for DataTable
    /// - Parameter model: TableModel Object.
    public init(model: TableModel) {
        self.model = model
        if !model.needsCalculateLayout {
            model.needsCalculateLayout = true
        }
        
        self.layoutManager = TableLayoutManager(model: model)
    }
            
    /// Body of the View
    public var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        if self.model.needsCalculateLayout {
            self.layoutManager.model = self.model
        }
        
        return Group {
            if self.model.showListView {
                TableListView(layoutManager: layoutManager)
            } else {
                GridTableView(layoutManager: layoutManager)
                    .clipped()
            }
        }
        .environmentObject(self.layoutManager)
        .background(self.model.backgroundColor)
    }
}

public extension DataTable {
    /// Set the background color.
    func backgroundColor(_ color: Color) -> DataTable {
        self.model.backgroundColor = color
        
        return self
    }
    
    ///  Set header to be sticky or not.
    func headerSticky(_ value: Bool) -> DataTable {
        self.model.isHeaderSticky = value
        
        return self
    }
    
    /// Set first column to be sticky or not.
    func firstColumnSticky(_ value: Bool) -> DataTable {
        self.model.isFirstColumnSticky = value
        
        return self
    }
    
    /// Set pinch and zoom enble or not.
    func pinchZoomEnable(_ value: Bool) -> DataTable {
        self.model.isPinchZoomEnable = value
        
        return self
    }
    
    /// Show list view or not
    func showListView(_ value: Bool) -> DataTable {
        self.model.showListView = value
        
        return self
    }
    
    /// Toggles the DataTable into and out of editing mode.
    ///
    /// - Parameter value: true to enter editing mode, false to leave it. The default value is false .
    ///
    /// - Returns: DataTable
    func editingMode(_ value: Bool = false) -> DataTable {
        self.model.isEditing = value
        
        return self
    }
    
    /// Show or hide column divider.
    ///
    /// - Parameter value: true to show; false to hide
    ///
    /// - Returns: DataTable
    func showColumnDivider(_ value: Bool = true) -> DataTable {
        self.model.showColoumnDivider = value
        
        return self
    }
    
    /// Show or hide row divider.
    ///
    /// - Parameter value: true to show; false to hide
    ///
    /// - Returns: DataTable
    func showRowDivider(_ value: Bool = true) -> DataTable {
        self.model.showRowDivider = value
        
        return self
    }
    
    /// Pads all cells of this DataTable using the edges and padding amount you specify.
    ///
    /// - Parameter insets: The edges and amounts to inset.
    ///
    /// - Returns: A DataTable that pads this DataTable using the specified edge insets
    ///   with specified amount of padding.
    func dataCellPadding(_ insets: EdgeInsets) -> DataTable {
        self.model.dataCellPadding = insets
        
        return self
    }
    
    /// Pads all header cells of this DataTable using the edges and padding amount you specify.
    ///
    /// - Parameter insets: The edges and amounts to inset.
    ///
    /// - Returns: A DataTable that pads this DataTable using the specified edge insets
    ///   with specified amount of padding.
    func headerCellPadding(_ insets: EdgeInsets) -> DataTable {
        self.model.headerCellPadding = insets
        
        return self
    }
    
    /// Set minimum row height
    func minRowHeight(_ value: CGFloat) -> DataTable {
        self.model.minRowHeight = max(1, value)
        
        return self
    }
    
    /// Set minimum column width
    func minColumnWidth(_ value: CGFloat) -> DataTable {
        self.model.minColumnWidth = max(1, value)
        
        return self
    }
    
    /// Set whether to allow partial row display
    func allowsPartialRowDisplay(_ value: Bool) -> DataTable {
        self.model.allowsPartialRowDisplay = value
        
        return self
    }
    
    /// Set row alignment mode
    func rowAlignment(_ value: RowAlignment) -> DataTable {
        self.model.rowAlignment = value
        
        return self
    }
}
