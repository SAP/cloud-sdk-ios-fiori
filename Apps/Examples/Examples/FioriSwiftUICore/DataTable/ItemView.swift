import SwiftUI

struct ItemView: View {
    let dataItem: TableDataItem
    let scale: CGFloat
    @State var value: String = ""
    @ObservedObject var model: TableModel
//    @State var editInPlace: Bool = false
//    @State private var showEditPage: Bool = false
    let isHeader: Bool
    let index: (Int, Int)
    
    init(_ dataItem: TableDataItem, _ scale: CGFloat, _ model: TableModel, _ index: (Int, Int), _ isHeader: Bool = false) {
        self.dataItem = dataItem
        self.scale = scale
        self.model = model
        self.index = index
        self.isHeader = isHeader
    }
    
    var body: some View {
        Group {
            switch dataItem.value {
            case .image(let image):
                image
                    .frame(width: 45, height: 45)
            case .text(let value):
                let fontSize: CGFloat = self.isHeader ? 15 : 17
                let textColor: Color = self.isHeader ? .gray : .black
                Text(value)
                    .font(.system(size: fontSize * self.scale))
                    .foregroundColor(textColor)
                    .multilineTextAlignment(.leading)
                    .frame(width: dataItem.size.width, height: dataItem.size.height, alignment: .leading)
            }
        }
    }
    
//    func makeBody(in rect: CGRect) -> some View {
//        ZStack {
//            switch dataItem.value {
//            case .image(let image):
//                image
//                    .frame(width: 45, height: 45)
//            case .text(let value):
//                edible(dataItem: dataItem, dataValue: value)
//            }
//        }
//    }
    
//    func edible(dataItem: TableDataItem, dataValue: String) -> some View {
//        DispatchQueue.main.async {
//            self.value = dataValue
//        }
//        return Group {
//            if editInPlace {
//                TextField("", text: $value) { (changed) in
    ////                    DispatchQueue.main.async {
    ////                        self.model.data?[self.index.0][self.index.1] = DataTextItem(value)
    ////                        self.model.allDataItems = []
    ////                    }
//                } onCommit: {
//                    self.model.data?[self.index.0][self.index.1] = DataTextItem(value)
//                    self.model.allDataItems = []
//                    self.editInPlace = false
//                }
//                .multilineTextAlignment(.leading)
//                .font(.system(size: 14 * self.scale))
//                .foregroundColor(Color.orange)
//
//            } else {
//                Text(dataValue)
//                    .font(.system(size: 14 * self.scale))
//                    .foregroundColor(Color.black)
//                    .multilineTextAlignment(.leading)
//                    .contextMenu(ContextMenu(menuItems: {
//                        Button {
//                            self.editInPlace = true
//                        } label: {
//                            Label("Edit Cell", systemImage: "square.and.pencil")
//                        }
//
//                        Button {
//                            self.showEditPage = true
//                        } label: {
//                            Label("Edit Row", systemImage: "square.and.pencil")
//                        }
//
//                        Button {
//
//                        } label: {
//                            Label("Delete Row", systemImage: "minus.circle")
//                        }
//                    }))
//                    .sheet(isPresented: $showEditPage, content: {
//                        showEditPageToggled()
//                    })
//            }
//        }
        
//    }
//
//    func showEditPageToggled() -> some View {
//        let titles = model.allDataItems.first ?? []
//        let contents = model.allDataItems[self.index.0]
//
//        let view = EditRowView(titles, contents)
//        return
//            view
//            .navigationBarItems(leading: Button("Cancel", action: {
//
//        }), trailing: Button("Done", action: {
//
//        }))
//    }
}

class ItemStateControl: ObservableObject {
    @Published var editEnable: Bool = false
}
