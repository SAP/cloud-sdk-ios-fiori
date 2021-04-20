import SwiftUI

public struct TableDataView: View {
    @EnvironmentObject public var model: TableModel

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass

    @Binding public var isEditing: Bool
            
    public var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let layoutManager = TableLayoutManager(model: self.model, isEditing: self.isEditing)
        let dataManager = TableDataManager(selectedIndexes: self.model.selectedIndexes)
        layoutManager.sizeClass = self.horizontalSizeClass ?? .compact
        layoutManager.rect = rect
        
        return Group {
            if self.horizontalSizeClass == .compact, self.verticalSizeClass == .regular, self.model.showListView {
                let listView = TableListView(layoutManager: layoutManager)
                listView
            } else {
                let gridView = GridTableView(layoutManager: layoutManager)
                gridView
                    .frame(minWidth: 300, idealWidth: UIScreen.main.bounds.width, maxWidth: .infinity, minHeight: 300, idealHeight: UIScreen.main.bounds.height, maxHeight: .infinity, alignment: .center)
            }
        }
        .environmentObject(layoutManager)
        .environmentObject(dataManager)
    }
}
