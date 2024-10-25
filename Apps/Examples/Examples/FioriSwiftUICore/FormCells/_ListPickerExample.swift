import FioriSwiftUICore
import Foundation
import SwiftUI

enum ListPickerItemDataModel {
    struct Framework: Identifiable {
        var id = UUID()
        let name: String
        let children: [Framework]?
        
        init(name: String, children: [Framework]? = nil) {
            self.name = name
            self.children = children
        }
    }
    
    static let data = [
        Framework(name: "SAP iOS SDK", children: [Framework(name: "SAPFiori"), Framework(name: "SAPCommon")]),
        Framework(name: "Core Data"),
        Framework(name: "CloudKit"),
        Framework(name: "SwiftUI"),
        Framework(name: "UIKit")
    ]
    
    static func getFramwork(with uuid: UUID) -> Framework? {
        func findFramework(in data: [Framework]) -> Framework? {
            for framework in data {
                if framework.id == uuid {
                    return framework
                }
                
                if let children = framework.children, !children.isEmpty {
                    if let foundItem = findFramework(in: children) {
                        return foundItem
                    } else {
                        continue
                    }
                }
            }
            
            return nil
        }
        
        return findFramework(in: self.data)
    }
}

struct _ListPickerItemExample: View {
    enum ListPickerCases: CaseIterable, Identifiable {
        case nonIdentifiable
        case identifiable
        case objectItem
        case stringItem
        case differentStyles
        case activeChildren
        case searchable
        case searchableListView
        var id: Self { self }
    }
    
    private let model = ListPickerItemDataModel.data
    
    var body: some View {
        List(_ListPickerItemExample.ListPickerCases.allCases) { e in
            switch e {
            case .nonIdentifiable:
                NavigationLink(
                    destination: _ListPickerItemDataNonIdentifiableExample())
                {
                    Text("NonIdentifiable")
                }
            case .identifiable:
                NavigationLink(
                    destination: _ListPickerItemDataIdentifiableExample())
                {
                    Text("Identifiable")
                }
            case .objectItem:
                NavigationLink(
                    destination: _ListPickerItemWithObjectItemExample())
                {
                    Text("ObjectItem")
                }
            case .stringItem:
                NavigationLink(
                    destination: _ListPickerItemWithStringExample())
                {
                    Text("StringItem")
                }
            case .differentStyles:
                NavigationLink(
                    destination: _ListPickerItemStylesExample())
                {
                    Text("Different Styles")
                }
            case .activeChildren:
                NavigationLink(
                    destination: _ListPickerItemActiveChildrenExample())
                {
                    Text("Active Children Directly")
                }
            case .searchable:
                NavigationLink(
                    destination: _ListPickerItemWithSearchExample())
                {
                    Text("Searchable List Picker Item")
                }
            case .searchableListView:
                if #available(iOS 15, *) {
                    NavigationLink(
                        destination: SearchableListViewExample())
                    {
                        Text("Searchable List View")
                    }
                } else {
                    Text("Searchable List View only available for iOS 15+")
                }
            }
        }
    }
}

// MARK: List picker item examples

struct _ListPickerItemDataNonIdentifiableExample: View {
    private let model = ListPickerItemDataModel.data
    
    @State var selections: Set<String> = []
    
    public init() {}

    public var body: some View {
        List {
            _ListPickerItem(key: {
                Text("Frameworks")
            }, value: {
                let str = Array(selections).joined(separator: ", ")
                Text(str)
            }, configuration:
            _ListPickerItemConfiguration(self.model, id: \.name, children: \.children, selection: self.$selections, rowContent: { framework in
                Text(framework.name)
            }))
        }
        .listPickerListViewModifier { c in
            c.toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        print("Tool bar item tapped.")
                    } label: {
                        Image(systemName: "person")
                    }
                }
            }.listStyle(.inset)
        }
        .navigationBarTitle(Text("Form"))
    }
}

struct _ListPickerItemDataIdentifiableExample: View {
    private let model = ListPickerItemDataModel.data
    
    @State var selections: Set<UUID> = []
    
    public init() {}

    public var body: some View {
        List {
            _ListPickerItem(key: {
                Text("Frameworks")
            }, value: {
                let str = Array(selections).compactMap { uuid in
                    if let framework = ListPickerItemDataModel.getFramwork(with: uuid) {
                        return framework.name
                    }
                    
                    return nil
                }.joined(separator: ", ")
                
                Text(str)
            }, configuration:
            _ListPickerItemConfiguration(self.model, children: \.children, selection: self.$selections, rowContent: { framework in
                Text(framework.name)
            }))
        }
        .navigationBarTitle(Text("Form"))
    }
}

struct _ListPickerItemFormExample: View {
    private let model = ListPickerItemDataModel.data
    
    @State var selections: Set<String> = []
    
    var body: some View {
        Form {
            _ListPickerItem(key: {
                Text("Frameworks")
            }, value: {
                let str = Array(selections).joined(separator: ", ")
                Text(str)
            }, configuration: _ListPickerItemConfiguration(self.model, id: \.name, children: \.children, selection: self.$selections, rowContent: { framework in
                Text(framework.name)
            }))
        }
        .navigationBarTitle(Text("Form"))
    }
}

struct _ListPickerItemWithSearchExample: View {
    private let model = ListPickerItemDataModel.data
    
    @State var selections: Set<UUID> = []
    @State var trackingSelections: Set<UUID> = []
    
    var body: some View {
        List {
            if #available(iOS 15.0, *) {
                _ListPickerItem(key: {
                    Text("Frameworks")
                }, value: {
                    let str = Array(selections).compactMap { uuid in
                        if let framework = ListPickerItemDataModel.getFramwork(with: uuid) {
                            return framework.name
                        }
                        return nil
                    }.joined(separator: ", ")
                    Text(str)
                }, configuration: _ListPickerItemConfiguration(model, id: \.id, children: \.children, selection: $selections, searchFilter: { framework, searchText in
                    if searchText.count > 0 {
                        return framework.name.localizedCaseInsensitiveContains(searchText)
                    } else {
                        return true
                    }
                }, rowContent: { framework in
                    ObjectItem {
                        Text(framework.name)
                    } description: {
                        Text("description")
                    } status: {
                        Image(systemName: "sun.min")
                    } detailImage: {
                        Image(systemName: "mail")
                    }
                }))
            } else {
                _ListPickerItem(key: {
                    Text("Frameworks")
                }, value: {
                    let str = Array(selections).compactMap { uuid in
                        if let framework = ListPickerItemDataModel.getFramwork(with: uuid) {
                            return framework.name
                        }
                        
                        return nil
                    }.joined(separator: ", ")
                    Text(str)
                }, configuration: _ListPickerItemConfiguration(self.model, id: \.id, children: \.children, selection: self.$selections, rowContent: { framework in
                    Text(framework.name)
                }))
            }
        }
    }
}

struct _ListPickerItemWithObjectItemExample: View {
    private let model = ListPickerItemDataModel.data
    
    @State var selections: Set<String> = []
    
    var body: some View {
        List {
            _ListPickerItem(key: {
                Text("Frameworks")
            }, value: {
                let str = Array(selections).joined(separator: ", ")
                Text(str)
            }, configuration: _ListPickerItemConfiguration(self.model, id: \.name, children: \.children, selection: self.$selections, rowContent: { framework in
                
                ObjectItem {
                    Text(framework.name)
                } description: {
                    Text("description")
                } status: {
                    Image(systemName: "sun.min")
                } detailImage: {
                    Image(systemName: "mail")
                }

            }))
        }
        .navigationBarTitle(Text("Form"))
    }
}

public struct _ListPickerItemWithStringExample: View {
    private let model = ["First", "Second", "Third", "Fourth", "Fifth"]
    
    @State var selections: Set<String> = []
    
    public init() {}

    public var body: some View {
        List {
            _ListPickerItem(key: {
                Text("Choice")
            }, value: {
                let str = Array(selections).joined(separator: ", ")
                Text(str)
            }, configuration:
            _ListPickerItemConfiguration(self.model, selection: self.$selections))
        }
        .navigationBarTitle(Text("Form"))
    }
}

struct _ListPickerItemActiveChildrenExample: View {
    private let model = ListPickerItemDataModel.data
    
    @State var selections: Set<String> = []
    @State var isActive: Bool = true
    
    public init() {}

    public var body: some View {
        List {
            _ListPickerItem(key: {
                Text("Frameworks")
            }, value: {
                let str = Array(selections).joined(separator: ", ")
                Text(str)
            }, configuration:
            _ListPickerItemConfiguration(self.model, id: \.name, children: \.children, selection: self.$selections, isActive: self.$isActive, rowContent: { framework in
                Text(framework.name)
            }))
        }
        .listPickerListViewModifier { c in
            c.navigationBarTitle(Text("Children"))
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    self.isActive.toggle()
                } label: {
                    Image(systemName: "switch.2")
                }
            }
        }
        .navigationBarTitle(Text("Parent"))
    }
}

public struct _ListPickerItemStylesExample: View {
    private let model = ["First", "Second", "Third", "Fourth", "Fifth"]
    
    @State var selections: Set<String> = ["Second"]
    
    @State var isEnabled: Bool = true
    @State var axis: Axis = .horizontal
    
    public var body: some View {
        List {
            Section("List Picker Item") {
                _ListPickerItem(key: {
                    Text("Choice")
                }, value: {
                    let str = Array(selections).joined(separator: ", ")
                    Text(str)
                }, axis: self.axis,
                configuration:
                _ListPickerItemConfiguration(self.model, selection: self.$selections))
                    .disabled(!self.isEnabled)
            }
            
            Section("Styles Panel") {
                Toggle("Is Enabled", isOn: self.$isEnabled)
                Picker("Axis", selection: self.$axis) {
                    Text("Horizontal").tag(Axis.horizontal)
                    Text("Vertical").tag(Axis.vertical)
                }
            }
        }
        .navigationBarTitle(Text("Form"))
    }
}

struct _ListPickerItemPreview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            _ListPickerItemActiveChildrenExample()
        }
        
        NavigationView {
            _ListPickerItemDataNonIdentifiableExample()
        }
        
        NavigationView {
            _ListPickerItemDataIdentifiableExample()
        }
        
        NavigationView {
            _ListPickerItemFormExample()
        }
        
        NavigationView {
            _ListPickerItemWithObjectItemExample()
        }
        
        NavigationView {
            _ListPickerItemWithStringExample()
        }
        
        NavigationView {
            _ListPickerItemWithSearchExample()
        }
    }
}
