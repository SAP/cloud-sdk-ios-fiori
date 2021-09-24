import SwiftUI

/**
 A Data Table is a View that is used for displaying data in either list view or grid table view.
 
 ## Code usage:
 ```
 let model = TableModel(headerData: header, rowData: res, isFirstRowSticky: true, isFirstColumnSticky: true, showListView: true)
 model.columnAttributes = ...
 model.didSelectRowAt = { _ in
     print(model.selectedIndexes)
 }
 model.selectedIndexes = [2, 3]
 DataTable(model: model)
     .navigationBarTitle("Data Table", displayMode: .inline)
     .navigationBarItems(leading:
         Button("Add a row") {
             DispatchQueue.main.async {
                 self.model.rowData.insert(TestRowData.generateNewRow(column: 12), at: 0)
             }
         }, trailing:
         Button(self.isEditing ? "Delete" : "Edit") {
             DispatchQueue.main.async {
                 self.isEditing = !self.isEditing
                 view.isEditing = self.isEditing
                 if !self.isEditing {
                     let indexSet = IndexSet(self.model.selectedIndexes)
                     self.model.rowData.remove(atOffsets: indexSet)
                     self.model.selectedIndexes = []
                 }
             }
         })
 ```

 */

public struct DataTable: View {
    /// Data table's data model
    @ObservedObject public var model: TableModel

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.backgroundColor) var backgroundColor
    
    /// Boolean for switching the data table in normal and editing mode.
    public var isEditing: Bool = false {
        didSet {
            self.model.isEditing = self.isEditing
        }
    }
    
    /// Public initializer for DataTable
    /// - Parameter model: TableModel Object.
    public init(model: TableModel) {
        self.model = model
    }
            
    /// Body of the View
    public var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let layoutManager = TableLayoutManager(model: self.model)
        let dataManager = TableDataManager(selectedIndexes: self.model.selectedIndexes)
        layoutManager.sizeClass = self.horizontalSizeClass ?? .compact
        layoutManager.rect = rect
        layoutManager.setupMargins(rect: layoutManager.rect)
        return Group {
            if self.horizontalSizeClass == .compact, self.verticalSizeClass == .regular, self.model.showListView {
                let listView = TableListView(layoutManager: layoutManager)
                listView
            } else {
                let gridView = GridTableView(layoutManager: layoutManager)
                gridView
                    .frame(minWidth: 50, minHeight: 50)
                    .clipped()
            }
        }
        .environmentObject(layoutManager)
        .environmentObject(dataManager)
        .background(self.backgroundColor)
    }
    
    /// Modifer for setting the background color.
    public func backgroundColor(_ color: Color) -> some View {
        self.environment(\.backgroundColor, color)
    }
}
