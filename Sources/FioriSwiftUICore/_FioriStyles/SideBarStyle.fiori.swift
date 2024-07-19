import FioriThemeManager
import Foundation
import SwiftUI

//
/**
 This file provides default fiori style for the component.
 
 1. Uncomment fhe following code.
 2. Implement layout and style in corresponding places.
 3. Delete `.generated` from file name.
 4. Move this file to `_FioriStyles` folder under `FioriSwiftUICore`.
 */

// Base Layout style
public struct SideBarBaseStyle: SideBarStyle {
    @Environment(\.editMode) private var editMode
    @EnvironmentObject private var modelObject: SideBarModelObject
    @State private var collapsedSections: [UUID] = [] // To keep the collasped section ID
    
    public func makeBody(_ configuration: SideBarConfiguration) -> some View {
        Group {
            if !configuration.isUsedInSplitView {
                VStack(spacing: 0, content: {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        LazyVStack(spacing: 0) {
                            self.buildSideBarList(configuration)
                        }
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    })
                    
                    configuration.footer.typeErased
                })
                .background(Color.preferredColor(.secondaryBackground))
                .environment(\.editMode, .constant(configuration.isEditing ? EditMode.active : EditMode.inactive))
            } else {
                let onEditButtonClicked = {
                    configuration.isEditing.toggle()
                    if !configuration.isEditing {
                        // to conver the flat list data(for drag&drop supporting) to tree structed list data.
                        configuration.data.removeAll()
                        configuration.data.append(contentsOf: self.modelObject.refreshItems())
                    }
                }
    
                let destinationCallback: (SideBarItemModel, SideBarConfiguration) -> any View = { item, configuration in
                    if configuration.isUsedInSplitView {
                        // With NavigationLink and navigationDestination modifier under NavigationStack/NavigationSplitView, need to set selected item here
                        DispatchQueue.main.async {
                            configuration.selection = item
                        }
                    }
                    return configuration.destination(item)
                }
    
                NavigationStack {
                    ScrollView(.vertical, showsIndicators: false, content: {
                        LazyVStack(spacing: 0) {
                            self.buildSideBarList(configuration)
                        }
                        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                    })
    
                    configuration.footer.typeErased
                }
                .background(Color.preferredColor(.secondaryBackground))
                .navigationDestination(for: SideBarItemModel.self) { item in
                    destinationCallback(item, configuration).typeErased
                }
                .navigationTitle(String(configuration.title?.characters ?? AttributedString("").characters))
                .navigationBarTitleDisplayMode(.large)
                .environment(\.editMode, .constant(configuration.isEditing ? EditMode.active : EditMode.inactive))
                .navigationBarItems(trailing: configuration.editButton
                    .simultaneousGesture(TapGesture().onEnded {
                        onEditButtonClicked()
                    })
                    .accessibilityAction {
                        onEditButtonClicked()
                    }
                )
            }
        }
    }
    
    func buildSideBarList(_ configuration: SideBarConfiguration) -> some View {
        ForEach(Array(self.modelObject.filterItems().enumerated()), id: \.element.id) { _, item in
            if item.isSection { // Section header
                let onDisclosureGroupToggled = {
                    // handle the section expand/collapse
                    if !self.collapsedSections.contains(where: { $0 == item.id }) {
                        self.collapsedSections.append(item.id)
                    } else {
                        self.collapsedSections.removeAll(where: { $0 == item.id })
                    }
                }
                DisclosureGroup(item.title,
                                isExpanded: Binding<Bool>(
                                    get: { !self.collapsedSections.contains(where: { $0 == item.id }) },
                                    set: { isExpanded in
                                        if isExpanded { self.collapsedSections.removeAll(where: { $0 == item.id }) } else { self.collapsedSections.append(item.id) }
                                    }
                                )) {
                    if let sectionItems = self.modelObject.fetchChildrenItems(item) { // Get all children item of the section
                        ForEach(sectionItems) { childrenItem in
                            self.buildSideBarItem(configuration, childrenItem)
                        }
                    }
                }
                .disclosureGroupStyle(SideBarListSectionDisclosureStyle(onDisclosureGroupToggled: onDisclosureGroupToggled))
                .onTapGesture {
                    onDisclosureGroupToggled()
                }
                .onDrop(of: [.text], delegate: SideBarDropDelegate(toItem: item, modelObject: self.modelObject)) // The section header can't be dragged but it was allow to put a item under it. E,g, Drag a item to empty section
            } else if !self.modelObject.isChildrenItem(item) { // The item is not section header and its children
                self.buildSideBarItem(configuration, item)
            }
        }
    }
    
    /**
     * Build the row item for side bar item. The isFlatList and parentIndex parameter was used for non-flat list source during drag and drop for method buildNestedSideBarList
     */
    func buildSideBarItem(_ configuration: SideBarConfiguration, _ item: SideBarItemModel) -> some View {
        Group {
            if let index = self.modelObject.flatListItems.firstIndex(of: item) {
                let bindableItem = Binding<SideBarItemModel>(get: {
                    self.modelObject.flatListItems[index]
                }, set: { newItem in
                    self.modelObject.flatListItems[index] = newItem
                })
                
                if !item.isInvisible, !configuration.isEditing { // For view mode
                    if configuration.isUsedInSplitView {
                        // In NavigationSplieView, the 'select' standard accessibility action can trigger the navigationDestination modifer for the NavigationLink when enter key pressed or double-tapping with VoiceOver.
                        // However, the custom accessibility action can't execute in the standard accessibility action here. Also, the 'select' standard accessibility action can not let NavigationLink work if add a nother customer accessibility action here. So, we just use 'select' standard accessibility action to tigger navigationDestination modifer and set the selected item in navigationDestination callback.
                        NavigationLink(value: item) {
                            configuration.item(bindableItem).typeErased
                        }.accessibilityAction(named: "Select") {}
                    } else {
                        // in case the navigationDestination modifer of the NavigationLink can't work, to set the selection item when the NavigationLink was clicked or enter key pressed or double-tapping with VoiceOver
                        configuration.item(bindableItem).typeErased
                            .simultaneousGesture(TapGesture().onEnded {
                                configuration.selection = item
                            })
                            .accessibilityAction {
                                configuration.selection = item
                            }
                    }
                } else if configuration.isEditing { // For edit-mode
                    configuration.item(bindableItem).typeErased
                        .simultaneousGesture(TapGesture().onEnded {}) // To capture the Tap Gesture on the Item Row in Edit mode and to do nothing to avoid the Tap Gesture was captured by section expending logic
                        .background(Color.white)
                        .overlay(
                            DraggingItemCornerShape(radius: 8)
                                .stroke(Color("light-gray"), lineWidth: 4)
                        )
                        .clipShape(DraggingItemCornerShape(radius: 8))
                        .contentShape([.dragPreview], DraggingItemCornerShape(radius: 8))
                        .overlay(self.modelObject.draggingItem == item && self.modelObject.isDragging ? .white : .clear)
                        .onDrag {
                            self.modelObject.draggingItem = item
                            return NSItemProvider(object: NSString(string: item.id.uuidString))
                        }
                        .onDrop(of: [.text], delegate: SideBarDropDelegate(toItem: item, modelObject: self.modelObject))
                        .accessibilityAction {
                            if configuration.isEditing {
                                bindableItem.wrappedValue.isInvisible.toggle()
                            }
                        }
                }
            } else {
                EmptyView()
            }
        }
    }
}

extension SideBarFioriStyle {
    struct ContentFioriStyle: SideBarStyle {
        func makeBody(_ configuration: SideBarConfiguration) -> some View {
            SideBar(configuration)
                .environmentObject(SideBarModelObject(items: configuration.data, queryString: configuration.queryString ?? "", configuration: configuration))
        }
    }
}

/**
 The `SideBarItemModel` struct is a data model that represents a side bar item . It conforms to the `Identifiable`, `Hashable`, and `Equatable` protocols, which allow it to be used in collections and compared for equality.
 */
public struct SideBarItemModel: Identifiable, Hashable, Equatable {
    /// A unique identifier for each `SideBarItemModel` instance, generated using `UUID()`
    public var id = UUID()
    /// A `String` representing the title of the side bar item
    public var title: String
    /// An optional `Image` that represents the icon of the side bar item.
    public var icon: Image?
    /// An optional `Image` that represents a icon of the side bar item when it was selected.
    public var filledIcon: Image?
    /// An optional `String` representing the subtitle of the side bar item.
    public var subtitle: String?
    /// An optional `Image` that represents an accessory icon for the side bar item.
    public var accessoryIcon: Image?
    /// A `Bool` indicating whether the side bar item is invisible when the SideBar was in view mode. It is set to `false` by default.
    public var isInvisible: Bool = false
    /// An optional array of `SideBarItemModel` instances representing the children items of the side bar item.
    public var children: [SideBarItemModel]? = nil {
        didSet {
            self.isSection = self.children != nil
        }
    }

    /// A `Bool` indicating whether the side bar item is a section or not. It is set to `false` by default and will set to true if children is not empty when initializing
    public var isSection: Bool = false
    
    /// Public initializer for SideBarItemModel.
    /// - Parameters:
    ///   - title: A `String` representing the title of the side bar item
    ///   - icon: An optional `Image` that represents the icon of the side bar item.
    ///   - filledIcon: An optional `Image` that represents a icon of the side bar item when it was selected.
    ///   - subtitle: An optional `String` representing the subtitle of the side bar item.
    ///   - accessoryIcon: An optional `Image` that represents an accessory icon for the side bar item.
    ///   - children: An optional array of `SideBarItemModel` instances representing the children items of the side bar item.
    ///   - isSection: A `Bool` indicating whether the side bar item is a section or not. It is set to `false` by default and will set to true if children is not empty and don't set it explicitly.
    ///   - isInvisible: A `Bool` indicating whether the side bar item is hidden or not in view mode. It is set to `false` by default.
    public init(title: String, icon: Image? = nil, filledIcon: Image? = nil, subtitle: String? = nil, accessoryIcon: Image? = nil, children: [SideBarItemModel]? = nil, isSection: Bool = false, isInvisible: Bool = false) {
        self.title = title
        self.icon = icon
        self.filledIcon = filledIcon
        self.subtitle = subtitle
        self.accessoryIcon = accessoryIcon
        self.children = children
        self.children != nil ? (self.isSection = true) : (self.isSection = isSection)
        if self.isSection {
            self.isInvisible = false
        } else {
            self.isInvisible = isInvisible
        }
    }
    
    /// A method that allows the `SideBarItemModel` instances to be used in hash-based collections. It combines the `id` and `title` properties to generate a hash value.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
        hasher.combine(self.title)
    }
    
    /// An equality operator method that compares two `SideBarItemModel` instances based on their `id` property.
    public static func == (lhs: SideBarItemModel, rhs: SideBarItemModel) -> Bool {
        lhs.id == rhs.id
    }
}

class SideBarModelObject: ObservableObject {
    private var itemCount: Int = 0
    
    // The tree list structure don't support drag&drop, so, to use the variable to keep the flat list data
    @Published var flatListItems: [SideBarItemModel] = [] {
        didSet {
            if let onChanged = configuration.onDataChange {
                if self.configuration.isEditing, self.flatListItems.count == self.itemCount { // Only fire the data change event when the data items were changed in edit model after they were initilized
                    onChanged(self.inflateItemModels(flatItemModels: self.flatListItems))
                }
            }
        }
    }
    
    @Published var selection: SideBarItemModel?
    
    @Published var queryString: String
    
    @Published var isDragging = false
    var draggingItem: SideBarItemModel?
    
    var configuration: SideBarConfiguration
    
    public init(items: [SideBarItemModel], queryString: String, configuration: SideBarConfiguration) {
        self.queryString = queryString
        self.configuration = configuration
        // To parse the consumer's tree list structure data and put them in a flat list for drag&drop reordering
        // E,g, Convert  items = [A, B, C[a,b,c], D] to flatListItems = [A,B,D,C,a,b,c]
        var sections: [SideBarItemModel] = []
        for item in items {
            if item.isSection {
                sections.append(item) // Put the item to the flat list directly if it has no children
            } else {
                self.flatListItems.append(item) // Keep the section header item for later using
                self.itemCount += 1
            }
        }
        for section in sections { // Loop the possibile sections and add it and its children to the flat list
            self.flatListItems.append(section)
            self.itemCount += 1
            if let children = section.children, !children.isEmpty {
                self.flatListItems.append(contentsOf: children)
                self.itemCount += children.count
            }
        }
        self.selection = configuration.selection
    }
    
    public func refreshItems() -> [SideBarItemModel] {
        self.inflateItemModels(flatItemModels: self.flatListItems)
    }
    
    // swiftlint:disable cyclomatic_complexity
    private func inflateItemModels(flatItemModels: [SideBarItemModel]) -> [SideBarItemModel] {
        var targetItemModels: [SideBarItemModel] = []
        var processingSection: SideBarItemModel? = nil
        var children: [SideBarItemModel] = []
        var sourceFlatItemModels = flatItemModels // The flatItemModels has values like:[item1, item2, Section1, item1-1. item1-2, Section2, item2-1, item2-2]
        
        for item in sourceFlatItemModels {
            if !item.isSection, processingSection == nil { // the item is not in any gourp if it is not setion and there is no processing section.
                targetItemModels.append(item)
            } else if item.isSection { // current item is section
                if let process = processingSection {
                    if let index = sourceFlatItemModels.firstIndex(of: process) { // Find the section and append its children
                        if !children.isEmpty {
                            sourceFlatItemModels[index].children = children
                            children.removeAll()
                        } else {
                            sourceFlatItemModels[index].children?.removeAll()
                        }
                        
                        targetItemModels.append(sourceFlatItemModels[index])
                    }
                }
                
                processingSection = item // Means to handle the section now
                if let index = sourceFlatItemModels.firstIndex(of: item), index == sourceFlatItemModels.count - 1 { // handle the case that the section no child and is the latest node in the flat list.
                    sourceFlatItemModels[index].children?.removeAll()
                    targetItemModels.append(sourceFlatItemModels[index])
                }
            } else { // Handle the item was a child
                children.append(item)
                if let index = sourceFlatItemModels.firstIndex(of: item), index == sourceFlatItemModels.count - 1 { // when the item was latest one in the flat list
                    if let process = processingSection {
                        if let secIndex = sourceFlatItemModels.firstIndex(of: process) {
                            if !children.isEmpty {
                                sourceFlatItemModels[secIndex].children = children
                                children.removeAll()
                            } else {
                                sourceFlatItemModels[index].children?.removeAll()
                            }
                            
                            targetItemModels.append(sourceFlatItemModels[secIndex])
                        }
                    }
                }
            }
        }
        return targetItemModels
    }
    
    func filterItems() -> [SideBarItemModel] {
        if self.queryString.isEmpty {
            return self.flatListItems
        } else {
            return self.flatListItems.filter { item in item.isSection || item.title.localizedCaseInsensitiveContains(self.queryString) }
        }
    }
    
    /**
     * Fetch all children items of the given section header item from the flat list
     */
    func fetchChildrenItems(_ section: SideBarItemModel) -> [SideBarItemModel]? {
        if let sectionIndex = self.filterItems().firstIndex(of: section) {
            var items: [SideBarItemModel] = []
            if (sectionIndex + 1) <= self.filterItems().count - 1 {
                for index in sectionIndex + 1 ... self.filterItems().count - 1 { // Loop all items after the section until find another section
                    let item = self.filterItems()[index]
                    if !item.isSection { // The item belongs to the current section if it has no any child, otherwise, it is another section header item
                        items.append(item)
                    } else {
                        break
                    }
                }
            }
            
            if items.isEmpty {
                return nil
            } else {
                return items
            }
        }
        return nil
    }
    
    /**
     * Check if the given item is a child of section header in flat list
     */
    func isChildrenItem(_ item: SideBarItemModel) -> Bool {
        if let index = self.filterItems().firstIndex(of: item) {
            if index > 0 {
                for n in 0 ... index - 1 { // Loop all items before the item until find section
                    if self.filterItems()[n].isSection {
                        return true
                    }
                }
            }
        }
        return false
    }
}

private struct SideBarListSectionDisclosureStyle: DisclosureGroupStyle {
    @Environment(\.sizeCategory) private var sizeCategory
    @ScaledMetric var scale: CGFloat = 1
    var onDisclosureGroupToggled: () -> Void
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 0) {
            HStack {
                configuration.label
                    .font(.fiori(forTextStyle: .title3))
                    .foregroundColor(.preferredColor(.primaryLabel))
                Spacer()
                Image(systemName: configuration.isExpanded ? "chevron.down" : "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 14 * self.scale, height: 14 * self.scale)
                    .font(.fiori(fixedSize: 17, weight: .semibold))
                    .foregroundColor(.preferredColor(.tintColor))
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 11, trailing: 0))
            
            if !configuration.isExpanded {
                Rectangle()
                    .fill(Color.preferredColor(.separator))
                    .frame(height: 0.5)
            }
        }
        .frame(width: self.sizeCategory.isAccessibilityCategory ? nil : (UIDevice.current.userInterfaceIdiom != .pad ? nil : 288), height: self.sizeCategory.isAccessibilityCategory ? nil : 44)
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(.isButton)
        .accessibilityAction {
            self.onDisclosureGroupToggled()
        }
        
        if configuration.isExpanded {
            configuration.content
                .padding(.leading, 0)
                .disclosureGroupStyle(self)
        }
    }
}

private struct SideBarDropDelegate: DropDelegate {
    let toItem: SideBarItemModel
    var modelObject: SideBarModelObject
    
    /// Drop finished work
    func performDrop(info: DropInfo) -> Bool {
        self.modelObject.draggingItem = nil
        self.modelObject.isDragging = false
        return true
    }
    
    /// Moving style without "+" icon
    func dropUpdated(info: DropInfo) -> DropProposal? {
        DropProposal(operation: .move)
    }
    
    /// Object is dragged off of the onDrop view.
    func dropExited(info: DropInfo) {
        self.modelObject.isDragging = false
    }
    
    /// Object is dragged over the onDrop view.
    func dropEntered(info: DropInfo) {
        self.modelObject.isDragging = true
        
        guard let dragItem = modelObject.draggingItem, dragItem != toItem else { return }
        
        guard let fromIndex = modelObject.flatListItems.firstIndex(of: dragItem),
              let toIndex = modelObject.flatListItems.firstIndex(of: toItem) else { return }
        withAnimation {
            self.modelObject.flatListItems.move(fromOffsets: IndexSet(integer: fromIndex), toOffset: toIndex > fromIndex ? toIndex + 1 : toIndex)
        }
    }
}

private struct DraggingItemCornerShape: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
