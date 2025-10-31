import FioriSwiftUICore
import FioriThemeManager
import SwiftUI

struct HierarchyViewExample: View {
    var body: some View {
        List {
            NavigationLink {
                HierarchyViewDemo()
            } label: {
                Text("Hierarchy View")
            }
            
            NavigationLink {
                HierarchyItemViewDemo()
            } label: {
                Text("Hierarchy Item View")
            }
        }
    }
}

struct HierarchyViewDemo: View {
    @State var showSettings = false
    
    @State var isEditing = true
    @State var isMultiline = true
    @State var showsDetailImage = false
    @State var status = HierarchyItemStatusMode.icon
    @State var selectionMode = HierarchyItemSelectionMode.single
    @State var accessoryType = AccessoryType.disclosure
    
    @State var activeChildItem: String?
    @State var selectedItems: [String]? = []
    
    let dataSource = HierarchyDataSource()
    
    var body: some View {
        HierarchyView(
            dataSource: self.dataSource,
            hierarchyItem: { id in
                if let object = dataSource.model.getObject(for: id) {
                    AnyView(HierarchyItemView(
                        title: { Text(object.uuid) },
                        subtitle: (object.type != nil) ? { Text(object.type ?? "") } : { EmptyView() },
                        footnote: (object.location != nil) ? { Text(object.location ?? "") } : { EmptyView() },
                        detailImage: self.showsDetailImage ? { FioriIcon.message.messageInformation.resizable().foregroundStyle(Color.preferredColor(.tintColor)) } : { EmptyView() },
                        status: self.status == .icon ? { Image(systemName: "exclamationmark.square.fill").foregroundStyle(Color.preferredColor(.negativeLabel)) } : (self.status == .text ? { Text("High") } : { EmptyView() }),
                        accessoryType: self.accessoryType,
                        hierarchyIndicator: {
                            let childrenCount = self.dataSource.numberOfChildren(for: id)
                            HierarchyIndicator(
                                title: AttributedString(String(childrenCount)),
                                isMultiline: self.isMultiline,
                                isSelected: self.activeChildItem == id,
                                isClickable: childrenCount > 0
                            ) {
                                id
                            }
                        }
                    )
                    )
                } else {
                    EmptyView()
                }
            },
            activeChildItem: self.$activeChildItem,
            selectedItems: self.$selectedItems
        )
        .onChange(of: self.selectedItems ?? []) { _, newValue in
            if self.selectionMode == .single {
                print("selected item: \(newValue[0])")
            } else if self.selectionMode == .multiple {
                print("selected items: \(newValue.joined(separator: ", "))")
            }
        }
        .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
        .environment(\.hierarchyItemSelectionMode, self.selectionMode)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    self.showSettings.toggle()
                }) {
                    Image(systemName: "gear.circle")
                }
            }
        }
        .sheet(isPresented: self.$showSettings) {
            HierarchyViewSettingsView(
                isEditing: self.$isEditing,
                isMultiline: self.$isMultiline,
                showDetailImage: self.$showsDetailImage,
                selectionMode: self.$selectionMode,
                status: self.$status,
                accessoryType: self.$accessoryType
            )
            .presentationDetents([.fraction(0.5), .large])
            .presentationDragIndicator(.visible)
        }
    }
}

struct HierarchyDataSource: HierarchyViewDataSource {
    var model = HierarchyViewModel()
    
    func rootID() -> String {
        if let root = model.rootObject {
            return root.uuid
        }
        
        let root = self.model.fetchRoot()
        return root.uuid
    }
    
    func numberOfChildren(for id: String) -> Int {
        guard let object = model.getObject(for: id) else {
            preconditionFailure("Object with String: \(id) does not exsit in model")
        }
        
        if let children = object.children {
            return children.count
        }
        
        let children = object.fetchChildren()
        self.model.updateCache(objects: children)
        return children.count
    }
    
    func childID(idForChildItemAt index: Int, with parentID: String) -> String {
        guard let parent = model.getObject(for: parentID) else {
            preconditionFailure("Parent object with String: \(parentID) does not exsit in model")
        }
        
        guard let children = parent.children else {
            preconditionFailure("Children for object(\(parentID)) is not loaded yet")
        }
        
        return children[index].uuid
    }
    
    func parentID(for id: String) -> String? {
        guard let object = model.getObject(for: id) else {
            preconditionFailure("Object with String: \(id) does not exsit in model")
        }
        
        if let parent = object.parent {
            self.model.updateCache(objects: [parent])
            return parent.uuid
        }
        
        guard let parent = object.fetchParent() else {
            return nil
        }
        
        self.model.updateCache(objects: [parent])
        return parent.uuid
    }

    func itemTitle(for id: String) -> String? {
        self.model.getObject(for: id)?.name
    }
}

class HierarchyViewModel {
    // Cache all business objects
    var businessObjects: [String: BussinessObject] = [:]
    
    // Entry point of hierarchy
    var rootObject: BussinessObject?
    
    // Return the root object, create one if it has not been created yet.
    func fetchRoot() -> BussinessObject {
        if let root = rootObject {
            return root
        }
        
        let object = BussinessObject()
        object.name = object.uuid
        object.type = "Purification Station"
        object.location = "1000 - Hamburg Mechanic"
        
        self.rootObject = object
        self.updateCache(objects: [object])
        return object
    }
    
    func asyncFetchRoot(completion: @escaping (BussinessObject) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            let root = self.fetchRoot()
            completion(root)
        }
    }
    
    func getObject(for uuid: String) -> BussinessObject? {
        self.businessObjects[uuid]
    }
    
    func updateCache(objects: [BussinessObject]) {
        for object in objects {
            self.businessObjects.updateValue(object, forKey: object.uuid)
        }
    }
}

class BussinessObject {
    var name: String?
    var type: String?
    var location: String?
    var uuid = UUID().uuidString
    var parent: BussinessObject?
    var children: [BussinessObject]?
    
    var numberOfChildren: Int = .random(in: 0 ... 100)
    
    // Return children objects.
    func fetchChildren() -> [BussinessObject] {
        if let children = self.children {
            return children
        }
        
        var children: [BussinessObject] = []
        for _ in 0 ..< self.numberOfChildren {
            let object = BussinessObject()
            object.parent = self
            object.name = object.uuid
            object.type = "Purification Station"
            object.location = "1000 - Hamburg Mechanic"
            children.append(object)
        }
        self.children = children
        return children
    }
    
    func asyncFetchChildren(completion: @escaping ([BussinessObject]) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            if let _ = self.children {
                return
            }
            
            let children = self.fetchChildren()
            completion(children)
        }
    }
    
    // Return parent object. Each object can have only one parent.
    func fetchParent() -> BussinessObject? {
        if let parent = self.parent {
            return parent
        }
        
        let parent = BussinessObject()
        parent.name = parent.uuid
        parent.type = "Purification Station"
        parent.location = "1000 - Hamburg Mechanic"
        parent.children = [self]
        self.parent = parent
        return parent
    }
    
    func asyncFetchParent(completion: @escaping (BussinessObject?) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            if let _ = self.parent {
                return
            }
            
            let parent = self.fetchParent()
            completion(parent)
        }
    }
    
    // Get rest of children objects which have not been loaded yet.
    func fetchSiblingsOfChild() -> [BussinessObject] {
        guard let children = self.children, case let numberOfSiblings = numberOfChildren - children.count, numberOfSiblings > 0 else {
            return []
        }
        
        var siblings: [BussinessObject] = []
        for _ in 0 ..< numberOfSiblings {
            let object = BussinessObject()
            object.parent = self
            object.name = object.uuid
            object.type = "Purification Station"
            object.location = "1000 - Hamburg Mechanic"
            siblings.append(object)
        }
        
        self.children?.append(contentsOf: siblings)
        return siblings
    }
    
    func asyncFetchSiblingsOfChild(completion: @escaping ([BussinessObject]) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
            let siblings = self.fetchSiblingsOfChild()
            completion(siblings)
        }
    }
    
    func insertChildren() -> [BussinessObject]? {
        var children: [BussinessObject] = []
        for _ in 0 ..< 2 {
            let object = BussinessObject()
            object.parent = self
            object.name = object.uuid
            object.type = "Purification Station"
            object.location = "1000 - Hamburg Mechanic"
            children.append(object)
        }
        self.children?.append(contentsOf: children)
        self.numberOfChildren += children.count
        return children.isEmpty ? nil : children
    }
}

enum HierarchyItemStatusMode {
    case none
    case icon
    case text
}

struct HierarchyViewSettingsView: View {
    @Binding var isEditing: Bool
    @Binding var isMultiline: Bool
    @Binding var showDetailImage: Bool
    @Binding var selectionMode: HierarchyItemSelectionMode
    @Binding var status: HierarchyItemStatusMode
    @Binding var accessoryType: AccessoryType
    
    var body: some View {
        List {
            Toggle(isOn: self.$isEditing, label: { Text("Edit") })
            
            Picker("Selection Mode", selection: self.$selectionMode) {
                Text("None").tag(HierarchyItemSelectionMode.none)
                Text("Single").tag(HierarchyItemSelectionMode.single)
                Text("Multiple").tag(HierarchyItemSelectionMode.multiple)
            }.disabled(!self.isEditing)
            
            Toggle(isOn: self.$isMultiline, label: { Text("Multiline Indicator") })
            
            Picker("Status", selection: self.$status) {
                Text("None").tag(HierarchyItemStatusMode.none)
                Text("Icon").tag(HierarchyItemStatusMode.icon)
                Text("Text").tag(HierarchyItemStatusMode.text)
            }
            
            Picker("Accessory Icon", selection: self.$accessoryType) {
                Text("None").tag(AccessoryType.none)
                Text("Disclosure").tag(AccessoryType.disclosure)
                Text("Checkmark").tag(AccessoryType.checkmark)
                Text("Detail").tag(AccessoryType.detail)
            }
            
            Toggle(isOn: self.$showDetailImage, label: { Text("Show Detail Image") })
        }
    }
}
