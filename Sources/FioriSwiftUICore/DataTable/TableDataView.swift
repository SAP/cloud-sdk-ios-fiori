import SwiftUI

public struct TableDataView: View {
    @EnvironmentObject var model: TableModel
    @Environment(\.layoutDirection) var layoutDirection
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass
    
    @ObservedObject var editingHelper = EditingHelper()

    var isEditing: Bool = false {
        didSet {
            self.editingHelper.isEditing = self.isEditing
        }
    }
            
    public var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let layoutManager = TableLayoutManager(model: self.model, isEditing: self.editingHelper.isEditing)
        let dataManager = TableDataManager(selectedIndexes: self.model.selectedIndex, rowData: self.model.rowData)
        layoutManager.sizeClass = self.horizontalSizeClass ?? .compact
        layoutManager.rect = rect
        
        return Group {
            if self.horizontalSizeClass == .compact, self.verticalSizeClass == .regular, self.model.showListView {
                let listView = TableListView(layoutManager: layoutManager)
                listView
            } else {
                let gridView = GridTableView(layoutManager: layoutManager, dataManager: dataManager)
                gridView
            }
        }
        .environmentObject(layoutManager)
        .environmentObject(dataManager)
        .frame(minWidth: 300, idealWidth: UIScreen.main.bounds.width, maxWidth: .infinity, minHeight: 300, idealHeight: UIScreen.main.bounds.height, maxHeight: .infinity, alignment: .center)
    }
}

class EditingHelper: ObservableObject {
    @Published var isEditing: Bool = true
}
