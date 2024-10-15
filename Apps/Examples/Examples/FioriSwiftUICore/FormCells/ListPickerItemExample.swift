import FioriSwiftUICore
import SwiftUI

struct ListPickerItemExample: View {
    private let model = ListPickerItemDataModel.data
    private let stringsModel = ["First", "Second", "Third", "Fourth", "Fifth"]
    
    @State var selections: Set<String> = []
    @State var selection: String? = nil
    
    @State var noneEmptySelection: String = "UIKit"

    @State var axis: Axis = .horizontal
    @State var useSimpleModel: Bool = false
    
    @State var multiSelections: Bool = false
    @State var isTrackingLiveChanges: Bool = false
    @State var allowSearch: Bool = false
    @State var customDestination: Bool = false
    @State var disableEntriesSection: Bool = false
    @State var allowEmpty: Bool = false
    @State var autoDismissDestination: Bool = false

    var body: some View {
        List {
            ListPickerItem(title: {
                Text("Frameworks")
            }, value: {
                self.valueView
            }, axis: self.axis,
            destination: {
                self.destinationView
                    .disableEntriesSection(self.disableEntriesSection)
                    .autoDismissDestination(self.autoDismissDestination)
                    .navigationTitle("Destination Title")
                    .ifApply(self.customDestination) {
                        $0.cancelActionStyle { _ in
                            Button {
                                print("This is dismiss without selections")
                            } label: {
                                Image(systemName: "chevron.left")
                            }
                        }
                        .applyActionStyle { _ in
                            Button {
                                print("This is dismiss with selections")
                            } label: {
                                Image(systemName: "checkmark")
                            }
                        }
                        .allEntriesSectionTitleStyle { _ in
                            Text("All Entries Title")
                        }
                        .selectedEntriesSectionTitleStyle { _ in
                            Text("Selected Entries Title")
                        }
                        .selectAllActionStyle { _ in
                            FioriButton(title: "Select All Action") { _ in }
                        }
                        .deselectAllActionStyle { _ in
                            FioriButton(title: "Deselect All Action") { _ in }
                        }
                        .listStyle(.plain)
                    }
            })
            .onChange(of: self.useSimpleModel) { _ in
                self.selections.removeAll()
                self.selection = nil
                self.noneEmptySelection = self.useSimpleModel ? "First" : "UIKit"
            }
            
            Section("Pannel") {
                Picker("Axis", selection: self.$axis) {
                    Text("Horizontal").tag(Axis.horizontal)
                    Text("Vertical").tag(Axis.vertical)
                }
                
                Toggle("Use simple model", isOn: self.$useSimpleModel)
                
                Toggle("Multi Selections", isOn: self.$multiSelections)
                
                Toggle("Tracking Live Changes", isOn: self.$isTrackingLiveChanges)
                
                Toggle("Search Support", isOn: self.$allowSearch)
                
                Toggle("Custom Destination", isOn: self.$customDestination)

                Toggle("Disable Entries Section", isOn: self.$disableEntriesSection)
                
                Toggle("Allow Empty", isOn: self.$allowEmpty)
                
                Toggle("Auto Dismiss Destination(Only for Single Selection and isTrackingLiveChanges is true)", isOn: self.$autoDismissDestination)
            }
        }
    }
    
    @ViewBuilder var valueView: some View {
        if self.multiSelections {
            let str = Array(selections).joined(separator: ", ")
            Text(str)
        } else {
            if self.allowEmpty {
                Text(self.selection ?? "No Selection")
            } else {
                Text(self.noneEmptySelection)
            }
        }
    }
    
    @ViewBuilder var destinationView: some View {
        if self.useSimpleModel {
            let filter: (String, String) -> Bool = { f, s in f.contains(s) }
            if self.multiSelections {
                ListPickerDestination(self.stringsModel,
                                      id: \.self,
                                      selections: self.$selections,
                                      allowEmpty: self.allowEmpty,
                                      isTrackingLiveChanges: self.isTrackingLiveChanges,
                                      searchFilter: self.allowSearch ? { f, s in f.contains(s) } : nil)
                { e in
                    Text(e)
                }
            } else {
                if self.allowEmpty {
                    ListPickerDestination(self.stringsModel,
                                          id: \.self,
                                          selection: self.$selection,
                                          isTrackingLiveChanges: self.isTrackingLiveChanges,
                                          searchFilter: self.allowSearch ? filter : nil)
                    { e in
                        Text(e)
                    }
                } else {
                    ListPickerDestination(self.stringsModel,
                                          id: \.self,
                                          selection: self.$noneEmptySelection,
                                          isTrackingLiveChanges: self.isTrackingLiveChanges,
                                          searchFilter: self.allowSearch ? filter : nil)
                    { e in
                        Text(e)
                    }
                }
            }
        } else {
            let filter: ((ListPickerItemDataModel.Framework, String) -> Bool) = { f, s in
                if s.count > 0 {
                    return f.name.localizedCaseInsensitiveContains(s)
                } else {
                    return true
                }
            }
            
            if self.multiSelections {
                ListPickerDestination(self.model,
                                      id: \.name,
                                      children: \.children,
                                      selections: self.$selections,
                                      allowEmpty: self.allowEmpty,
                                      isTrackingLiveChanges: self.isTrackingLiveChanges,
                                      searchFilter: self.allowSearch ? filter : nil)
                { e in
                    Text(e.name)
                }
            } else {
                if self.allowEmpty {
                    ListPickerDestination(self.model,
                                          id: \.name,
                                          children: \.children,
                                          selection: self.$selection,
                                          isTrackingLiveChanges: self.isTrackingLiveChanges,
                                          searchFilter: self.allowSearch ? filter : nil)
                    { e in
                        Text(e.name)
                    }
                } else {
                    ListPickerDestination(self.model,
                                          id: \.name,
                                          children: \.children,
                                          selection: self.$noneEmptySelection,
                                          isTrackingLiveChanges: self.isTrackingLiveChanges,
                                          searchFilter: self.allowSearch ? filter : nil)
                    { e in
                        Text(e.name)
                    }
                }
            }
        }
    }
}
