import SwiftUI

public struct TableCardView: View {
    @ObservedObject var model: TableCard
    
    public init(model: TableCard) {
        self.model = model
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HeaderView(model: model.header)
            
            if model.content.count > 0 {
                VStack(alignment: .leading, spacing: 0) {
                    if model.content.first?.columns != nil {
                        TableTitleRowView(model: model.content.first!.columns!)
                    }
                    ForEach(model.content) {
                        TableRowView(model: $0)
                            .frame(height: 30)
                            .padding(EdgeInsets(top: 8, leading: 0, bottom: 0, trailing: 0))
                    }
                }
                .padding(10)
            }
        }
        .padding(16)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.gray, lineWidth: 0.5)
        ).padding(16)
    }
}
