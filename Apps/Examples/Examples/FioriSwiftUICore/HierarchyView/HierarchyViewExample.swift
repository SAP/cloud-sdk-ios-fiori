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
                HierarchyViewDemo(isAsync: true)
            } label: {
                Text("Hierarchy View(Async)")
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
    @State var isAsync: Bool = false
    
    var dataSource = HierarchyDataSource()
    
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
                        status: self.status == .icon ? { Image(systemName: "exclamationmark.square.fill").foregroundStyle(Color.preferredColor(.negativeLabel)).accessibilityLabel("Warning") } : (self.status == .text ? { Text("High") } : { EmptyView() }),
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
                            .id(id)
                        }
                    ).copyDetailsOnLongPress(title: object.uuid, subtitle: object.type, footnote: object.location)
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
        .onDisappear(perform: {
            self.dataSource.refresh()
        })
        .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
        .environment(\.hierarchyItemSelectionMode, self.selectionMode)
        .environment(\.hierarchyViewIsAsync, self.isAsync)
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

// MARK: - DataSource

@MainActor
final class HierarchyDataSource: @MainActor HierarchyViewDataSource, ObservableObject {
    @Published var model = HierarchyViewModel()
    
    func rootID() -> String {
        if let root = model.rootObject {
            return root.uuid
        }
        
        return self.model.fetchRoot().uuid
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
    
    func refresh() {
        self.model = HierarchyViewModel()
    }
    
    func rootIDAsync() async throws -> String {
        let maybeRoot = await MainActor.run { () -> BusinessObject? in
            self.model.rootObject
        }
        if let root = maybeRoot { return root.uuid }

        let fetchedRoot = try await model.asyncFetchRoot()
        await MainActor.run {
            self.model.rootObject = fetchedRoot
            self.model.updateCache(objects: [fetchedRoot])
        }
        return fetchedRoot.uuid
    }

    func numberOfChildrenAsync(for id: String) async throws -> Int {
        guard let _ = model.getObject(for: id) else {
            preconditionFailure("Object with String: \(id) does not exist in model")
        }

        if let objectChildren = model.getObject(for: id)?.children {
            return objectChildren.count
        }

        let children = try await model.asyncFetchChildren(for: id)
        return children.count
    }
    
    func parentIDAsync(for id: String) async throws -> String? {
        guard let _ = model.getObject(for: id) else {
            preconditionFailure("Object with String: \(id) does not exist in model")
        }

        if let parent = model.getObject(for: id)?.parent {
            self.model.updateCache(objects: [parent])
            return parent.uuid
        }

        let maybeParent = try await model.asyncFetchParent(for: id)
        if let p = maybeParent {
            return p.uuid
        } else {
            return nil
        }
    }
    
    func itemTitleAsync(for id: String) async throws -> String? {
        self.model.getObject(for: id)?.name
    }
}

@MainActor
class HierarchyViewModel {
    // Cache all business objects
    var businessObjects: [String: BusinessObject] = [:]
    
    // Entry point of hierarchy
    var rootObject: BusinessObject?
    
    // Return the root object, create one if it has not been created yet.
    func fetchRoot() -> BusinessObject {
        if let root = rootObject {
            return root
        }
        
        let object = BusinessObject()
        object.name = object.uuid
        object.type = "Purification Station"
        object.location = "1000 - Hamburg Mechanic"
        
        self.rootObject = object
        self.updateCache(objects: [object])
        return object
    }
    
    func asyncFetchRoot() async throws -> BusinessObject {
        print("asyncFetchRoot: sleep start")
        try await Task.sleep(nanoseconds: 2000000000) // 5 seconds for testing
        print("asyncFetchRoot: sleep end")
        // fetchRoot is MainActor-isolated; call it on the main actor
        return await MainActor.run { self.fetchRoot() }
    }
    
    func asyncFetchChildren(for id: String) async throws -> [BusinessObject] {
        print("asyncFetchChildren: sleep start")
        try await Task.sleep(nanoseconds: 1000000000) // 5 seconds for testing
        print("asyncFetchChildren: sleep end")
        guard let parent = getObject(for: id) else {
            preconditionFailure("Object with String: \(id) does not exist in model")
        }

        if let children = parent.children {
            return children
        }

        // Read lightweight info while on MainActor
        let count = parent.numberOfChildren

        // Create child objects off the main actor to avoid blocking UI.
        let createdChildren = await Task.detached { () -> [BusinessObject] in
            var arr: [BusinessObject] = []
            for _ in 0 ..< count {
                let child = BusinessObject.newObject()
                arr.append(child)
            }
            return arr
        }.value

        // Attach children and update cache on the MainActor
        await MainActor.run {
            for c in createdChildren {
                c.parent = parent
            }
            parent.children = createdChildren
            self.updateCache(objects: createdChildren + [parent])
        }

        return createdChildren
    }
    
    func asyncFetchParent(for id: String) async throws -> BusinessObject? {
        print("asyncFetchParent: sleep start")
        try await Task.sleep(nanoseconds: 1000000000) // 5 seconds for testing
        print("asyncFetchParent: sleep end")
        guard let object = getObject(for: id) else {
            preconditionFailure("Object with String: \(id) does not exist in model")
        }

        if let parent = object.parent {
            // ensure cache contains the parent
            self.updateCache(objects: [parent])
            return parent
        }

        // Create parent off the MainActor
        let createdParent = await Task.detached { () -> BusinessObject in
            BusinessObject.newObject()
        }.value

        // Attach parent and update cache on MainActor
        await MainActor.run {
            createdParent.children = [object]
            object.parent = createdParent
            self.updateCache(objects: [createdParent, object])
        }

        return createdParent
    }
    
    func getObject(for uuid: String) -> BusinessObject? {
        self.businessObjects[uuid]
    }
    
    func updateCache(objects: [BusinessObject]) {
        for object in objects {
            self.businessObjects.updateValue(object, forKey: object.uuid)
        }
    }
}

// MARK: - Data Model

class BusinessObject {
    var name: String?
    var type: String?
    var location: String?
    var uuid = UUID().uuidString
    var parent: BusinessObject?
    var children: [BusinessObject]?
    
    var numberOfChildren: Int = .random(in: 0 ... 100)
    
    // Return children objects.
    func fetchChildren() -> [BusinessObject] {
        if let children = self.children {
            return children
        }
        
        var children: [BusinessObject] = []
        for _ in 0 ..< self.numberOfChildren {
            let object = BusinessObject.newObject()
            object.parent = self
            children.append(object)
        }
        self.children = children
        return children
    }
    
    // Return parent object. Each object can have only one parent.
    func fetchParent() -> BusinessObject? {
        if let parent = self.parent {
            return parent
        }
        
        let parent = BusinessObject.newObject()
        parent.children = [self]
        self.parent = parent
        return parent
    }
    
    static func newObject() -> BusinessObject {
        let object = BusinessObject()
        object.name = object.uuid
        object.type = "Purification Station"
        object.location = "1000 - Hamburg Mechanic"
        return object
    }
}

enum HierarchyItemStatusMode {
    case none
    case icon
    case text
}

// MARK: - Setting View

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
