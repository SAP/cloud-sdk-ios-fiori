import FioriSwiftUICore
import Foundation
import SwiftUI

private enum ListPickerItemDataModel {
    struct Framework {
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
}

// MARK: List picker item examples

struct ListPickerItemExample: View {
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
            ListPickerItemConfiguration(model, id: \.name, children: \.children, selection: $selections, rowContent: { framework in
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
            }, configuration: ListPickerItemConfiguration(model, id: \.name, children: \.children, selection: $selections, rowContent: { framework in
                Text(framework.name)
            }))
        }
        .navigationBarTitle(Text("Form"))
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
            }, configuration: ListPickerItemConfiguration(model, id: \.name, children: \.children, selection: $selections, rowContent: { framework in
                
                ObjectItem {
                    Text(framework.name)
                } descriptionText: {
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
            ListPickerItemConfiguration(model, selection: $selections))
        }
        .navigationBarTitle(Text("Form"))
    }
}

struct ListPickerItemPreview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListPickerItemExample()
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
    }
}
