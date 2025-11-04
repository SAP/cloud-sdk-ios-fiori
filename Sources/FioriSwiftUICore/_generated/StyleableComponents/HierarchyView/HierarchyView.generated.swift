// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `HierarchyView` displays tree-structured data using `HierarchyItemView` rows and an optional `HierarchyHeader`, which is available for customization purposes.
///
/// ### Overview
/// Use `HierarchyView` when you need to browse, navigate, and (optionally) select items in a hierarchical data set (parent/child relationships).
/// The component delegates data access to a `HierarchyViewDataSource` so large or dynamic trees can be served efficiently.
///
/// ### Key Features
/// - Pluggable data source (HierarchyViewDataSource) defining root, children, parent lookups, and titles.
/// - Custom per-item view content via the hierarchyItem closure.
/// - Optional header view for customized navigation controls / summary information.
/// - Built-in selection handling (single / multiple / none) controlled by the hierarchyItemSelectionMode environment value.
/// - Style system (Fiori & custom) applied through hierarchyViewStyle modifiers.
///
/// ### Data Source Contract (Summary)
/// Your data source must provide stable, unique String identifiers for every item. Child counts and IDs should remain consistent during a single render pass.
/// See HierarchyViewDataSource for full protocol requirements.
///
/// ```swift
/// struct HierarchySimpleDataSource: HierarchyViewDataSource {
///     func rootID() -> String {
///         return "100"
///     }
///
///     func numberOfChildren(for id: String) -> Int {
///         return Int.random(in: 0...5)
///     }
///
///     func childID(idForChildItemAt index: Int, with parentID: String) -> String {
///         if let intValue = Int(parentID) {
///             return String(intValue + index)
///         } else {
///             return ""
///         }
///     }
///
///     func parentID(for id: String) -> String? {
///         if let intValue = Int(id), intValue > 100 {
///             return String(intValue - 100)
///         } else {
///             return nil
///         }
///     }
///
///     func itemTitle(for id: String) -> String? {
///         return id
///     }
/// }
/// ```
///
/// ### State Bindings
/// - activeChildItem: The identifier that will become active (e.g. next navigated child) when the user invokes forward navigation in the header.
/// - selectedItems: Collection of currently selected item IDs (optional array in the generated initializer).
/// In single-selection mode only the first element is considered; in multiple-selection mode all elements are used.
///
/// ### Selection Mode
/// Controlled externally via environment:
/// ```swift
/// .environment(\.hierarchyItemSelectionMode, .none)     // selection disabled
/// .environment(\.hierarchyItemSelectionMode, .single)   // single selection
/// .environment(\.hierarchyItemSelectionMode, .multiple) // multi selection
/// ```
/// Selection affordances (selection buttons) are only visible while EditMode is .active and the selection mode is not .none.
///
/// ### Usage
/// #### 1. Simple Initialization (generated initializer)
///
/// ```swift
/// @State var activeChildItem: String?
/// @State var selectedItems: [String]? = []
/// @State var isEditing = true
/// @State var selectionMode = HierarchyItemSelectionMode.single
///
/// let dataSource = HierarchySimpleDataSource()
///
/// HierarchyView(
///     dataSource: dataSource,
///     hierarchyItem: { id in
///         title: { Text(id) },
///         hierarchyIndicator: {
///             let childrenCount = dataSource.numberOfChildren(for: id)
///             HierarchyIndicator(
///                 title: AttributedString(String("Indicator \(id)")),
///                 isMultiline: self.isMultiline,
///                 isSelected: activeChildItem == id,
///                 isClickable: childrenCount > 0
///          ){
///             id
///          }
///    },
///    activeChildItem: self.$activeChildItem,
///    selectedItems: self.$selectedItems
/// )
/// .environment(\.editMode, .constant(isEditing ? EditMode.active : EditMode.inactive))
/// .environment(\.hierarchyItemSelectionMode, selectionMode)
/// ```
///
/// #### 2. Single Selection Convenience (see public API extension)
///
/// ```swift
/// @State private var activeChild: String? = nil
/// @State private var selected: String? = nil
/// HierarchyView.singleSelection(
///     dataSource: dataSource,
///     hierarchyItem: { id in Text(id) },
///     activeChildItem: $activeChild,
///     selectedItem: $selected
/// )
/// .environment(\.hierarchyItemSelectionMode, .single)
/// ```
///
/// #### 3. Multi Selection With Set (see public API extension)
///
/// ```swift
/// @State private var activeChild: String? = nil
/// @State private var selectedSet: Set<String> = []
/// HierarchyView.multiSelection(
///     dataSource: dataSource,
///     hierarchyItem: { id in Text(id) },
///     activeChildItem: $activeChild,
///     selectedItems: $selectedSet
/// )
/// .environment(\.hierarchyItemSelectionMode, .multiple)
/// ```
///
/// ### Styling
///
/// Apply or compose styles using:
/// ```swift
/// HierarchyView(...)
/// .hierarchyViewStyle(MyCustomHierarchyStyle())
/// ```
/// Custom styles implement HierarchyViewStyle and can be layered; the environment maintains an internal style stack.
///
/// ### See Also
/// HierarchyViewDataSource, HierarchyItemView, HierarchyHeader, HierarchyIndicator, HierarchyViewStyle.
public struct HierarchyView {
    /// The data source object of hierarchy view.
    let dataSource: any HierarchyViewDataSource
    /// The header view for the `HierarchyView`, represented by `HierarchyViewHeader`.
    ///
    /// By default, a header view is not specified unless customization is desired.
    /// Consumers can provide a custom header view to tailor the appearance and behavior of the hierarchy view to meet specific requirements.
    let header: any View
    /// The hierarchy item view, represented by `HierarchyItemView`, is used as a child item view within the `HierarchyView`.
    /// Consumers can provide an instance of `HierarchyItemView` based on the given child item id to customize the representation of each item in the hierarchy.
    let hierarchyItem: (String) -> any View
    /// Indicates the ID of the child hierarchy item that will be displayed when the next button in the `HierarchyHeader` is clicked.
    @Binding var activeChildItem: String?
    /// Indicates the ID of the selected hierarchy item. IIn `HierarchyItemSelectionMode.single` mode, only one item can be selected.
    @Binding var selectedItems: [String]?

    @Environment(\.hierarchyViewStyle) var style

    var componentIdentifier: String = HierarchyView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(dataSource: any HierarchyViewDataSource,
                @ViewBuilder header: () -> any View = { EmptyView() },
                @ViewBuilder hierarchyItem: @escaping (String) -> any View,
                activeChildItem: Binding<String?>,
                selectedItems: Binding<[String]?>,
                componentIdentifier: String? = HierarchyView.identifier)
    {
        self.dataSource = dataSource
        self.header = header()
        self.hierarchyItem = hierarchyItem
        self._activeChildItem = activeChildItem
        self._selectedItems = selectedItems
        self.componentIdentifier = componentIdentifier ?? HierarchyView.identifier
    }
}

public extension HierarchyView {
    static let identifier = "fiori_hierarchyview_component"
}

public extension HierarchyView {
    init(_ configuration: HierarchyViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: HierarchyViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.dataSource = configuration.dataSource
        self.header = configuration.header
        self.hierarchyItem = configuration.hierarchyItem
        self._activeChildItem = configuration.$activeChildItem
        self._selectedItems = configuration.$selectedItems
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension HierarchyView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, dataSource: self.dataSource, header: .init(self.header), hierarchyItem: self.hierarchyItem, activeChildItem: self.$activeChildItem, selectedItems: self.$selectedItems)).typeErased
                .transformEnvironment(\.hierarchyViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension HierarchyView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        HierarchyView(.init(componentIdentifier: self.componentIdentifier, dataSource: self.dataSource, header: .init(self.header), hierarchyItem: self.hierarchyItem, activeChildItem: self.$activeChildItem, selectedItems: self.$selectedItems))
            .shouldApplyDefaultStyle(false)
            .hierarchyViewStyle(HierarchyViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
