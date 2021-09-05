import FioriSwiftUICore
import SwiftUI

struct SingleActionCollectionView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    init(cellTapped: Binding<Bool>) {}
    init() {}
    
    var body: some View {
        let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 32), count: horizontalSizeClass == .some(.regular) ? 2 : 1)
        
        return ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0 ..< 4) { _ in
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
                    }, action: {
                        Button {
                            print("Tapped Follow")
                        } label: {
                            Image(systemName: "arrow.down.circle")
                                .resizable()
//                                .font(.callout)
                                .foregroundColor(Color.preferredColor(.tintColorDark))
                                .frame(width: 32, height: 32)
                        }.buttonStyle(PlainButtonStyle())
                    })
                }
            }.padding(EdgeInsets(top: 8, leading: 32, bottom: 8, trailing: 32))
        }.navigationTitle("Single Action Collection Example")
    }
}

struct SingleActionCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        SingleActionCollectionView(cellTapped: Binding.constant(false))
    }
}
