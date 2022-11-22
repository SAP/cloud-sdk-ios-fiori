import FioriSwiftUICore
import SwiftUI

struct SearchableListViewExample: View {
    @Environment(\.presentationMode) var presentationMode
    
    private let model = ListPickerItemDataModel.data
    
    @State var selection1: Set<UUID> = []
    @State var selection2: Set<UUID> = [ListPickerItemDataModel.data.last?.id ?? UUID()]
    @State var selection3: Set<UUID> = []
    @State var selection4: Set<UUID> = []
    @State var selection5: Set<UUID> = []
    
    @State var presentingModal: Bool = false
    
    public var body: some View {
        VStack {
            HStack {
                Text("empty first")
                Spacer()
                NavigationLink {
                    pickerView($selection1)
                } label: {
                    let str = selectedValues(Array(selection1))
                    Text(str.isEmpty ? "pick one" : str)
                        .frame(minWidth: 100, minHeight: 40)
                        .background(Color.black.opacity(0.1))
                }
            }
            
            HStack {
                Text("with pre-selection")
                Spacer()
                NavigationLink {
                    pickerView($selection2)
                } label: {
                    let str = selectedValues(Array(selection2))
                    Text(str)
                        .frame(minWidth: 100, minHeight: 40)
                        .background(Color.black.opacity(0.1))
                }
            }
            
            HStack {
                Text("allow multi-selections")
                Spacer()
                NavigationLink {
                    pickerView($selection3, true, false)
                } label: {
                    let str = selectedValues(Array(selection3))
                    Text(str)
                        .frame(minWidth: 100, minHeight: 40)
                        .background(Color.black.opacity(0.1))
                }
            }
            
            HStack {
                Text("empty search filter")
                Spacer()
                NavigationLink {
                    pickerView($selection4, false, true)
                } label: {
                    let str = selectedValues(Array(selection4))
                    Text(str)
                        .frame(minWidth: 100, minHeight: 40)
                        .background(Color.black.opacity(0.1))
                }
            }
            
            HStack {
                Text("sheet present")
                Spacer()
                let str = selectedValues(Array(selection5))
                Text(str)
                    .frame(minWidth: 100, minHeight: 40)
                    .background(Color.black.opacity(0.1))
                    .onTapGesture {
                        presentingModal = true
                    }
                    .sheet(isPresented: $presentingModal) {
                        NavigationView {
                            pickerView($selection5)
                        }
                    }
            }
            
            Spacer()
        }
        .padding()
        .navigationBarTitle(Text("SeachableListViewExample"))
    }
    
    func selectedValues(_ selection: [UUID]) -> String {
        let str = selection.compactMap { uuid in
            if let framework = ListPickerItemDataModel.getFramwork(with: uuid) {
                return framework.name
            }
            return nil
        }.joined(separator: ", ")
        return str
    }
    
    func pickerView(_ selection: Binding<Set<UUID>>, _ allowsMultipleSelection: Bool = false, _ emptySearch: Bool = false) -> some View {
        if #available(iOS 15.0, *) {
            let filter: ((ListPickerItemDataModel.Framework, String) -> Bool) = { f, s in
                if s.count > 0 {
                    return f.name.localizedCaseInsensitiveContains(s)
                } else {
                    return true
                }
            }
            return SearchableListView(data: model, id: \.id, children: \.children,
                                      selection: selection,
                                      allowsMultipleSelection: allowsMultipleSelection,
                                      searchFilter: emptySearch ? nil : filter) { framework in
                ObjectItem {
                    Text(framework.name)
                } descriptionText: {
                    Text("description")
                } status: {
                    Image(systemName: "sun.min")
                } detailImage: {
                    Image(systemName: "mail")
                }
            }
        } else {
            return EmptyView()
        }
    }
}

struct SearchableListViewExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchableListViewExample()
        }
    }
}
