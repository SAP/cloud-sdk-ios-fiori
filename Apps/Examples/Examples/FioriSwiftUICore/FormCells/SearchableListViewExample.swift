import FioriSwiftUICore
import SwiftUI

@available(iOS 15, *)
struct SearchableListViewExample: View {
    @Environment(\.presentationMode) var presentationMode
    
    private let model = ListPickerItemDataModel.data
    
    @State var selection1: Set<UUID> = []
    @State var selection2: Set<UUID> = [ListPickerItemDataModel.data.last?.id ?? UUID()]
    @State var selection3: Set<UUID> = []
    @State var selection4: Set<UUID> = []
    @State var selection5: Set<UUID> = []
    @State var selection6: Set<String> = []
    
    @State var presentingModal: Bool = false
    @State var stringPresentingModal: Bool = false

    public var body: some View {
        VStack {
            HStack {
                Text("empty first")
                Spacer()
                NavigationLink {
                    self.pickerView(self.$selection1)
                        .navigationTitle("Title: Pick One")
                } label: {
                    let str = self.selectedValues(Array(self.selection1))
                    Text(str.isEmpty ? "pick one" : str)
                        .frame(minWidth: 100, minHeight: 40)
                        .background(Color.black.opacity(0.1))
                }
            }
            
            HStack {
                Text("with pre-selection")
                Spacer()
                NavigationLink {
                    self.pickerView(self.$selection2)
                        .navigationTitle("Title: Pick One")
                } label: {
                    let str = self.selectedValues(Array(self.selection2))
                    Text(str)
                        .frame(minWidth: 100, minHeight: 40)
                        .background(Color.black.opacity(0.1))
                }
            }
            
            HStack {
                Text("allow multi-selections")
                Spacer()
                NavigationLink {
                    self.pickerView(self.$selection3, true, false)
                        .cancelActionModifier {
                            $0.font(.callout).foregroundColor(Color.red)
                        }
                        .doneActionModifier {
                            $0.font(.callout.bold()).foregroundColor(Color.black)
                        }
                        .navigationTitle("Title: Pick Any Values")
                } label: {
                    let str = self.selectedValues(Array(self.selection3))
                    Text(str)
                        .frame(minWidth: 100, minHeight: 40)
                        .background(Color.black.opacity(0.1))
                }
            }
            
            HStack {
                Text("empty search filter")
                Spacer()
                NavigationLink {
                    self.pickerView(self.$selection4, false, true, useActions: true)
                        .navigationTitle("Title: Pick A Value")
                        .listBackground(Color.cyan)
                } label: {
                    let str = self.selectedValues(Array(self.selection4))
                    Text(str)
                        .frame(minWidth: 100, minHeight: 40)
                        .background(Color.black.opacity(0.1))
                }
            }
            
            HStack {
                Text("sheet present")
                Spacer()
                let str = self.selectedValues(Array(self.selection5))
                Text(str)
                    .frame(minWidth: 100, minHeight: 40)
                    .background(Color.black.opacity(0.1))
                    .onTapGesture {
                        self.presentingModal = true
                    }
                    .sheet(isPresented: self.$presentingModal) {
                        NavigationView {
                            self.pickerView(self.$selection5, useActions: true)
                                .listStyle(.plain)
                                .listBackground(Color.cyan)
                                .cancelActionModifier {
                                    $0.font(.callout).foregroundColor(Color.red)
                                }
                                .doneActionModifier {
                                    $0.font(.title.bold()).foregroundColor(Color.black)
                                }
                                .navigationTitle("Title: Pick A Value")
                        }
                    }
            }
            
            HStack {
                Text("simple string list")
                Spacer()
                Text(self.selection6.joined(separator: ","))
                    .frame(minWidth: 100, minHeight: 40)
                    .background(Color.black.opacity(0.1))
                    .onTapGesture {
                        self.stringPresentingModal = true
                    }
                    .sheet(isPresented: self.$stringPresentingModal) {
                        NavigationView {
                            SearchableListView(data: ["1", "2", "3", "4"],
                                               selection: self.$selection6,
                                               searchFilter: { f, s in f.contains(s) },
                                               rowBackground: { _ in Color.green })
                                .listStyle(.grouped)
                                .cancelActionModifier {
                                    $0.font(.callout).foregroundColor(Color.red)
                                }
                                .doneActionModifier {
                                    $0.font(.title.bold()).foregroundColor(Color.blue)
                                }
                                .navigationTitle("Title: Pick A Value")
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
    
    func pickerView(_ selection: Binding<Set<UUID>>, _ allowsMultipleSelection: Bool = false, _ emptySearch: Bool = false, useActions: Bool = false) -> some View {
        let filter: ((ListPickerItemDataModel.Framework, String) -> Bool) = { f, s in
            if s.count > 0 {
                return f.name.localizedCaseInsensitiveContains(s)
            } else {
                return true
            }
        }
        if useActions {
            return SearchableListView(data: self.model, id: \.id, children: \.children,
                                      selection: selection,
                                      allowsMultipleSelection: allowsMultipleSelection,
                                      searchFilter: emptySearch ? nil : filter,
                                      rowContent: { framework in
                                          ObjectItem {
                                              Text(framework.name)
                                          } description: {
                                              Text("description")
                                          } status: {
                                              Image(systemName: "sun.min")
                                          } detailImage: {
                                              Image(systemName: "mail")
                                          }
                                      },
                                      rowBackground: { framework in
                                          if framework.name == "Core Data" {
                                              return Color.yellow
                                          } else {
                                              return Color.mint
                                          }
                                      },
                                      cancelAction: _Action(actionText: "CacnelAction") {
                                          print("cancel action tapped")
                                      },
                                      doneAction: _Action(actionText: "DoneAction") {
                                          print("done action tapped")
                                      })
        } else {
            return SearchableListView(data: self.model, id: \.id, children: \.children,
                                      selection: selection,
                                      allowsMultipleSelection: allowsMultipleSelection,
                                      searchFilter: emptySearch ? nil : filter)
            { framework in
                ObjectItem {
                    Text(framework.name)
                } description: {
                    Text("description")
                } status: {
                    Image(systemName: "sun.min")
                } detailImage: {
                    Image(systemName: "mail")
                }
            }
        }
    }
}

@available(iOS 15, *)
struct SearchableListViewExample_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SearchableListViewExample()
        }
    }
}
