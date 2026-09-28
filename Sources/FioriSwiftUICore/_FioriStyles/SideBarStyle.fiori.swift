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
    @Environment(\.sidebarLeadingPadding) private var leadingPadding
    @Environment(\.sidebarTrailingPadding) private var trailingPadding
    @Environment(\.sidebarWidth) private var sidebarWidth
    @Environment(\.isSidebarAutoWidth) private var isAutoWidth
    @EnvironmentObject private var modelObject: SideBarModelObject
    @State private var collapsedSections: [UUID] = [] // To keep the collapsed section ID
    
    public func makeBody(_ configuration: SideBarConfiguration) -> some View {
        Group {
            if !configuration.isUsedInSplitView {
                GeometryReader { geometry in
                    VStack(spacing: 0, content: {
                        self.buildSideBarList(configuration)
                            .padding(EdgeInsets(top: 0, leading: self.leadingPadding, bottom: 0, trailing: self.trailingPadding))
                            .background(Color.preferredColor(.secondaryBackground))

                        configuration.footer.typeErased
                    })
                    .frame(width: self.isAutoWidth ? geometry.size.width : self.sidebarWidth)
                }
            } else {
                let onEditButtonClicked = {
                    configuration.isEditing.toggle()
                    if !configuration.isEditing {
                        // to convert the flat list data (for drag & drop support) to tree structured list data.
                        configuration.data.removeAll()
                        configuration.data.append(contentsOf: self.modelObject.refreshItems())
                    }
                }
                
                // with iOS 26 Liquid Glass style, the Sidebar can't display totally on iPad with Portrait mode. It seems like the width of primary is changed in NavigationSplitView.
                GeometryReader { geometry in
                    VStack(spacing: 0, content: {
                        self.buildSideBarList(configuration)
                            .padding(EdgeInsets(top: 0, leading: self.leadingPadding, bottom: 0, trailing: self.trailingPadding))
                            .background(Color.preferredColor(.secondaryBackground))

                        configuration.footer.typeErased
                    })
                    .frame(width: self.isAutoWidth ? geometry.size.width : self.sidebarWidth)
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
    }
    
    func buildSideBarList(_ configuration: SideBarConfiguration) -> some View {
        let visibleItems = self.getVisibleItems()
        return List {
            ForEach(Array(visibleItems.enumerated()), id: \.element.id) { _, item in
                if item.isSection {
                    self.buildSectionHeader(configuration, item)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.preferredColor(.secondaryBackground))
                        .moveDisabled(true)
                } else if self.modelObject.isChildrenItem(item), self.isSectionCollapsed(for: item, in: visibleItems) {
                    EmptyView()
                } else {
                    self.buildSideBarItem(configuration, item)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.preferredColor(.secondaryBackground))
                }
            }
            .onMove { source, destination in
                self.performMove(source: source, destination: destination, in: visibleItems)
            }
        }
        .listStyle(.plain)
        .environment(\.defaultMinListRowHeight, 44)
    }

    private func getVisibleItems() -> [SideBarItemModel] {
        let allItems = self.modelObject.filterItems()
        var result: [SideBarItemModel] = []
        var currentSectionId: UUID? = nil
        
        for item in allItems {
            if item.isSection {
                currentSectionId = item.id
                result.append(item)
            } else {
                let isSectionCollapsed = currentSectionId.map { self.collapsedSections.contains($0) } ?? false
                if !isSectionCollapsed {
                    result.append(item)
                }
            }
        }
        
        return result
    }

    // MARK: - Section header

    func buildSectionHeader(_ configuration: SideBarConfiguration, _ item: SideBarItemModel) -> some View {
        let onDisclosureGroupToggled = {
            if !self.collapsedSections.contains(where: { $0 == item.id }) {
                self.collapsedSections.append(item.id)
            } else {
                self.collapsedSections.removeAll(where: { $0 == item.id })
            }
        }

        return DisclosureGroup(item.title,
                               isExpanded: Binding<Bool>(
                                   get: { !self.collapsedSections.contains(where: { $0 == item.id }) },
                                   set: { isExpanded in
                                       if isExpanded { self.collapsedSections.removeAll(where: { $0 == item.id }) } else { self.collapsedSections.append(item.id) }
                                   }
                               )) {
            EmptyView()
        }
        .disclosureGroupStyle(SideBarListSectionDisclosureStyle(onDisclosureGroupToggled: onDisclosureGroupToggled))
        .contentShape(Rectangle())
        .onTapGesture {
            onDisclosureGroupToggled()
        }
    }

    private func isSectionCollapsed(for item: SideBarItemModel, in visibleItems: [SideBarItemModel]) -> Bool {
        guard let index = visibleItems.firstIndex(of: item) else { return false }
        for n in stride(from: index - 1, through: 0, by: -1) {
            if visibleItems[n].isSection {
                return self.collapsedSections.contains(where: { $0 == visibleItems[n].id })
            }
        }
        return false
    }

    // MARK: - Row item

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
                        Button {
                            withAnimation {
                                configuration.selection = item
                            }
                        } label: {
                            configuration.item(bindableItem).typeErased
                        }
                        .buttonStyle(.plain)
                        .accessibilityAddTraits(.isButton)
                    } else {
                        // For UIkit Sidebar with false for property 'isUsedInSplitView', to set the selection item when the Sidebar item was clicked or enter key pressed or double-tapping with VoiceOver
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
                        .background(Color.preferredColor(.secondaryBackground))
                        .simultaneousGesture(TapGesture().onEnded {})
                        .accessibilityAction {
                            bindableItem.wrappedValue.isInvisible.toggle()
                        }
                }
            } else {
                EmptyView()
            }
        }
    }

    // MARK: - Move mapping

    private func performMove(source: IndexSet, destination: Int, in visibleItems: [SideBarItemModel]) {
        let movedItems: [SideBarItemModel] = source.map { visibleItems[$0] }
        guard !movedItems.isEmpty else { return }

        let anchorItem: SideBarItemModel?
        if destination >= visibleItems.count {
            anchorItem = nil
        } else {
            var idx = destination
            while idx < visibleItems.count, movedItems.contains(visibleItems[idx]) {
                idx += 1
            }
            anchorItem = (idx < visibleItems.count) ? visibleItems[idx] : nil
        }

        withAnimation {
            for m in movedItems {
                if let fi = self.modelObject.flatListItems.firstIndex(of: m) {
                    self.modelObject.flatListItems.remove(at: fi)
                }
            }
            let insertAt: Int
            if let anchor = anchorItem, let ai = self.modelObject.flatListItems.firstIndex(of: anchor) {
                insertAt = ai
            } else {
                insertAt = self.modelObject.flatListItems.count
            }
            self.modelObject.flatListItems.insert(contentsOf: movedItems, at: insertAt)
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
                if self.configuration.isEditing, self.flatListItems.count == self.itemCount { // Only fire the data change event when the data items were changed in edit model after they were initialized
                    onChanged(self.inflateItemModels(flatItemModels: self.flatListItems))
                }
            }
        }
    }
    
    @Published var selection: SideBarItemModel?
    
    @Published var queryString: String
    
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
        for section in sections { // Loop the possible sections and add them and their children to the flat list
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
            if !item.isSection, processingSection == nil { // the item is not in any group if it is not a section and there is no processing section.
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
    @Environment(\.accessibilityReduceTransparency) private var reduceTransparency
    @Environment(\.colorScheme) private var colorScheme
    @ScaledMetric var scale: CGFloat = 1
    var onDisclosureGroupToggled: () -> Void

    func makeBody(configuration: Configuration) -> some View {
        VStack(spacing: 0) {
            HStack {
                configuration.label
                    .font(.fiori(forTextStyle: .title3))
                    .foregroundColor(.preferredColor(.primaryLabel))
                Spacer()
                let chevronColor = self.reduceTransparency && self.colorScheme == .dark
                    ? Color.preferredColor(.tintColor, background: .lightConstant)
                    : Color.preferredColor(.tintColor)
                Image(systemName: configuration.isExpanded ? "chevron.down" : "chevron.right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 14 * self.scale, height: 14 * self.scale)
                    .font(.fiori(fixedSize: 17, weight: .semibold))
                    .foregroundColor(chevronColor)
            }
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 11, trailing: 0))
            
            if !configuration.isExpanded {
                Rectangle()
                    .fill(Color.preferredColor(.separator))
                    .frame(height: 0.5)
            }
        }
        .frame(width: nil, height: self.sizeCategory.isAccessibilityCategory ? nil : 44)
        .accessibilityElement(children: .combine)
        .accessibilityAddTraits(.isButton)
        .accessibilityAction {
            self.onDisclosureGroupToggled()
        }
    }
}

/// Represents whether the sidebar width fills the available space from its parent automatically.
///
/// The `IsSidebarAutoWidth` key governs the automatic sizing of the sidebar. When set to `true`, the sidebar will adjust its width to fill the available space provided by its parent container.
/// Otherwise, the sidebar will use the predefined width specified by the `SidebarWidth` key.
///
/// Note: The default value is `true`.
public struct IsSidebarAutoWidth: EnvironmentKey {
    public static let defaultValue: Bool = true
}

/// Represents the total width of the sidebar, including any leading and trailing padding.
///
/// The `SidebarWidth` key computes the total width of the sidebar by adding the base width of 288 points to the leading and trailing padding values, defined by the `SidebarLeadingPadding` and `SidebarTrailingPadding` keys, respectively.
///
/// Note: The default value is `288 + SidebarLeadingPadding.defaultValue + SidebarTrailingPadding.defaultValue`.
public struct SidebarWidth: EnvironmentKey {
    public static let defaultValue: CGFloat = 288 + SidebarLeadingPadding.defaultValue + SidebarTrailingPadding.defaultValue
}

/// Represents the leading padding within the sidebar.
///
/// The `SidebarLeadingPadding` key defines the space between the sidebar's content and its leading edge.
///
/// Note: The default value is `16` points.
public struct SidebarLeadingPadding: EnvironmentKey {
    public static let defaultValue: CGFloat = 16
}

/// Represents the trailing padding within the sidebar.
///
/// The `SidebarTrailingPadding` key defines the space between the sidebar's content and its trailing edge.
///
/// Note: The default value is `16` points.
public struct SidebarTrailingPadding: EnvironmentKey {
    public static let defaultValue: CGFloat = 16
}

// MARK: - Extension Documentation

public extension EnvironmentValues {
    /// A boolean value that indicates whether the sidebar should auto-adjust its width according to parent's available space.
    var isSidebarAutoWidth: Bool {
        get { self[IsSidebarAutoWidth.self] }
        set { self[IsSidebarAutoWidth.self] = newValue }
    }

    /// The total width of the sidebar, inclusive of leading and trailing padding. It only takes effect when isSidebarAutoWidth is set to false.
    var sidebarWidth: CGFloat {
        get { self[SidebarWidth.self] }
        set { self[SidebarWidth.self] = newValue }
    }

    /// The leading padding value for the sidebar.
    var sidebarLeadingPadding: CGFloat {
        get { self[SidebarLeadingPadding.self] }
        set { self[SidebarLeadingPadding.self] = newValue }
    }

    /// The trailing padding value for the sidebar.
    var sidebarTrailingPadding: CGFloat {
        get { self[SidebarTrailingPadding.self] }
        set { self[SidebarTrailingPadding.self] = newValue }
    }
}
