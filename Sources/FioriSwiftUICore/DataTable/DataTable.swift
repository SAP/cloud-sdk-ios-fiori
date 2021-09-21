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
    
    @State private var isShowingPicker = false

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
        Group {
            if #available(iOS 14.0, *) {
                createView(in: rect)
                    .ignoresSafeArea(.keyboard)
            } else {
                createView(in: rect)
            }
        }
    }
    
    /// Modifer for setting the background color.
    public func backgroundColor(_ color: Color) -> some View {
        self.environment(\.backgroundColor, color)
    }
    
    func createView(in rect: CGRect) -> some View {
        let layoutManager = TableLayoutManager(model: self.model)
        let dataManager = TableDataManager(selectedIndexes: self.model.selectedIndexes)
        layoutManager.sizeClass = self.horizontalSizeClass ?? .compact
        layoutManager.rect = rect

        return ZStack {
            if self.horizontalSizeClass == .compact, self.verticalSizeClass == .regular, self.model.showListView {
                let listView = TableListView(layoutManager: layoutManager)
                listView
            } else {
                let gridView = GridTableView(layoutManager: layoutManager)
                gridView
                    .frame(minWidth: 300, idealWidth: UIScreen.main.bounds.width, maxWidth: .infinity, minHeight: 300, idealHeight: UIScreen.main.bounds.height, maxHeight: .infinity, alignment: .center)
                    .clipped()
            }
            showPicker(rect)
        }
        .environmentObject(layoutManager)
        .environmentObject(dataManager)
        .background(self.backgroundColor)
    }
    
    func showPicker(_ rect: CGRect) -> AnyView {
        DispatchQueue.main.async {
            self.isShowingPicker = self.model.isShowingPicker
        }
        if self.model.isShowingPicker {
            guard let picker = self.model.currentPicker else {
                return AnyView(EmptyView())
            }
            return
                AnyView(
                    MultiPicker(rect, data: picker.data, selections: self.model.currentPicker?.selections ?? [])
                        .background(Color.preferredColor(.primary6))
                        .offset(y: self.isShowingPicker ? (rect.height - TableViewLayout.pickerHeight) / 2 - 22 : rect.height)
                        .animation(.easeInOut)
                )
        }
        return AnyView(EmptyView())
    }
}
