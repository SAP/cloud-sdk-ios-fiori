import FioriSwiftUICore
import SwiftUI

struct SingleActionCollectionView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @ViewBuilder
    func getObjectItem() -> some View {
        ObjectItem(title: {
            Text("Transform Overheating")
        }, subtitle: {
            Text("09:45 AM")
        }, footnote: {
            Text("Functional Location 234 - Hamburg")
        }, detailImage: {
            Image("rw")
                .resizable()
                .frame(width: 45, height: 45)
        }, icons: {
            Image(systemName: "checkmark")
                .resizable()
                .frame(width: 10, height: 10)
            Image(systemName: "checkmark")
                .resizable()
                .frame(width: 10, height: 10)
        }, action: { FioriButton(action: { _ in
            print("Tapped Follow")
        }, label: { _ in
            Image(systemName: "arrow.down.circle")
                .resizable()
                .frame(width: 32, height: 32)
        }) })
    }
    
    var body: some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 32), count: horizontalSizeClass == .some(.regular) ? 2 : 1)

        return ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0 ..< 4) { _ in
                    self.getObjectItem()
                }
            }
            .padding(EdgeInsets(top: 8, leading: 32, bottom: 8, trailing: 32))
        }
        .navigationTitle("Single Action Collection Example")
    }
}
