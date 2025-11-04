import FioriThemeManager
import SwiftUI

/// An object that adopts the HierarchyViewDataSource protocol is responsible for providing the data required by a hierarchy view. It also handles the creation and configuration of cells used by the hierarchy view to display your data.
public protocol HierarchyViewDataSource {
    /// Gets the uuid for root item in hierarchy view. This method is only called when hierarchy view loads first time.
    ///
    /// - Returns: the uuid for root item in hierarchy view.
    func rootID() -> String
    
    /// Gets the number of children for a given item ID
    ///
    /// - Parameters:
    ///   - id: The uuid of the item from which hierarchy view requests number of childre
    ///
    /// - Returns: Number of children the item has.
    func numberOfChildren(for id: String) -> Int
    
    /// Gets the uuid of a child of the specified parent item at given index.
    ///
    /// - Parameters:
    ///   - index: The index of the child item
    ///   - parentID: The uuid of the parent item.
    ///
    /// - Returns: The uuid of child item.
    func childID(idForChildItemAt index: Int, with parentID: String) -> String
    
    /// Gets the uuid of the parent item of the specified child item.
    ///
    /// - parameter
    ///  - id: The uuid of the child item whose parent is requested.
    ///
    /// - returns: The uuid of the parent item or `nil` if parent does not exist.
    func parentID(for id: String) -> String?
    
    /// Gets the title for the item with specified uuid.
    ///
    /// - parameter
    ///  - uuid: The uuid of the item whose title is requested.
    ///
    ///  - returns: The title of the item or `nil` if it doesn't have a title.
    func itemTitle(for id: String) -> String?
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
        
    var body: some View {
        if let itemId = modelObject.currentID {
            HierarchyViewHeader(title: AttributedString(self.dataSource.itemTitle(for: itemId) ?? ""),
                                leadingAccessory: { Image(systemName: "chevron.left.square") },
                                trailingAccessory: { Image(systemName: "chevron.right.square") })
        }
    }
}

extension LeadingAccessory {
    // Wrapper the header's leading accessory clickable with default logic both the default and customized leading accessory
    init(_ configuration: LeadingAccessoryConfiguration, modelObject: HierarchyViewModelObject, isRTL: Bool) {
        let leadingAccessory: () -> AnyView = {
            if let _ = isRTL ? modelObject.childID : modelObject.parentID, let _ = modelObject.currentID {
                return AnyView(Button(action: {
                    isRTL ? modelObject.goChild() : modelObject.goParent()
                }) {
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
    init(_ configuration: TrailingAccessoryConfiguration, modelObject: HierarchyViewModelObject, isRTL: Bool) {
        let trailingAccessory: () -> AnyView = {
            if let _ = isRTL ? modelObject.parentID : modelObject.childID, let _ = modelObject.currentID {
                return AnyView(Button(action: {
                    isRTL ? modelObject.goParent() : modelObject.goChild()
                }) {
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
    func isLargeSizeCategory(_ sizeCategory: ContentSizeCategory) -> Bool {
        sizeCategory == .extraLarge ||
            sizeCategory == .extraExtraLarge ||
            sizeCategory == .extraExtraExtraLarge ||
            sizeCategory == .accessibilityMedium ||
            sizeCategory == .accessibilityLarge ||
            sizeCategory == .accessibilityExtraLarge ||
            sizeCategory == .accessibilityExtraExtraLarge ||
            sizeCategory == .accessibilityExtraExtraExtraLarge
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
    @Published private(set) var currentID: String?
    @Published private(set) var parentID: String?
    @Published var onCurrentItemChange: ((String) -> Void)? // To let any subview like HierarchyIndicatorView have the opportunity to change the ID independently with onCurrentItemChange and 'onCurrentHierarchyItemChange' EnvironmentValues.
  
    var idStack: [String] = [] // only keep the ID used as current ID. The first one with index[0] always the current ID
    
    var childID: String? {
        self.idStack.count > 1 ? self.idStack[1] : nil
    }
    
    var dataSource: HierarchyViewDataSource?
    
    func setCurrentID(_ newID: String) {
        self.currentID = newID
        self.idStack.removeAll() // Clear the stack for new setting of the current ID
        self.idStack.append(newID) // make the first one with index 0 always the current ID
        
        if let ds = dataSource, let parId = ds.parentID(for: newID) {
            self.parentID = parId
        }
    }
    
    func goParent() {
        if let cParentID = self.parentID {
            self.idStack.insert(cParentID, at: 0)
            self.currentID = cParentID
            if let ds = dataSource, let newParentID = ds.parentID(for: cParentID) {
                self.parentID = newParentID
            } else {
                self.parentID = nil
            }
        }
    }
    
    func goChild() {
        guard let tempCurrentID = currentID else { return }
        
        if self.idStack.count > 1 {
            self.parentID = tempCurrentID // currentID same with idStack[0]
            self.currentID = self.idStack[1]
            self.idStack.remove(at: 0)
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

struct HierarchyIDChangeKey: EnvironmentKey {
    static let defaultValue: ((String) -> Void)? = nil
}

extension EnvironmentValues {
    var onCurrentHierarchyItemChange: ((String) -> Void)? {
        get { self[HierarchyIDChangeKey.self] }
        set { self[HierarchyIDChangeKey.self] = newValue }
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
}
