import SwiftUI

struct TableRowView: View {
    var model: TableRow
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                ForEach(self.model.columns ?? []) { model in
                    TableColumnView(model: model)
                        .frame(width: geometry.size.width / CGFloat(self.model.columns!.count), alignment: .leading)
                }
            }
        }
    }
}
