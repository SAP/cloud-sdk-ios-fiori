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

struct ListPickerItemExample: View {
    enum ListPickerCases: CaseIterable, Identifiable {
        case nonIdentifiable
        case identifiable
        case objectItem
        case stringItem
        case searchable
        case searchableListView
        var id: Self { self }
    }
    
    private let model = ListPickerItemDataModel.data
    
    var body: some View {
        List(ListPickerItemExample.ListPickerCases.allCases) { e in
            switch e {
            case .nonIdentifiable:
                NavigationLink(
                    destination: ListPickerItemDataNonIdentifiableExample())
                {
                    Text("NonIdentifiable")
                }
            case .identifiable:
                NavigationLink(
                    destination: ListPickerItemDataIdentifiableExample())
                {
                    Text("Identifiable")
                }
            case .objectItem:
                NavigationLink(
                    destination: ListPickerItemWithObjectItemExample())
                {
                    Text("ObjectItem")
                }
            case .stringItem:
                NavigationLink(
                    destination: ListPickerItemWithStringExample())
                {
                    Text("StringItem")
                }
            case .searchable:
                NavigationLink(
                    destination: ListPickerItemWithSearchExample())
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

struct ListPickerItemDataNonIdentifiableExample: View {
    private let model = ListPickerItemDataModel.data
    
    @State var selections: Set<String> = []
    
    public init() {}

    public var body: some View {
        List {
            ListPickerItem(key: {
                Text("Frameworks")
            }, value: {
                let str = Array(selections).joined(separator: ", ")
                Text(str)
            }, configuration:
            ListPickerItemConfiguration(self.model, id: \.name, children: \.children, selection: self.$selections, rowContent: { framework in
                Text(framework.name)
            }))
        }
        .navigationBarTitle(Text("Form"))
    }
}

struct ListPickerItemDataIdentifiableExample: View {
    private let model = ListPickerItemDataModel.data
    
    @State var selections: Set<UUID> = []
    
    public init() {}

    public var body: some View {
        List {
            ListPickerItem(key: {
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
            ListPickerItemConfiguration(self.model, children: \.children, selection: self.$selections, rowContent: { framework in
                Text(framework.name)
            }))
        }
        .navigationBarTitle(Text("Form"))
    }
}

struct ListPickerItemFormExample: View {
    private let model = ListPickerItemDataModel.data
    
    @State var selections: Set<String> = []
    
    var body: some View {
        Form {
            ListPickerItem(key: {
                Text("Frameworks")
            }, value: {
                let str = Array(selections).joined(separator: ", ")
                Text(str)
            }, configuration: ListPickerItemConfiguration(self.model, id: \.name, children: \.children, selection: self.$selections, rowContent: { framework in
                Text(framework.name)
            }))
        }
        .navigationBarTitle(Text("Form"))
    }
}

struct ListPickerItemWithSearchExample: View {
    private let model = ListPickerItemDataModel.data
    
    @State var selections: Set<UUID> = []
    @State var trackingSelections: Set<UUID> = []
    
    var body: some View {
        List {
            if #available(iOS 15.0, *) {
                ListPickerItem(key: {
                    Text("Frameworks")
                }, value: {
                    let str = Array(selections).compactMap { uuid in
                        if let framework = ListPickerItemDataModel.getFramwork(with: uuid) {
                            return framework.name
                        }
                        return nil
                    }.joined(separator: ", ")
                    Text(str)
                }, configuration: ListPickerItemConfiguration(model, id: \.id, children: \.children, selection: $selections, searchFilter: { framework, searchText in
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
                ListPickerItem(key: {
                    Text("Frameworks")
                }, value: {
                    let str = Array(selections).compactMap { uuid in
                        if let framework = ListPickerItemDataModel.getFramwork(with: uuid) {
                            return framework.name
                        }
                        
                        return nil
                    }.joined(separator: ", ")
                    Text(str)
                }, configuration: ListPickerItemConfiguration(self.model, id: \.id, children: \.children, selection: self.$selections, rowContent: { framework in
                    Text(framework.name)
                }))
            }
        }
    }
}

struct ListPickerItemWithObjectItemExample: View {
    private let model = ListPickerItemDataModel.data
    
    @State var selections: Set<String> = []
    
    var body: some View {
        List {
            ListPickerItem(key: {
                Text("Frameworks")
            }, value: {
                let str = Array(selections).joined(separator: ", ")
                Text(str)
            }, configuration: ListPickerItemConfiguration(self.model, id: \.name, children: \.children, selection: self.$selections, rowContent: { framework in
                
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

public struct ListPickerItemWithStringExample: View {
    private let model = ["First", "Second", "Third", "Fourth", "Fifth"]
    
    @State var selections: Set<String> = []
    
    public init() {}

    public var body: some View {
        List {
            ListPickerItem(key: {
                Text("Choice")
            }, value: {
                let str = Array(selections).joined(separator: ", ")
                Text(str)
            }, configuration:
            ListPickerItemConfiguration(self.model, selection: self.$selections))
        }
        .navigationBarTitle(Text("Form"))
    }
}

struct ListPickerItemPreview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListPickerItemDataNonIdentifiableExample()
        }
        
        NavigationView {
            ListPickerItemDataIdentifiableExample()
        }
        
        NavigationView {
            ListPickerItemFormExample()
        }
        
        NavigationView {
            ListPickerItemWithObjectItemExample()
        }
        
        NavigationView {
            ListPickerItemWithStringExample()
        }
        
        NavigationView {
            ListPickerItemWithSearchExample()
        }
    }
}
