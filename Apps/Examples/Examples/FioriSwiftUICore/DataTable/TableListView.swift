import Foundation
import SwiftUI

struct TableListView: View {
    @EnvironmentObject var model: TableModel
    @Environment(\.tableContext) var tableContext
    
    var body: some View {
        GeometryReader { proxy in
            self.makeBody(in: proxy.frame(in: .local))
        }
    }
    
    func makeBody(in rect: CGRect) -> some View {
        let items = self.tableContext.getListItems(self.model)
        return
            ScrollView(.vertical) {
                LazyVStack(alignment: .leading, spacing: 15, pinnedViews: [], content: {
                    ForEach(items, id: \.self) { item in
                        TableListItemView(item: item)
                        Divider()
                    }
                })
            }
    }
}
