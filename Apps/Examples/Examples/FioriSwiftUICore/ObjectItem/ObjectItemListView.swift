import SwiftUI

struct ObjectItemListView<T: ListDataProtocol>: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    let title: String
    let listDataType: T.Type
    let changeLeftMargin: Bool
    let showEditButton: Bool
    
    @State var cellTapped = false
    @State var singleSelection: Int?
    
    init(title: String, listDataType: T.Type, changeLeftMargin: Bool = true, showEditButton: Bool = true) {
        self.title = title
        self.listDataType = listDataType
        self.changeLeftMargin = changeLeftMargin
        self.showEditButton = showEditButton
    }
    
    func createInstance(typeThing: T.Type) -> T {
        typeThing.init(cellTapped: self.$cellTapped)
    }
    
    var body: some View {
        let listData = self.createInstance(typeThing: self.listDataType)
        
        return List {
            ForEach(0 ..< listData.numberOfSections(), id: \.self) { sectionIndex in
                Section(header: Text(listData.titleForHeaderInSection(sectionIndex)).textCase(.none)) {
                    ForEach(0 ..< listData.numberOfRowsInSection(sectionIndex), id: \.self) { index in
                        if listData.containAccessoryView(IndexPath(row: index, section: sectionIndex)) {
                            NavigationLink(destination: listData.cellForRow(IndexPath(row: index, section: sectionIndex))) {
                                listData.cellForRow(IndexPath(row: index, section: sectionIndex))
                            }
                        } else {
                            listData.cellForRow(IndexPath(row: index, section: sectionIndex))
                        }
                    }
                    .onDelete { indexSet in
                        print("delete \(indexSet)")
                    }
                }
            }.listRowBackground(Color.preferredColor(.secondaryGroupedBackground))
                .ifApply(self.horizontalSizeClass == .some(.compact) && self.changeLeftMargin) {
                    $0.listRowInsets(EdgeInsets(top: 0, leading: 32, bottom: 0, trailing: 32))
                }
        }
        .navigationBarItems(trailing: HStack {
            if self.showEditButton {
                EditButton()
            }
        })
        .navigationBarTitle(self.title, displayMode: .inline)
        .sheet(isPresented: self.$cellTapped) {
            Text("Tapped the cell").padding()
            
            VStack {
                Button("Dismiss") {
                    self.cellTapped = false
                }
            }.padding()
        }
    }
}
