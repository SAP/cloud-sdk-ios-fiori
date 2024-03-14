import FioriSwiftUICore
import SwiftUI

struct SingleActionCollectionView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var isNewObjectItem = false
    
    init(cellTapped: Binding<Bool>) {}
    init(isNewObjectItem: Bool = false) {
        self.isNewObjectItem = isNewObjectItem
    }
    
    @ViewBuilder
    func getObjectItem() -> some View {
        if self.isNewObjectItem {
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
                    .foregroundColor(Color.preferredColor(.tintColor))
                    .frame(width: 32, height: 32)
            }) })
        } else {
            _ObjectItem(title: {
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
            }, action: {
                Button {
                    print("Tapped Follow")
                } label: {
                    Image(systemName: "arrow.down.circle")
                        .resizable()
                        .foregroundColor(Color.preferredColor(.tintColor))
                        .frame(width: 32, height: 32)
                }.buttonStyle(PlainButtonStyle())
            })
        }
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

struct SingleActionCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        SingleActionCollectionView(cellTapped: Binding.constant(false))
    }
}
