import FioriThemeManager
import SwiftUI

/// An object that adopts the HierarchyViewDataSource protocol is responsible for providing the data required by a hierarchy view. It also handles the creation and configuration of cells used by the hierarchy view to display your data.
public protocol HierarchyViewDataSource {
    /// Gets the uuid for root item in hierarchy view. This method is only called when hierarchy view loads first time.
    ///
    /// This synchronous API is used when the environment value `hierarchyViewIsAsync` is false.
    ///
    /// - Returns: the uuid for root item in hierarchy view.
    func rootID() -> String
    
    /// Gets the number of children for a given item ID
    ///
    /// This synchronous API is used when the environment value `hierarchyViewIsAsync` is false.
    ///
    /// - Parameters:
    ///   - id: The uuid of the item from which hierarchy view requests number of childre
    ///
    /// - Returns: Number of children the item has.
    func numberOfChildren(for id: String) -> Int
    
    /// Gets the uuid of a child of the specified parent item at given index.
    ///
    /// This synchronous API is always used by HierarchyView regardless of the `hierarchyViewIsAsync` environment value.
    ///
    /// - Parameters:
    ///   - index: The index of the child item
    ///   - parentID: The uuid of the parent item.
    ///
    /// - Returns: The uuid of child item.
    func childID(idForChildItemAt index: Int, with parentID: String) -> String
    
    /// Gets the uuid of the parent item of the specified child item.
    ///
    /// This synchronous API is used when the environment value `hierarchyViewIsAsync` is false.
    ///
    /// - parameter
    ///  - id: The uuid of the child item whose parent is requested.
    ///
    /// - returns: The uuid of the parent item or `nil` if parent does not exist.
    func parentID(for id: String) -> String?
    
    /// Gets the title for the item with specified uuid.
    ///
    /// This synchronous API is used when the environment value `hierarchyViewIsAsync` is false.
    ///
    /// - parameter
    ///  - uuid: The uuid of the item whose title is requested.
    ///
    ///  - returns: The title of the item or `nil` if it doesn't have a title.
    func itemTitle(for id: String) -> String?
    
    /// Asynchronously returns the UUID of the root item for the hierarchy view.
    ///
    /// This async API is used when the environment value `hierarchyViewIsAsync` is true.
    ///
    /// - Returns: the uuid for root item in hierarchy view.
    func rootIDAsync() async throws -> String
    
    /// Asynchronously gets the number of children for a given item ID
    ///
    /// This async API is used when the environment value `hierarchyViewIsAsync` is true.
    ///
    /// - Parameters:
    ///   - id: The uuid of the item from which hierarchy view requests number of childre
    ///
    /// - Returns: Number of children the item has.
    func numberOfChildrenAsync(for id: String) async throws -> Int
    
    /// Asynchronously gets the uuid of the parent item of the specified child item.
    ///
    /// This async API is used when the environment value `hierarchyViewIsAsync` is true.
    ///
    /// - parameter
    ///  - id: The uuid of the child item whose parent is requested.
    ///
    /// - returns: The uuid of the parent item or `nil` if parent does not exist.
    func parentIDAsync(for id: String) async throws -> String?
    
    /// Asynchronously gets the title for the item with specified uuid.
    ///
    /// This async API is used when the environment value `hierarchyViewIsAsync` is true.
    ///
    /// - parameter
    ///  - uuid: The uuid of the item whose title is requested.
    ///
    ///  - returns: The title of the item or `nil` if it doesn't have a title.
    func itemTitleAsync(for id: String) async throws -> String?
}

public extension HierarchyItemView {
    /// Attaches a long‑press copy action to the `HierarchyItemView` that copies the given item details to the system pasteboard.
    /// Use this modifier on a HierarchyItemView to enable a long‑press gesture which, when recognized, places a textual representation of the supplied details (title, optional subtitle, and optional footnote)
    /// on the system pasteboard.
    ///
    /// - parameter:
    ///  - title: The primary text to copy (required).
    ///  - subtitle: An optional secondary text to include in the copied content.
    ///  - footnote: An optional tertiary text to include in the copied content.
    ///
    ///  - returns: A view that performs the copy action on long press.
    func copyDetailsOnLongPress(title: String, subtitle: String?, footnote: String?) -> some View {
        modifier(CopyOnLongPressModifier(title: title, subtitle: subtitle, footnote: footnote))
    }
}

extension HierarchyView {
    init(_ configuration: HierarchyViewConfiguration, dataSource: some HierarchyViewDataSource) {
        if !configuration.header.isEmpty { // display customized header view
            self.init(configuration)
        } else { // Display the default header view with default leading and trailing accessory
            self.init(dataSource: configuration.dataSource,
                      header: { HierarchyViewHeaderContent(dataSource: dataSource) },
                      hierarchyItem: configuration.hierarchyItem,
                      activeChildItem: configuration.$activeChildItem,
                      selectedItems: configuration.$selectedItems)
        }
    }
}

struct HierarchyViewHeaderContent<DataSource: HierarchyViewDataSource>: View {
    let dataSource: DataSource
    @EnvironmentObject private var modelObject: HierarchyViewModelObject
    @Environment(\.hierarchyViewIsAsync) private var isAsync
    @State private var asyncTitle: AttributedString? = nil

    var body: some View {
        if !self.isAsync {
            if let itemId = modelObject.currentActiveItemID {
                HierarchyViewHeader(title: AttributedString(self.dataSource.itemTitle(for: itemId) ?? ""),
                                    leadingAccessory: { Image(systemName: "chevron.left.square") },
                                    trailingAccessory: { Image(systemName: "chevron.right.square") })
            }
        } else {
            let itemId = self.modelObject.currentActiveItemID

            let title: AttributedString = {
                if let t = asyncTitle { return t }
                return AttributedString("") // empty placeholder so header and accessories render
            }()

            HierarchyViewHeader(
                title: title,
                leadingAccessory: { Image(systemName: "chevron.left.square") },
                trailingAccessory: { Image(systemName: "chevron.right.square") }
            )
            .task(id: itemId) {
                // If there's no id yet, return — the task will re-run when the id becomes available.
                guard let id = modelObject.currentActiveItemID else { return }

                do {
                    // Use the async title API only (no synchronous cached lookup).
                    let fetched = try await dataSource.itemTitleAsync(for: id) // String? or AttributedString? adapt if needed

                    // Bail out if cancelled while awaiting.
                    if Task.isCancelled { return }

                    let newTitle = AttributedString(fetched ?? "")
                    await MainActor.run { self.asyncTitle = newTitle }
                } catch {
                    if Task.isCancelled { return }
                    // On error, set an empty/fallback title (or set an error string if you prefer).
                    await MainActor.run { self.asyncTitle = AttributedString("") }
                }
            }
            // Clear any previous fetched title whenever the id changes so we don't show a stale title.
            .onChange(of: itemId) { _, _ in self.asyncTitle = nil }
        }
    }
}

extension LeadingAccessory {
    // Wrapper the header's leading accessory clickable with default logic both the default and customized leading accessory
    init(_ configuration: LeadingAccessoryConfiguration, modelObject: HierarchyViewModelObject, isRTL: Bool, isEnabled: Bool, isAsync: Bool) {
        let leadingAccessory: () -> AnyView = {
            if isEnabled {
                let action = { [weak modelObject] in
                    guard let model = modelObject else { return }

                    if isAsync {
                        // Start an async Task from the synchronous action closure.
                        Task {
                            do {
                                try await model.moveCurrentActiveItemAsync(isRTL)
                            } catch {
                                // Replace with proper error handling/logging as needed.
                                print("moveCurrentActiveItemAsync failed:", error)
                            }
                        }
                    } else {
                        model.moveCurrentActiveItem(isRTL)
                    }
                }
                return AnyView(Button(action: action) {
                    configuration.leadingAccessory
                }.fixedSize(horizontal: true, vertical: false).layoutPriority(1))
            } else {
                return AnyView(configuration.leadingAccessory)
            }
        }
        self.init(leadingAccessory: leadingAccessory)
    }
}

extension TrailingAccessory {
    // Wrapper the header's trailing accessory clickable with default logic both the default and customized trailing accessory
    init(_ configuration: TrailingAccessoryConfiguration, modelObject: HierarchyViewModelObject, isRTL: Bool, isEnabled: Bool, isAsync: Bool) {
        let trailingAccessory: () -> AnyView = {
            if isEnabled {
                let action = { [weak modelObject] in
                    guard let model = modelObject else { return }

                    if isAsync {
                        // Start an async Task from the synchronous action closure.
                        Task {
                            do {
                                try await model.moveCurrentActiveItemAsync(!isRTL)
                            } catch {
                                // Replace with proper error handling/logging as needed.
                                print("moveCurrentActiveItemAsync failed:", error)
                            }
                        }
                    } else {
                        model.moveCurrentActiveItem(!isRTL)
                    }
                }
                
                return AnyView(Button(action: action) {
                    configuration.trailingAccessory
                }.fixedSize(horizontal: true, vertical: false).layoutPriority(1))
            } else {
                return AnyView(configuration.trailingAccessory)
            }
        }
        self.init(trailingAccessory: trailingAccessory)
    }
}

extension HierarchyViewConfiguration {
    func numberOfChildren(_ dataSource: some HierarchyViewDataSource, parentID: String) -> Int {
        dataSource.numberOfChildren(for: parentID)
    }
    
    func childItemID(_ dataSource: some HierarchyViewDataSource, idForChildItemAt index: Int, parentID: String) -> String {
        dataSource.childID(idForChildItemAt: index, with: parentID)
    }
    
    func siblingItems(_ dataSource: some HierarchyViewDataSource, itemID: String) -> [String]? {
        if let parentId = dataSource.parentID(for: itemID) {
            return self.childItemIDs(dataSource, parentID: parentId)
        }
        return nil
    }
    
    func siblingItemsAsync(_ dataSource: some HierarchyViewDataSource, itemID: String) async throws -> [String]? {
        if let parentId = try await dataSource.parentIDAsync(for: itemID) {
            return try await self.childItemIDsAsync(dataSource, parentID: parentId)
        }
        return nil
    }
    
    func childItemIDs(_ dataSource: some HierarchyViewDataSource, parentID: String) -> [String]? {
        let count = dataSource.numberOfChildren(for: parentID)
        guard count > 0 else {
            return nil
        }
        var ids: [String] = []
        for index in 0 ..< count {
            ids.append(dataSource.childID(idForChildItemAt: index, with: parentID))
        }
        return ids
    }
    
    func childItemIDsAsync(_ dataSource: some HierarchyViewDataSource, parentID: String) async throws -> [String]? {
        let count = try await dataSource.numberOfChildrenAsync(for: parentID)
        guard count > 0 else { return nil }
        var ids: [String] = []
        for index in 0 ..< count {
            // childID(...) is synchronous; make sure the data source updated its cache when fetching children
            ids.append(dataSource.childID(idForChildItemAt: index, with: parentID))
        }
        return ids
    }
    
    func isSelected(_ itemID: String) -> Bool {
        if let selectedItems {
            return selectedItems.contains(itemID)
        }
        return false
    }
    
    func onSelected(_ itemID: String, selectionMode: HierarchyItemSelectionMode) {
        if let currentSelectedItems = selectedItems {
            if selectionMode == .single {
                selectedItems?.removeAll()
                selectedItems?.append(itemID)
            } else if selectionMode == .multiple {
                if currentSelectedItems.contains(itemID) {
                    selectedItems?.removeAll(where: { value in
                        value == itemID
                    })
                } else {
                    selectedItems?.append(itemID)
                }
            }
        } else {
            selectedItems = [itemID]
        }
    }
}

extension HierarchyItemViewConfiguration {
    func isSingleLine() -> Bool {
        let nonEmptyCount = [self.title, self.subtitle, self.footnote].filter { !$0.isEmpty }.count
        return nonEmptyCount == 1
    }
    
    func maxIconsCount() -> Int {
        self.isSingleLine() ? (self.detailImage.isEmpty ? 1 : 2) : 3
    }
    
    func accessoryViewSize() -> CGSize {
        self.accessoryType == .detail ? CGSize(width: 22, height: 22) : CGSize(width: 14, height: 14)
    }

    func isAccessibilitySizeCategory(_ sizeCategory: ContentSizeCategory) -> Bool {
        sizeCategory == .accessibilityMedium || sizeCategory == .accessibilityLarge || sizeCategory == .accessibilityExtraLarge
            || sizeCategory == .accessibilityExtraExtraLarge || sizeCategory == .accessibilityExtraExtraExtraLarge
    }
    
    func isAccessibilityLargeSizeCategory(_ sizeCategory: ContentSizeCategory) -> Bool {
        sizeCategory == .accessibilityLarge || sizeCategory == .accessibilityExtraLarge
            || sizeCategory == .accessibilityExtraExtraLarge || sizeCategory == .accessibilityExtraExtraExtraLarge
    }
}

extension HierarchyIndicatorConfiguration {
    static func isLargeSizeCategory(_ sizeCategory: ContentSizeCategory) -> Bool {
        sizeCategory == .extraLarge ||
            sizeCategory == .extraExtraLarge ||
            sizeCategory == .extraExtraExtraLarge ||
            sizeCategory == .accessibilityMedium ||
            sizeCategory == .accessibilityLarge ||
            sizeCategory == .accessibilityExtraLarge ||
            sizeCategory == .accessibilityExtraExtraLarge ||
            sizeCategory == .accessibilityExtraExtraExtraLarge
    }
    
    static func indicatorWidth(sizeCategory: ContentSizeCategory, isMultiline: Bool) -> CGFloat {
        self.isLargeSizeCategory(sizeCategory) ? HierarchyIndicatorLayout.multiLineWideContentWidth : (isMultiline ? HierarchyIndicatorLayout.multiLineContentWidth : HierarchyIndicatorLayout.singleLineContentWidth)
    }
}

enum HierarchyIndicatorLayout {
    static let singleLineContentWidth: CGFloat = 68
    static let multiLineContentWidth: CGFloat = HierarchyIndicatorLayout.centeringInset + HierarchyIndicatorLayout.maxLabelWidth + HierarchyIndicatorLayout.centeringInset
    static let multiLineWideContentWidth: CGFloat = HierarchyIndicatorLayout.wideCenteringInset + HierarchyIndicatorLayout.wideMaxLabelWidth + HierarchyIndicatorLayout.wideCenteringInset

    static let leadingInset: CGFloat = 6
    static let centeringInset: CGFloat = 4
    static let wideCenteringInset: CGFloat = 12
    
    static let iconWidth: CGFloat = 16
    static let iconHeight: CGFloat = 16
    
    static let maxLabelWidth: CGFloat = 40
    static let wideMaxLabelWidth: CGFloat = 60
    
    static let rowElementSpace: CGFloat = 8
    static let columnElementSpace: CGFloat = 8
}

struct MeasureHeight: ViewModifier {
    var onChange: (CGFloat) -> Void
    
    func body(content: Content) -> some View {
        content
            .background(GeometryReader { geometry in
                Color.clear
                    .onAppear {
                        self.onChange(geometry.size.height)
                    }
                    .onChange(of: geometry.size.height) { _, newHeight in
                        self.onChange(newHeight)
                    }
            })
    }
}

extension View {
    func measureHeight(onChange: @escaping (CGFloat) -> Void) -> some View {
        self.modifier(MeasureHeight(onChange: onChange))
    }
}

class HierarchyViewModelObject: ObservableObject {
    var dataSource: HierarchyViewDataSource?
    
    var activeItemsStack: [String] = []
        
    @Published private(set) var currentActiveItemID: String?
    @Published var onCurrentActiveItemChange: ((String, Int) -> Void)? // To let any subview like HierarchyIndicatorView have the opportunity to change the ID independently with onCurrentItemChange and 'onCurrentHierarchyItemChange' EnvironmentValues.
    @Published var isMultilineIndicatorInMultiColumnLayout: Bool?
    @Published private(set) var activeParentID: String? = nil
    @Published private(set) var activeChildID: String? = nil
    
    var onIndicatorMultiLineChange: ((Bool) -> Void)?
    
    func setCurrentActiveItem(_ itemId: String) {
        self.activeItemsStack.removeAll()
        self.activeItemsStack.append(itemId)
        self.currentActiveItemID = itemId
        if let ds = dataSource, let parId = ds.parentID(for: itemId) {
            self.activeItemsStack.insert(parId, at: 0)
            self.activeParentID = parId
        }
    }
    
    func setCurrentActiveItemAsync(_ itemId: String) async throws {
        await MainActor.run {
            self.activeItemsStack.removeAll()
            self.activeItemsStack.append(itemId)
            self.currentActiveItemID = itemId
        }

        // ask the datasource for the parent asynchronously
        guard let ds = dataSource else { return }
        // propagate errors to caller - remove `throws` if you want to swallow errors
        if let parId = try await ds.parentIDAsync(for: itemId) {
            // since class is @MainActor, we are on main actor and can update directly
            if !self.activeItemsStack.contains(parId) {
                self.activeItemsStack.insert(parId, at: 0)
                await MainActor.run {
                    self.activeParentID = parId
                }
            }
        }
    }
    
    func isMovableToChild(_ columnCount: Int) -> Bool {
        guard let currentItemId = self.currentActiveItemID,
              activeItemsStack.count > 2,
              let activeItemIndex = activeItemsStack.firstIndex(of: currentItemId),
              (activeItemIndex + columnCount) <= activeItemsStack.count
        else {
            return false
        }
        
        return true
    }
    
    func parentOfSelectorOnlyItems(_ columnCount: Int) -> String? { // Get the parent item for the items which display in end column with only selector
        guard let activeChildItem = activeChildID, let activeChildIndex = self.activeItemsStack.firstIndex(of: activeChildItem) else {
            return nil
        }
        
        if columnCount == 2 {
            return self.activeItemsStack[activeChildIndex]
        } else if activeChildIndex + 1 < self.activeItemsStack.count {
            return self.activeItemsStack[activeChildIndex + 1]
        } else {
            return nil
        }
    }
    
    func moveCurrentActiveItem(_ toChild: Bool = true) {
        guard let item = toChild ? activeChildID : activeParentID else {
            return
        }
        let originalCurrent = self.currentActiveItemID
        self.currentActiveItemID = item
        
        if toChild {
            self.activeParentID = originalCurrent
            if let currentIndex = self.activeItemsStack.firstIndex(of: item) {
                if currentIndex + 1 < self.activeItemsStack.count {
                    self.activeChildID = self.activeItemsStack[currentIndex + 1]
                } else {
                    self.activeChildID = nil
                }
            }
        } else {
            self.activeChildID = originalCurrent
            if let currentIndex = self.activeItemsStack.firstIndex(of: item) {
                if currentIndex - 1 >= 0 {
                    self.activeParentID = self.activeItemsStack[currentIndex - 1]
                } else if let ds = dataSource, let parId = ds.parentID(for: item), let currentIndex = self.activeItemsStack.firstIndex(of: item), currentIndex == 0 {
                    self.activeItemsStack.insert(parId, at: 0)
                    self.activeParentID = parId
                }
            }
        }
    }
    
    @MainActor func moveCurrentActiveItemAsync(_ toChild: Bool = true) async throws {
        guard let item = toChild ? activeChildID : activeParentID else { return }

        let originalCurrent = self.currentActiveItemID
        self.currentActiveItemID = item

        if toChild {
            // move down to child
            self.activeParentID = originalCurrent
            if let currentIndex = self.activeItemsStack.firstIndex(of: item) {
                let nextIndex = currentIndex + 1
                self.activeChildID = nextIndex < self.activeItemsStack.count ? self.activeItemsStack[nextIndex] : nil
            }
            return
        }

        // moving up to parent
        self.activeChildID = originalCurrent
        guard let currentIndex = self.activeItemsStack.firstIndex(of: item) else {
            return
        }

        if currentIndex - 1 >= 0 {
            self.activeParentID = self.activeItemsStack[currentIndex - 1]
            return
        }

        // currentIndex == 0 -> may need to ask dataSource for parent asynchronously
        guard let ds = dataSource, currentIndex == 0 else {
            self.activeParentID = nil
            return
        }

        // Fetch parent off the main actor to avoid blocking UI/other main-actor work.
        // Use Task.detached to perform the fetch in a background context and propagate errors.
        let fetchedParentID = try await Task.detached { try await ds.parentIDAsync(for: item) }.value

        // Before mutating state, ensure the stack hasn't changed so insertion still makes sense.
        // If item is no longer at index 0, abort insertion (caller may have mutated the stack).
        guard let currentIndexAfter = self.activeItemsStack.firstIndex(of: item), currentIndexAfter == 0 else {
            return
        }

        if let parId = fetchedParentID {
            self.activeItemsStack.insert(parId, at: 0)
            self.activeParentID = parId
        } else {
            self.activeParentID = nil
        }
    }
    
    func setMultiColumnLayoutActiveItem(_ itemId: String, columnIndex: Int) {
        guard let currentItemId = self.currentActiveItemID, activeItemsStack.count > 0, let currentActiveIndex = activeItemsStack.firstIndex(of: currentItemId) else {
            return
        }
        
        var parentId: String? = nil
        var newCurrentActiveItem: String? = nil
        if columnIndex == -1 { // The current parent item was clicked
            guard let currentParent = activeParentID, currentParent != itemId else {
                // It means the passed itemId was same with the current parent and no action need to be performed
                return
            }
            // Remove all items include current active item from stack and put the passed in item as current active item.
            self.activeItemsStack.removeSubrange((currentActiveIndex - 1)...)
            self.activeItemsStack.append(itemId)
            self.currentActiveItemID = itemId
            
            if let ds = dataSource, let parId = ds.parentID(for: itemId), self.activeItemsStack.count == 1 {
                // To insert a new parent if the current item was first item in the stack
                self.activeItemsStack.insert(parId, at: 0)
            }
        }
        if columnIndex == 0 { // The current active item was clicked
            parentId = self.activeParentID
            if itemId != self.currentActiveItemID {
                newCurrentActiveItem = itemId
            }
        } else if columnIndex == 1 { // The current active child item was clicked
            parentId = self.currentActiveItemID
        } else if columnIndex == 2 {
            parentId = self.activeChildID
            newCurrentActiveItem = parentId
        }
        
        if let parent = parentId, let parentIdx = self.activeItemsStack.firstIndex(of: parent), parentIdx >= 0 {
            if parentIdx < self.activeItemsStack.count - 1 {
                let from = parentIdx + 1
                if self.activeItemsStack.indices.contains(from), self.activeItemsStack[from] != itemId {
                    self.activeItemsStack.removeSubrange(from...)
                }
            }
            if !self.activeItemsStack.contains(itemId) {
                self.activeItemsStack.append(itemId)
            }
            if let replaceCurrent = newCurrentActiveItem {
                self.currentActiveItemID = replaceCurrent
            } else { // Just to trigger any listener on this published variable changing
                let temp = self.currentActiveItemID
                self.currentActiveItemID = nil
                self.currentActiveItemID = temp
            }
        }
        
        if let newCurrentItem = self.currentActiveItemID, let newCurrentIndex = activeItemsStack.firstIndex(of: newCurrentItem) {
            if newCurrentIndex - 1 >= 0 {
                self.activeParentID = self.activeItemsStack[newCurrentIndex - 1]
                if newCurrentIndex == self.activeItemsStack.count - 1 {
                    self.activeChildID = nil
                } else if newCurrentIndex + 1 < self.activeItemsStack.count {
                    self.activeChildID = self.activeItemsStack[newCurrentIndex + 1]
                }
            }
        }
    }
    
    func setActiveItem(_ itemId: String) {
        guard let currentItemId = self.currentActiveItemID, activeItemsStack.count > 0, let currentIdex = activeItemsStack.firstIndex(of: currentItemId) else {
            return
        }
        
        if currentIdex < self.activeItemsStack.count - 1 {
            let from = currentIdex + 1
            if self.activeItemsStack.indices.contains(from), self.activeItemsStack[from] != itemId {
                self.activeItemsStack.removeSubrange(from...)
            }
        }
        if !self.activeItemsStack.contains(itemId) {
            self.activeItemsStack.append(itemId)
        }
        self.currentActiveItemID = itemId
        
        if let newCurrentIndex = activeItemsStack.firstIndex(of: itemId) {
            if newCurrentIndex - 1 >= 0 {
                self.activeParentID = self.activeItemsStack[newCurrentIndex - 1]
                if newCurrentIndex == self.activeItemsStack.count - 1 {
                    self.activeChildID = nil
                } else if newCurrentIndex + 1 < self.activeItemsStack.count {
                    self.activeChildID = self.activeItemsStack[newCurrentIndex + 1]
                }
            }
        }
    }
}

/// Enum representing the selection modes for hierarchical items.
///
/// The `HierarchyItemSelectionMode` enum defines different modes for selecting items in a hierarchy.
/// It can be used to control how users can interact with items in a hierarchical structure,
/// such as in tree views or nested lists.
///
/// - Note: The selection mode can be utilized to manage the user's ability to select items
///         depending on the specific requirements of your application.
public enum HierarchyItemSelectionMode {
    /// Do not allow selection of hierarchical items.
    case none
    
    /// Allow selection of a single hierarchical item.
    /// Only one item can be selected at any given time.
    case single
    
    /// Allow selection of multiple hierarchical items.
    /// The user can select more than one item from the hierarchy.
    case multiple
}

struct HierarchyItemSelectionModeKey: EnvironmentKey {
    static let defaultValue: HierarchyItemSelectionMode = .none
}

struct HierarchyViewIsAsyncKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

struct HierarchyIDChangeKey: EnvironmentKey {
    static let defaultValue: ((String, Int) -> Void)? = nil
}

struct HierarchyViewMultiColumnLayoutKey: EnvironmentKey {
    static let defaultValue: Bool = UIDevice.current.userInterfaceIdiom == .pad
}

struct HierarchyViewMultiColumnIndex: EnvironmentKey {
    static let defaultValue: Int = -2
}

struct HierarchyViewMultiColumnItemActived: EnvironmentKey {
    static let defaultValue: Bool? = nil
}

extension EnvironmentValues {
    var onCurrentHierarchyItemChange: ((String, Int) -> Void)? {
        get { self[HierarchyIDChangeKey.self] }
        set { self[HierarchyIDChangeKey.self] = newValue }
    }
    
    var isHierarchyViewMultiColumnLayout: Bool {
        get { self[HierarchyViewMultiColumnLayoutKey.self] }
        set { self[HierarchyViewMultiColumnLayoutKey.self] = newValue }
    }
    
    var hierarchyViewMultiColumnIndex: Int {
        get { self[HierarchyViewMultiColumnIndex.self] }
        set { self[HierarchyViewMultiColumnIndex.self] = newValue }
    }
    
    var isHierarchyViewMultiColumnItemActived: Bool? {
        get { self[HierarchyViewMultiColumnItemActived.self] }
        set { self[HierarchyViewMultiColumnItemActived.self] = newValue }
    }
}

public extension EnvironmentValues {
    /// A property that provides access to the selection mode for hierarchical items.
    ///
    /// The `hierarchyItemSelectionMode` property allows you to retrieve or set
    /// the selection mode for hierarchical items in HierarchyView and HierarchyItemView. This enables
    /// you to control how users can interact with items in a hierarchy (e.g., selecting
    /// items in a tree view or nested list).
    ///
    /// - Note: The selection mode is defined by the `HierarchyItemSelectionMode` enum,
    ///         which supports three modes: `none`, `single`, and `multiple`.
    var hierarchyItemSelectionMode: HierarchyItemSelectionMode {
        get { self[HierarchyItemSelectionModeKey.self] }
        set { self[HierarchyItemSelectionModeKey.self] = newValue }
    }
    
    /// Indicates whether a HierarchyView should use the asynchronous datasource API to load data.
    var hierarchyViewIsAsync: Bool {
        get { self[HierarchyViewIsAsyncKey.self] }
        set { self[HierarchyViewIsAsyncKey.self] = newValue }
    }
}

struct HierarchyItemSwippingColumnsLayoutView: View {
    var configuration: HierarchyViewConfiguration
    @EnvironmentObject private var modelObject: HierarchyViewModelObject
    @Environment(\.sizeCategory) private var sizeCategory
    @Environment(\.hierarchyViewIsAsync) private var isAsync
    @Environment(\.layoutDirection) private var layoutDirection
    
    // gesture state
    @State private var dragOffset: CGFloat = 0
    @State private var isDraggingHorizontally: Bool = false

    // async state (only used when isAsync == true)
    // Use optionals: nil = loading, [] = loaded empty
    @State private var leftParentItems: [String]? = []
    @State private var centerColumnItems: [[String]?] = []
    @State private var rightSelectorItems: [String]? = []
    @State private var loadToken = UUID()
    @State private var swipeTask: Task<Void, Never>? = nil

    // caches of which ID each column was last loaded for. If the captured ID hasn't changed,
    // we skip reloading that column.
    @State private var leftParentLoadedFor: String? = nil
    @State private var centerColumnLoadedFor: [String?] = []
    @State private var rightSelectorLoadedFor: String? = nil

    var body: some View {
        GeometryReader { geo in
            let displayColumns = self.getItemColumns(geo.size.width)
            let colWidth = geo.size.width / CGFloat(max(displayColumns, 1))
            ZStack {
                HStack(alignment: .top, spacing: 0) {
                    let width = HierarchyIndicatorConfiguration.indicatorWidth(sizeCategory: self.sizeCategory, isMultiline: true)

                    // Left parent indicator column (optional)
                    HStack {
                        if let parentID = modelObject.activeParentID {
                            if self.isAsync {
                                // loading state -> ProgressView when nil, otherwise the column
                                if self.leftParentItems == nil {
                                    self.fullHeightProgress(geo.size.height)
                                        .environment(\.hierarchyViewMultiColumnIndex, -1)
                                } else {
                                    HierarchyItemColumnScrollView(
                                        configuration: self.configuration,
                                        itemIds: self.leftParentItems ?? [],
                                        onlyIndicator: true
                                    )
                                    .frame(width: width)
                                    .environment(\.hierarchyViewMultiColumnIndex, -1)
                                }
                            } else {
                                HierarchyItemColumnScrollView(
                                    configuration: self.configuration,
                                    itemIds: self.configuration.siblingItems(self.configuration.dataSource, itemID: parentID) ?? [],
                                    onlyIndicator: true
                                )
                                .frame(width: width)
                                .environment(\.hierarchyViewMultiColumnIndex, -1)
                            }
                        } else {
                            // no parent -> empty placeholder width
                            EmptyView().frame(width: width)
                        }
                    }

                    Divider()

                    // Center columns
                    ForEach(0 ..< displayColumns, id: \.self) { colIndex in
                        if self.isAsync {
                            // Show ProgressView while nil (loading). Otherwise show the loaded items (possibly empty).
                            if self.centerColumnItems.indices.contains(colIndex) {
                                if self.centerColumnItems[colIndex] == nil {
                                    self.fullHeightProgress(geo.size.height)
                                        .environment(\.hierarchyViewMultiColumnIndex, colIndex)
                                } else {
                                    HierarchyItemColumnScrollView(
                                        configuration: self.configuration,
                                        itemIds: self.centerColumnItems[colIndex] ?? [],
                                        onlySelector: displayColumns < 3 && self.modelObject.activeChildID != nil && colIndex == 2
                                    )
                                    .environment(\.hierarchyViewMultiColumnIndex, colIndex)
                                }
                            } else {
                                self.fullHeightProgress(geo.size.height)
                                    .environment(\.hierarchyViewMultiColumnIndex, colIndex)
                            }
                        } else {
                            HierarchyItemColumnScrollView(
                                configuration: self.configuration,
                                itemIds: self.getColumnItems(displayColumns, columnIndex: colIndex),
                                onlySelector: displayColumns < 3 && self.modelObject.activeChildID != nil && colIndex == 2
                            )
                            .environment(\.hierarchyViewMultiColumnIndex, colIndex)
                        }

                        Divider()
                    }

                    // Right selector-only column (optional)
                    if let itemId = modelObject.parentOfSelectorOnlyItems(displayColumns) {
                        if self.isAsync {
                            if self.rightSelectorItems == nil {
                                self.fullHeightProgress(geo.size.height)
                            } else {
                                HierarchyItemColumnScrollView(
                                    configuration: self.configuration,
                                    itemIds: self.rightSelectorItems ?? [],
                                    onlySelector: true
                                )
                                .frame(width: width)
                            }
                        } else {
                            HierarchyItemColumnScrollView(
                                configuration: self.configuration,
                                itemIds: self.configuration.childItemIDs(self.configuration.dataSource, parentID: itemId) ?? [],
                                onlySelector: true
                            )
                            .frame(width: width)
                        }
                    } else {
                        HStack { EmptyView() }
                            .frame(width: width)
                    }
                }
                .background(Color(.systemGroupedBackground))
                .offset(x: self.layoutDirection == .leftToRight ? self.dragOffset : -self.dragOffset)
                .animation(.interactiveSpring(), value: self.layoutDirection == .leftToRight ? self.dragOffset : -self.dragOffset)
                .simultaneousGesture(self.horizontalAwareDrag(colWidth: colWidth, columnCount: displayColumns))
            }
            // when async mode, use .task to load columns and reload on relevant changes
            .task(id: self.asyncTaskIdentity(displayColumns)) {
                guard self.isAsync else { return }
                await self.reloadAllAsync(displayColumns: displayColumns)
            }
            .onChange(of: self.modelObject.currentActiveItemID) { _, _ in
                guard self.isAsync else { return }
                Task { await self.reloadAllAsync(displayColumns: displayColumns) }
            }
            .onChange(of: self.modelObject.activeChildID) { _, _ in
                guard self.isAsync else { return }
                Task { await self.reloadAllAsync(displayColumns: displayColumns) }
            }
            .onChange(of: self.modelObject.activeParentID) { _, _ in
                guard self.isAsync else { return }
                // only reload left parent (faster) — uses a wrapper that captures the current parentID
                Task { await self.reloadLeftParent(displayColumns: displayColumns) }
            }
            .onChange(of: displayColumns) { _, _ in
                guard self.isAsync else { return }
                Task { await self.reloadAllAsync(displayColumns: displayColumns) }
            }
        }
    }

    // MARK: - Sync helpers (existing behavior)

    private func getItemColumns(_ availableWidth: Double) -> Int {
        availableWidth < 840 ? 2 : (self.modelObject.activeChildID != nil ? 3 : 2)
    }

    private func getColumnItems(_ columns: Int, columnIndex: Int) -> [String] {
        guard let currentID = modelObject.currentActiveItemID else { return [] }
        switch columnIndex {
        case 0:
            return self.configuration.siblingItems(self.configuration.dataSource, itemID: currentID) ?? []
        case 1:
            return self.configuration.childItemIDs(self.configuration.dataSource, parentID: currentID) ?? []
        case 2:
            return self.configuration.childItemIDs(self.configuration.dataSource, parentID: self.modelObject.activeChildID ?? "") ?? []
        default:
            return []
        }
    }

    // MARK: - Async helpers & state accessors

    private func itemsForCenterColumn(_ index: Int) -> [String] {
        guard self.centerColumnItems.indices.contains(index), let items = centerColumnItems[index] else { return [] }
        return items
    }

    private func asyncTaskIdentity(_ displayColumns: Int) -> String {
        "\(displayColumns)-\(self.modelObject.currentActiveItemID ?? "nil")-\(self.modelObject.activeChildID ?? "nil")-\(self.modelObject.activeParentID ?? "nil")"
    }

    // Top-level reload that captures a snapshot and runs loads sequentially
    private func reloadAllAsync(displayColumns: Int) async {
        // bump token to invalidate older tasks
        let token = UUID()
        await MainActor.run { self.loadToken = token }

        // capture a consistent snapshot of IDs on the main actor
        let (snapshotCurrentID, snapshotActiveChildID, snapshotActiveParentID, snapshotRightParentCandidate) =
            await MainActor.run { (
                self.modelObject.currentActiveItemID,
                self.modelObject.activeChildID,
                self.modelObject.activeParentID,
                self.modelObject.parentOfSelectorOnlyItems(displayColumns)
            ) }

        // ensure center arrays sized on main actor quickly — do NOT force-clear already-loaded columns.
        await MainActor.run {
            if self.centerColumnItems.count != displayColumns {
                self.centerColumnItems = Array(repeating: nil, count: displayColumns)
            }
            if self.centerColumnLoadedFor.count != displayColumns {
                self.centerColumnLoadedFor = Array(repeating: nil, count: displayColumns)
            }
        }

        // sequentially load in deterministic order:
        // 1) left parent, 2) center columns (left-to-right), 3) right selector
        if Task.isCancelled { return }

        await self.reloadLeftParent(capturedParentID: snapshotActiveParentID, displayColumns: displayColumns, token: token)
        if Task.isCancelled { return }

        for index in 0 ..< displayColumns {
            await self.reloadCenterColumn(index: index,
                                          displayColumns: displayColumns,
                                          capturedCurrentID: snapshotCurrentID,
                                          capturedActiveChildID: snapshotActiveChildID,
                                          token: token)
            if Task.isCancelled { return }
        }

        await self.reloadRightSelector(capturedParentCandidate: snapshotRightParentCandidate, displayColumns: displayColumns, token: token)
    }

    // Keep an overload that was used elsewhere: capture the current parentID then call the captured variant
    private func reloadLeftParent(displayColumns: Int, token: UUID? = nil) async {
        let token = token ?? self.loadToken
        // capture parentID on MainActor
        let parentID = await MainActor.run { self.modelObject.activeParentID }
        await self.reloadLeftParent(capturedParentID: parentID, displayColumns: displayColumns, token: token)
    }

    // New captured-parameter variant that does not touch modelObject
    private func reloadLeftParent(capturedParentID: String?, displayColumns: Int, token: UUID) async {
        guard token == self.loadToken else { return } // stale

        // If capturedParentID matches last-loaded id for left column, skip reloading.
        if let parentID = capturedParentID {
            if self.leftParentLoadedFor == parentID {
                // already loaded (or currently loading) for this parent; skip
                return
            }
        } else {
            // no parent -> ensure empty and record loaded-for=nil
            if self.leftParentLoadedFor == nil, self.leftParentItems != nil {
                // already empty and recorded; nothing to do
                return
            }
            if token == self.loadToken {
                await MainActor.run {
                    self.leftParentItems = []
                    self.leftParentLoadedFor = nil
                }
            }
            return
        }

        // mark loading
        if token == self.loadToken {
            await MainActor.run { self.leftParentItems = nil }
        }

        do {
            let items = try await configuration.siblingItemsAsync(self.configuration.dataSource, itemID: capturedParentID!) ?? []
            if token == self.loadToken {
                await MainActor.run {
                    self.leftParentItems = items
                    self.leftParentLoadedFor = capturedParentID
                }
            }
        } catch {
            if token == self.loadToken {
                await MainActor.run {
                    self.leftParentItems = []
                    self.leftParentLoadedFor = capturedParentID
                }
            }
        }
    }

    // New center-column loader that accepts captured current/child ids
    private func reloadCenterColumn(index: Int, displayColumns: Int, capturedCurrentID: String?, capturedActiveChildID: String?, token: UUID) async {
        guard token == self.loadToken else { return } // stale

        // Ensure arrays sized on main actor before touching their elements
        await MainActor.run {
            if self.centerColumnItems.count != displayColumns {
                self.centerColumnItems = Array(repeating: nil, count: displayColumns)
            }
            if self.centerColumnLoadedFor.count != displayColumns {
                self.centerColumnLoadedFor = Array(repeating: nil, count: displayColumns)
            }
        }

        // Determine which captured ID this column depends on
        let keyForIndex: String?
        switch index {
        case 0, 1:
            keyForIndex = capturedCurrentID
        case 2:
            keyForIndex = capturedActiveChildID
        default:
            keyForIndex = nil
        }

        // If there's no relevant ID and index expects currentID/activeChildID to exist, set empty and record nil.
        if index == 0 || index == 1, capturedCurrentID == nil {
            if token == self.loadToken {
                await MainActor.run {
                    self.centerColumnItems[index] = []
                    self.centerColumnLoadedFor[index] = nil
                }
            }
            return
        }
        if index == 2, capturedActiveChildID == nil || capturedActiveChildID!.isEmpty {
            if token == self.loadToken {
                await MainActor.run {
                    self.centerColumnItems[index] = []
                    self.centerColumnLoadedFor[index] = nil
                }
            }
            return
        }

        // If already loaded (or loading) for this key, skip
        if self.centerColumnLoadedFor.indices.contains(index), self.centerColumnLoadedFor[index] == keyForIndex {
            return
        }

        // mark this index as loading
        if token == self.loadToken {
            await MainActor.run {
                self.centerColumnItems[index] = nil
            }
        }

        do {
            let items: [String]
            switch index {
            case 0:
                items = try await self.configuration.siblingItemsAsync(self.configuration.dataSource, itemID: capturedCurrentID!) ?? []
            case 1:
                items = try await self.configuration.childItemIDsAsync(self.configuration.dataSource, parentID: capturedCurrentID!) ?? []
            case 2:
                items = try await self.configuration.childItemIDsAsync(self.configuration.dataSource, parentID: capturedActiveChildID ?? "") ?? []
            default:
                items = []
            }

            if token == self.loadToken {
                await MainActor.run {
                    self.centerColumnItems[index] = items
                    self.centerColumnLoadedFor[index] = keyForIndex
                }
            }
        } catch {
            if token == self.loadToken {
                await MainActor.run {
                    self.centerColumnItems[index] = []
                    self.centerColumnLoadedFor[index] = keyForIndex
                }
            }
        }
    }

    // New right selector loader that accepts captured parent id
    private func reloadRightSelector(capturedParentCandidate: String?, displayColumns: Int, token: UUID) async {
        guard token == self.loadToken else { return } // stale

        // If capturedParentCandidate matches last-loaded id for right selector, skip reloading.
        if let itemId = capturedParentCandidate {
            if self.rightSelectorLoadedFor == itemId {
                return
            }
        } else {
            // no candidate -> ensure empty and record loaded-for=nil
            if self.rightSelectorLoadedFor == nil, self.rightSelectorItems != nil {
                return
            }
            if token == self.loadToken {
                await MainActor.run {
                    self.rightSelectorItems = []
                    self.rightSelectorLoadedFor = nil
                }
            }
            return
        }

        // mark loading
        if token == self.loadToken {
            await MainActor.run { self.rightSelectorItems = nil }
        }

        do {
            let items = try await configuration.childItemIDsAsync(self.configuration.dataSource, parentID: capturedParentCandidate!) ?? []
            if token == self.loadToken {
                await MainActor.run {
                    self.rightSelectorItems = items
                    self.rightSelectorLoadedFor = capturedParentCandidate
                }
            }
        } catch {
            if token == self.loadToken {
                await MainActor.run {
                    self.rightSelectorItems = []
                    self.rightSelectorLoadedFor = capturedParentCandidate
                }
            }
        }
    }
    
    @ViewBuilder private func fullHeightProgress(_ minHeight: CGFloat? = nil) -> some View {
        VStack {
            Spacer(minLength: 0)
            ProgressView()
            Spacer(minLength: 0)
        }
        .frame(minHeight: minHeight)
        .frame(maxWidth: .infinity)
    }

    // MARK: - Drag gesture (same behavior as before)

    private func horizontalAwareDrag(colWidth: CGFloat, columnCount: Int) -> some Gesture {
        DragGesture(minimumDistance: 6, coordinateSpace: .local)
            .onChanged { value in
                let dx = value.translation.width
                let dy = value.translation.height

                let minDistance: CGFloat = 6
                let dominanceRatio: CGFloat = 1.2

                if !self.isDraggingHorizontally {
                    if abs(dx) > minDistance, abs(dx) > abs(dy) * dominanceRatio {
                        self.isDraggingHorizontally = true
                    } else if abs(dy) > minDistance, abs(dy) > abs(dx) * dominanceRatio {
                        self.isDraggingHorizontally = false
                        return
                    } else {
                        return
                    }
                }

                if self.isDraggingHorizontally {
                    let maxOverdrag: CGFloat = colWidth * 0.5
                    let limited = min(max(dx, -colWidth - maxOverdrag), colWidth + maxOverdrag)
                    self.dragOffset = limited
                }
            }
            .onEnded { value in
                let dx = value.translation.width
                let predicted = value.predictedEndTranslation.width

                guard self.isDraggingHorizontally else {
                    self.dragOffset = 0
                    self.isDraggingHorizontally = false
                    return
                }

                let threshold = colWidth * 0.25

                if dx < -threshold || predicted < -threshold {
                    withAnimation(.easeOut(duration: 0.20)) { self.dragOffset = -48 }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.22) { //  Left swipe to retrieve the children
                        if self.layoutDirection == .leftToRight {
                            if self.modelObject.isMovableToChild(columnCount) { self.modelObject.moveCurrentActiveItem(true) }
                        } else {
                            self.modelObject.moveCurrentActiveItem(false)
                        }
                        
                        var t = Transaction(); t.disablesAnimations = true
                        withTransaction(t) { self.dragOffset = 0 }
                    }
                } else if dx > threshold || predicted > threshold { // right swipe to retirve the parent
                    withAnimation(.easeOut(duration: 0.20)) { self.dragOffset = 48 }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.22) {
                        if self.layoutDirection == .leftToRight {
                            self.modelObject.moveCurrentActiveItem(false)
                        } else {
                            if self.modelObject.isMovableToChild(columnCount) { self.modelObject.moveCurrentActiveItem(true) }
                        }
                        
                        var t = Transaction(); t.disablesAnimations = true
                        withTransaction(t) { self.dragOffset = 0 }
                    }
                } else {
                    withAnimation(.interactiveSpring()) { self.dragOffset = 0 }
                }

                DispatchQueue.main.async { self.isDraggingHorizontally = false }
            }
    }
}

struct HierarchyItemColumnScrollView: View {
    var configuration: HierarchyViewConfiguration
    var itemIds: [String]
    @State var onlyIndicator: Bool = false
    @State var onlySelector: Bool = false
    
    @EnvironmentObject private var modelObject: HierarchyViewModelObject
    @Environment(\.hierarchyItemSelectionMode) private var selectionMode
    @Environment(\.editMode) private var editMode
    @Environment(\.sizeCategory) private var sizeCategory
    @Environment(\.hierarchyViewMultiColumnIndex) private var columnIndex
    @State private var size: CGSize = .zero
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            LazyVStack(spacing: 0, pinnedViews: []) {
                ForEach(self.itemIds, id: \.self) { id in
                    let isActived = isActived(columnIndex, modelObject: modelObject, itemId: id)
                    let width = HierarchyIndicatorConfiguration.indicatorWidth(sizeCategory: self.sizeCategory, isMultiline: true)
                    
                    if self.onlyIndicator {
                        let childrenCount = self.configuration.numberOfChildren(self.configuration.dataSource, parentID: id)
                        HStack {
                            HierarchyIndicator(
                                title: AttributedString("\(childrenCount)"),
                                isMultiline: true,
                                isSelected: isActived,
                                isClickable: childrenCount > 0
                            ) {
                                self.modelObject.setMultiColumnLayoutActiveItem(id, columnIndex: self.columnIndex)
                                return nil
                            }
                            .frame(height: width * 2)
                            .padding(12)
                        }
                        .background(Color.preferredColor(isActived ? .informationBackground : .cellBackground))
                    } else if self.editMode?.wrappedValue == .active, self.selectionMode != .none {
                        HStack {
                            Image(systemName: self.configuration.isSelected(id) ? "checkmark.circle.fill" : "circle")
                                .foregroundStyle(Color.preferredColor(.tintColor))
                            
                            if !self.onlySelector {
                                Spacer().frame(width: 16)
                                
                                self.configuration.hierarchyItem(id).typeErased
                            }
                        }
                        .frame(height: self.onlySelector ? (width * 2) : nil)
                        .padding(16)
                        .background(Color.preferredColor(isActived ? .informationBackground : .cellBackground))
                        .onTapGesture {
                            self.configuration.onSelected(id, selectionMode: self.selectionMode)
                        }
                        .environment(\.isHierarchyViewMultiColumnItemActived, isActived)
                    } else if !self.onlySelector {
                        self.configuration.hierarchyItem(id).typeErased
                            .padding(16)
                            .background(Color.preferredColor(isActived ? .informationBackground : .cellBackground))
                    }
                    
                    Divider()
                }
            }
        }
    }
    
    private func isActived(_ column: Int, modelObject: HierarchyViewModelObject, itemId: String) -> Bool {
        switch column {
        case -1:
            return modelObject.activeParentID == itemId
        case 0:
            return modelObject.currentActiveItemID == itemId
        case 1:
            return modelObject.activeChildID == itemId
        case 2:
            if let activeChild = modelObject.activeChildID, let activeChildIndex = modelObject.activeItemsStack.firstIndex(of: activeChild), activeChildIndex + 1 < modelObject.activeItemsStack.count, modelObject.activeItemsStack[activeChildIndex + 1] == itemId {
                return true
            }
            return false
        default:
            return false
        }
    }
}

struct CopyOnLongPressModifier: ViewModifier {
    let title: String
    let subtitle: String?
    let footnote: String?

    @State private var showingDialog = false
    @State private var showingCopiedAlert = false

    func body(content: Content) -> some View {
        content
            .onLongPressGesture {
                self.showingDialog = true
            }
            .confirmationDialog("", isPresented: self.$showingDialog, titleVisibility: .visible) {
                Button("Copy") {
                    self.copyToClipboard(title: self.title, subtitle: self.subtitle, footnote: self.footnote)
                    self.showingCopiedAlert = true
                }
            }
    }

    private func copyToClipboard(title: String, subtitle: String?, footnote: String?) {
        let parts = [title, subtitle, footnote]
            .compactMap { $0?.trimmingCharacters(in: .whitespacesAndNewlines) }
            .filter { !$0.isEmpty }

        let text = parts.joined(separator: "\n")

        #if canImport(UIKit)
            UIPasteboard.general.string = text
        #elseif canImport(AppKit)
            let pasteboard = NSPasteboard.general
            pasteboard.clearContents()
            pasteboard.setString(text, forType: .string)
        #endif
    }
}
