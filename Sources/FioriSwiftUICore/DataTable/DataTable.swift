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
    @Environment(\.backgroundColor) var backgroundColor
    
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
            if self.horizontalSizeClass == .compact, self.verticalSizeClass == .regular, self.model.showListView {
                TableListView(layoutManager: layoutManager)
            } else {
                GridTableView(layoutManager: layoutManager)
                    .clipped()
            }
        }
        .environmentObject(self.layoutManager)
        .background(self.backgroundColor)
    }
    
    /// Modifer for setting the background color.
    public func backgroundColor(_ color: Color) -> some View {
        self.environment(\.backgroundColor, color)
    }
}
