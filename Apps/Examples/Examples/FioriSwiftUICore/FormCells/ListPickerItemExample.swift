import FioriSwiftUICore
import SwiftUI

struct ListPickerGroupedItem: ListPickerSectionModel {
    let title: String
    let items: [String]
}

struct ListPickerItemExample: View {
    enum DataType {
        case text
        case frameworks
        case object
        case grouped
    }
    
    private let model = ListPickerItemDataModel.data
    private let stringsModel = ["First", "Second", "Third", "Fourth", "Fifth"]
    
    private let groupedModel = [
        ListPickerGroupedItem(title: "Fruit", items: ["Apple", "Banana", "Orange", "PineApple"]),
        ListPickerGroupedItem(title: "Number", items: ["First", "Second", "Third", "Fourth", "Fifth"])
    ]
    
    @State var selections: Set<String> = []
    @State var selection: String? = nil
    @State var noneEmptySelection: String = "First"
    
    @State var uuidSelections: Set<UUID> = []
    @State var uuidSelection: UUID? = nil
    @State var uuidNoneEmptySelection: UUID = .init()

    @State var axis: Axis = .horizontal
    @State var dataType: DataType = .text
    
    @State var multiSelections: Bool = false
    @State var isTrackingLiveChanges: Bool = false
    @State var allowSearch: Bool = false
    @State var customDestination: Bool = false
    @State var disableEntriesSection: Bool = false
    @State var allowEmpty: Bool = false
    @State var autoDismissDestination: Bool = false

    var body: some View {
        List {
            Group {
                if self.dataType == .frameworks || self.dataType == .text {
                    // Use default Value
                    ListPickerItem(title: {
                        Text("Title")
                    }, axis: self.axis,
                    destination: {
                        self.destinationViewGroup()
                    })
                } else {
                    // Use custom Value
                    ListPickerItem(title: {
                        Text("Title")
                    }, value: {
                        self.valueView
                    }, axis: self.axis,
                    destination: {
                        self.destinationViewGroup()
                    })
                }
            }
            .onChange(of: self.dataType) { _ in
                self.selections.removeAll()
                self.uuidSelections.removeAll()
                self.selection = nil
                switch self.dataType {
                case .text:
                    self.noneEmptySelection = "First"
                case .frameworks:
                    self.noneEmptySelection = "UIKit"
                case .object:
                    self.uuidNoneEmptySelection = UUID()
                    self.noneEmptySelection = "UIKit"
                case .grouped:
                    self.noneEmptySelection = "PineApple"
                }
            }
            
            Section("Pannel") {
                Picker("Axis", selection: self.$axis) {
                    Text("Horizontal").tag(Axis.horizontal)
                    Text("Vertical").tag(Axis.vertical)
                }
                
                Picker("Data Type", selection: self.$dataType) {
                    Text("Text").tag(DataType.text)
                    Text("Frameworks").tag(DataType.frameworks)
                    Text("Object").tag(DataType.object)
                    Text("Grouped").tag(DataType.grouped)
                }
                
                Toggle("Multi Selections", isOn: self.$multiSelections)
                
                Toggle("Tracking Live Changes", isOn: self.$isTrackingLiveChanges)
                
                Toggle("Search Support", isOn: self.$allowSearch)
                
                Toggle("Custom Destination", isOn: self.$customDestination)

                Toggle("Disable Entries Section", isOn: self.$disableEntriesSection)
                
                Toggle("Allow Empty", isOn: self.$allowEmpty)
                
                Toggle("Auto Dismiss Destination(Only for Single Selection and isTrackingLiveChanges is true)", isOn: self.$autoDismissDestination)
            }
        }
        .navigationTitle("List Picker Item")
    }
    
    func destinationViewGroup() -> some View {
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
    }
    
    @ViewBuilder var valueView: some View {
        if self.multiSelections {
            if self.dataType == .object {
                let str = Array(uuidSelections).compactMap { uuid in
                    if let framework = ListPickerItemDataModel.getFramwork(with: uuid) {
                        return framework.name
                    }
                    
                    return nil
                }.joined(separator: ", ")
                Text(str)
            } else {
                let str = Array(selections).joined(separator: ", ")
                Text(str)
            }
        } else {
            if self.dataType == .object {
                if self.allowEmpty {
                    if let uuid = uuidSelection {
                        let framework = ListPickerItemDataModel.getFramwork(with: uuid)
                        Text(framework?.name ?? "No Selection")
                    } else {
                        Text("No Selection")
                    }
                } else {
                    let framework = ListPickerItemDataModel.getFramwork(with: self.uuidNoneEmptySelection)
                    Text(framework?.name ?? "Wrong UUID")
                }
            } else {
                if self.allowEmpty {
                    Text(self.selection ?? "No Selection")
                } else {
                    Text(self.noneEmptySelection)
                }
            }
        }
    }
    
    @ViewBuilder var destinationView: some View {
        switch self.dataType {
        case .text:
            let filter: (String, String) -> Bool = { f, s in f.contains(s) }
            if self.multiSelections {
                ListPickerDestination(self.stringsModel,
                                      id: \.self,
                                      selections: self.$selections,
                                      allowEmpty: self.allowEmpty,
                                      isTrackingLiveChanges: self.isTrackingLiveChanges,
                                      searchFilter: self.allowSearch ? filter : nil)
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
        case .frameworks:
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
        case .object:
            let filter: ((ListPickerItemDataModel.Framework, String) -> Bool) = { f, s in
                if s.count > 0 {
                    return f.name.localizedCaseInsensitiveContains(s)
                } else {
                    return true
                }
            }
            
            if self.multiSelections {
                ListPickerDestination(self.model,
                                      id: \.id,
                                      children: \.children,
                                      selections: self.$uuidSelections,
                                      allowEmpty: self.allowEmpty,
                                      isTrackingLiveChanges: self.isTrackingLiveChanges,
                                      searchFilter: self.allowSearch ? filter : nil)
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
            } else {
                if self.allowEmpty {
                    ListPickerDestination(self.model,
                                          id: \.id,
                                          children: \.children,
                                          selection: self.$uuidSelection,
                                          isTrackingLiveChanges: self.isTrackingLiveChanges,
                                          searchFilter: self.allowSearch ? filter : nil)
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
                } else {
                    ListPickerDestination(self.model,
                                          id: \.id,
                                          children: \.children,
                                          selection: self.$uuidNoneEmptySelection,
                                          isTrackingLiveChanges: self.isTrackingLiveChanges,
                                          searchFilter: self.allowSearch ? filter : nil)
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
        case .grouped:
            let filter: (String, String) -> Bool = { f, s in f.contains(s) }
            if self.multiSelections {
                ListPickerDestination(self.groupedModel,
                                      id: \.self,
                                      selections: self.$selections,
                                      allowEmpty: self.allowEmpty,
                                      isTrackingLiveChanges: self.isTrackingLiveChanges,
                                      searchFilter: self.allowSearch ? filter : nil)
                { e in
                    Text(e)
                }
            } else {
                if self.allowEmpty {
                    ListPickerDestination(self.groupedModel,
                                          id: \.self,
                                          selection: self.$selection,
                                          isTrackingLiveChanges: self.isTrackingLiveChanges,
                                          searchFilter: self.allowSearch ? filter : nil)
                    { e in
                        Text(e)
                    }
                } else {
                    ListPickerDestination(self.groupedModel,
                                          id: \.self,
                                          selection: self.$noneEmptySelection,
                                          isTrackingLiveChanges: self.isTrackingLiveChanges,
                                          searchFilter: self.allowSearch ? filter : nil)
                    { e in
                        Text(e)
                    }
                }
            }
        }
    }
}
