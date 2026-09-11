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
    
    private var cellHorizontalInset: CGFloat {
        (self.horizontalSizeClass == .some(.compact) && self.changeLeftMargin) ? 32 : 16
    }
    
    private var cellVerticalInset: CGFloat {
        (self.horizontalSizeClass == .some(.compact) && self.changeLeftMargin) ? 0 : 16
    }
    
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
            .padding(.vertical, self.cellVerticalInset)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            .background(Color(.secondarySystemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .contentShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
    
    var body: some View {
        let listData = self.createInstance(typeThing: self.listDataType)
        
        return List {
            ForEach(0 ..< listData.numberOfSections(), id: \.self) { sectionIndex in
                Section(header: Text(listData.titleForHeaderInSection(sectionIndex)).textCase(.none)) {
                    ForEach(0 ..< listData.numberOfRowsInSection(sectionIndex), id: \.self) { index in
                        Group {
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
                        .listRowInsets(EdgeInsets())
                        .alignmentGuide(.listRowSeparatorLeading) { _ in 16 }
                        .alignmentGuide(.listRowSeparatorTrailing) { d in d.width - 16 }
                    }
                    .onDelete { indexSet in
                        print("delete \(indexSet)")
                    }
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
