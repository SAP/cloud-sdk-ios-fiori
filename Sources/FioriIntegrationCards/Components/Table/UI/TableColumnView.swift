import SwiftUI

struct TableColumnView: View {
    var model: TableColumn
    private let boldText: Bool
    
    init(model: TableColumn) {
        self.model = model
        self.boldText = model.identifier ?? false
    }
    
    var body: some View {
        SafeText(model.value)
            .foregroundColor(.forStatus(status: model.state))
            .font(.system(size: 12, weight: self.boldText ? .bold : .regular, design: .default))
            .frame(alignment: .leading)
    }
}
