import SwiftUI

struct TableTitleRowView: View {
    var model: [TableColumn]
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                ForEach(0 ..< self.model.count) { index in
                    self.SafeText(self.model[index].title).font(.system(size: 14))
                }
                .frame(width: geometry.size.width / CGFloat(self.model.count), height: 40, alignment: .leading)
            }
            .overlay(
                Color(UIColor.lightGray.withAlphaComponent(0.3))
                    .padding(EdgeInsets(top: 0, leading: -25, bottom: 0, trailing: -1))
            )
        }
        .frame(height: 40)
    }
}
