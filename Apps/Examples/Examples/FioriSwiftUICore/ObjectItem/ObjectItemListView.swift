import FioriSwiftUICore
import SwiftUI

struct ObjectItemListView<T: ListDataProtocol>: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    let title: String
    let listDataType: T.Type
    let changeLeftMargin: Bool
    let showEditButton: Bool
    
    @State var cellTapped = false
    @State var singleSelection: Int?
    
    /// Corner radius used for the swipe-revealed rounded corner.
    private let rowCornerRadius: CGFloat = 16
    
    private let cellHorizontalInset: CGFloat = 32
    
    init(title: String, listDataType: T.Type, changeLeftMargin: Bool = true, showEditButton: Bool = true) {
        self.title = title
        self.listDataType = listDataType
        self.changeLeftMargin = changeLeftMargin
        self.showEditButton = showEditButton
    }
    
    func createInstance(typeThing: T.Type) -> ListDataProtocol {
        if let objectItemListData = typeThing as? ObjectItemListDataProtocol.Type {
            return objectItemListData.init(cellTapped: self.$cellTapped)
        } else {
            return typeThing.init(cellTapped: self.$cellTapped)
        }
    }
    
    @ViewBuilder
    private func swipeRoundedTrailing(@ViewBuilder content: () -> some View) -> some View {
        content()
            .padding(.horizontal, self.cellHorizontalInset)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: self.rowCornerRadius, style: .continuous)
                    .fill(Color(.secondarySystemGroupedBackground))
            )
            .clipShape(RoundedRectangle(cornerRadius: self.rowCornerRadius, style: .continuous))
    }
    
    var body: some View {
        let listData = self.createInstance(typeThing: self.listDataType)
        
        return List {
            ForEach(0 ..< listData.numberOfSections(), id: \.self) { sectionIndex in
                Section(header: Text(listData.titleForHeaderInSection(sectionIndex)).textCase(.none)) {
                    ForEach(0 ..< listData.numberOfRowsInSection(sectionIndex), id: \.self) { index in
                        if listData.containAccessoryView(IndexPath(row: index, section: sectionIndex)) {
                            NavigationLink(destination: listData.cellForRow(IndexPath(row: index, section: sectionIndex))) {
                                self.swipeRoundedTrailing {
                                    listData.cellForRow(IndexPath(row: index, section: sectionIndex))
                                }
                            }
                        } else {
                            self.swipeRoundedTrailing {
                                listData.cellForRow(IndexPath(row: index, section: sectionIndex))
                            }
                        }
                    }
                    .onDelete { indexSet in
                        print("delete \(indexSet)")
                    }
                    .listRowInsets(EdgeInsets())
                }
            }
            .objectItemStyle(.actionStyle(ObjectItemBorderedAction()))
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                if self.showEditButton {
                    EditButton()
                }
            }
        }
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
