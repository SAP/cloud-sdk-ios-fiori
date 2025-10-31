// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// A view that manages a collection of items presented using `HierarchyItemView`.
///
/// It defines the necessary properties and methods for components that display hierarchical data in a structured view.
/// It allows for customization of headers and item presentation, along with maintaining state related to selected and active items.
///
/// ## Usage
///    ### Initialization of DataSource:
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
///   ### Initialization of HierarchyView:
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
/// With the `hierarchyItemSelectionMode` environment property, you can control the selection mode for hierarchical items in `HierarchyItemView` within `HierarchyView`.
///
/// The selection button is displayed only when the `editMode` is active and the `hierarchyItemSelectionMode` is not set to `.none`. When a user clicks on the
/// `HierarchyItemView`, this configuration determines whether the selection button is shown, allowing for dynamic interaction with the hierarchy items.
///
/// Please refer to `HierarchyHeader`, `HierarchyItemView` and `HierarchyIndicator` documentation for all supported informtion.
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
