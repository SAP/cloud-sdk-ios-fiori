import Combine
import SwiftUI

/**
 A Data Table is a View that is used for displaying data in either list view or grid table view. It supports cell types of `DataImageItem`, `DataTextItem`, `DataDateItem`, `DataTimeItem`, `DataDurationItem` and `DataListItem`.
 
 ## Code usage:
 ```
 let model = TableModel(headerData: header, rowData: res, isFirstRowSticky: true, isFirstColumnSticky: true, showListView: false)
 model.columnAttributes = ...
 model.didSelectRowAt = { rowIndex in
    print("Tapped row \(rowIndex)")
 }
 model.selectedIndexes = [2, 3]
 
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
 
 DataTable(model: model)
 ```
 */

public struct DataTable: View {
    /// Data table's data model
    @ObservedObject public var model: TableModel
    @ObservedObject var layoutManager: TableLayoutManager
    @Environment(\.sizeCategory) var sizeCategory

    /// Public initializer for DataTable
    /// - Parameter model: TableModel Object.
    public init(model: TableModel) {
        self.model = model
        
        if let lm = model.layoutManager {
            self.layoutManager = lm
        } else {
            self.layoutManager = TableLayoutManager(model: model)
        }
    }
            
    /// Body of the View
    public var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        // it only layouts when necessary
        self.layoutManager.layout(rect.size)
        
        return Group {
            if self.model.isNoData {
                Text("There is nothing to display yet", tableName: "FioriSwiftUICore", bundle: Bundle.accessor)
                    .foregroundColor(Color.preferredColor(.tertiaryLabel))
                    .font(.fiori(forTextStyle: .body))
            } else if self.model.showListView {
                TableListView(layoutManager: self.layoutManager)
            } else {
                if !self.layoutManager.isLayoutFinished(rect.size) {
                    if #available(iOS 14.0, *) {
                        ProgressView().progressViewStyle(CircularProgressViewStyle())
                    } else {
                        // Fallback on earlier versions
                        Text("Loading...", tableName: "FioriSwiftUICore", bundle: Bundle.accessor)
                    }
                } else {
                    ScrollAndZoomView(layoutManager: self.layoutManager, size: rect.size)
                }
            }
        }
        .frame(width: rect.size.width, height: rect.size.height, alignment: .center)
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardDidShowNotification)) { notif in
            let rect = (notif.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect) ?? .zero
            self.layoutManager.keyboardFrame = rect
            self.layoutManager.keyboardHeight = rect.size.height
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.keyboardDidHideNotification)) { _ in
            self.layoutManager.keyboardFrame = .zero
            self.layoutManager.keyboardHeight = 0
        }
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            // save text changes
            self.layoutManager.saveEditingTextChange()
            
            if self.layoutManager.currentCell != nil {
                self.layoutManager.currentCell = nil
            }
        }
        .onChange(of: self.sizeCategory) { newValue in
            self.layoutManager.sizeCategory = newValue
            self.layoutManager.layoutData = nil
        }
        .clipped()
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
    @available(*, deprecated)
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
    
    /// Asks the DataTable to calculate and return the size that best fits all rows & columns by giving a size.width (the passed size.height is ignored).
    /// Warning: it is a sync process so it may take long time if the DataTable has a lot of rows and columns.
    func sizeThatFits(_ size: CGSize) -> CGSize {
        self.layoutManager.sizeThatFits(size)
    }

    /// Returns the rect for the specified cell with rowIndex and columnIndex
    /// - Parameter rowIndex: the row index; rowIndex starts from header if it exists
    /// - Parameter columnIndex: the column index
    /// - Parameter isRelativeToContentOffset: subtract ScrollView's contentOffset if it is true
    /// - Returns: Return the rect
    func rectForCell(at rowIndex: Int, columnIndex: Int, isRelativeToContentOffset: Bool = false) -> CGRect {
        self.layoutManager.rectForCell(at: rowIndex, columnIndex: columnIndex, isRelativeToContentOffset: isRelativeToContentOffset)
    }
}
