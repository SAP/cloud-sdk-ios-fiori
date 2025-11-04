// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// A `HierarchyItemView` representing a component for displaying a collection item's business object content and hierarchy information in a user interface.
///
/// ### Overview
/// It serves as the default item view for presenting hierarchy items within a `HierarchyItemView`. It includes various components such as titles, subtitles, footnotes, icons, detail images, statuses, and accessory views that together provide a comprehensive representation of the data associated with the hierarchy item.
/// The `HierarchyItemView` can be utilized within a `HierarchyView` to display hierarchical information. Alternatively, it can also be used independently to present an item without the context of a hierarchical structure.
///
/// ### Key Features
/// - Composable content slots: title, subtitle, footnote, icons, detail image, status, accessory view.
/// - Optional hierarchyIndicator slot for navigation or contextual counts.
/// - Integrates with HierarchyView for navigation and selection.
/// - Supports standard accessory styles (e.g. disclosure).
///
/// ## Usage Independent:
/// To use `HierarchyItemView` independently and without `HierarchyView`.
///
/// ```swift
/// List {
///     ForEach(0..<5) { index in
///         HierarchyItemView(
///             title: { Text("Title \(index)") },
///             subtitle: { Text("Subtitle \(index)") },
///             footnote: { Text("Footnote \(index)") },
///             icons: {
///                 FioriIcon.message.badge.foregroundStyle(Color.preferredColor(.tintColor))
///                 FioriIcon.actions.bookmark.foregroundStyle(Color.preferredColor(.tintColor))
///                 FioriIcon.actions.attachment.foregroundStyle(Color.preferredColor(.tintColor))
///             },
///             detailImage: { FioriIcon.message.messageInformation.resizable().foregroundStyle(Color.preferredColor(.tintColor)) },
///             status: { Image(systemName: "exclamationmark.square.fill").foregroundStyle(Color.preferredColor(.negativeLabel)) },
///             accessoryType: .disclosure,
///             hierarchyIndicator: {
///                 HierarchyIndicator(
///                     title: index == 4 ? { EmptyView()} : { Text(self.formatNumber(indicatorNumber[index])) },
///                     isMultiline: false,
///                     isSelected: false,
///                     isClickable: false
///                 )
///             })
///    }
/// }
/// ```
///
/// ### See Also
/// HierarchyView, HierarchyIndicator.
public struct HierarchyItemView {
    let title: any View
    let subtitle: any View
    let footnote: any View
    let icons: any View
    let detailImage: any View
    let status: any View
    let accessoryType: AccessoryType
    /// The indicator view of the hierarchy view
    let hierarchyIndicator: any View

    @Environment(\.hierarchyItemViewStyle) var style

    var componentIdentifier: String = HierarchyItemView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @ViewBuilder footnote: () -> any View = { EmptyView() },
                @IconBuilder icons: () -> any View = { EmptyView() },
                @ViewBuilder detailImage: () -> any View = { EmptyView() },
                @ViewBuilder status: () -> any View = { EmptyView() },
                accessoryType: AccessoryType = .none,
                @ViewBuilder hierarchyIndicator: () -> any View = { EmptyView() },
                componentIdentifier: String? = HierarchyItemView.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.subtitle = Subtitle(subtitle: subtitle, componentIdentifier: componentIdentifier)
        self.footnote = Footnote(footnote: footnote, componentIdentifier: componentIdentifier)
        self.icons = Icons(icons: icons, componentIdentifier: componentIdentifier)
        self.detailImage = DetailImage(detailImage: detailImage, componentIdentifier: componentIdentifier)
        self.status = Status(status: status, componentIdentifier: componentIdentifier)
        self.accessoryType = accessoryType
        self.hierarchyIndicator = hierarchyIndicator()
        self.componentIdentifier = componentIdentifier ?? HierarchyItemView.identifier
    }
}

public extension HierarchyItemView {
    static let identifier = "fiori_hierarchyitemview_component"
}

public extension HierarchyItemView {
    init(title: AttributedString,
         subtitle: AttributedString? = nil,
         footnote: AttributedString? = nil,
         icons: [TextOrIcon] = [],
         detailImage: Image? = nil,
         status: TextOrIcon? = nil,
         accessoryType: AccessoryType = .none,
         @ViewBuilder hierarchyIndicator: () -> any View = { EmptyView() })
    {
        self.init(title: { Text(title) }, subtitle: { OptionalText(subtitle) }, footnote: { OptionalText(footnote) }, icons: { IconStack(icons) }, detailImage: { detailImage }, status: { TextOrIconView(status) }, accessoryType: accessoryType, hierarchyIndicator: hierarchyIndicator)
    }
}

public extension HierarchyItemView {
    init(_ configuration: HierarchyItemViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: HierarchyItemViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.footnote = configuration.footnote
        self.icons = configuration.icons
        self.detailImage = configuration.detailImage
        self.status = configuration.status
        self.accessoryType = configuration.accessoryType
        self.hierarchyIndicator = configuration.hierarchyIndicator
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension HierarchyItemView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), subtitle: .init(self.subtitle), footnote: .init(self.footnote), icons: .init(self.icons), detailImage: .init(self.detailImage), status: .init(self.status), accessoryType: self.accessoryType, hierarchyIndicator: .init(self.hierarchyIndicator))).typeErased
                .transformEnvironment(\.hierarchyItemViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension HierarchyItemView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        HierarchyItemView(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), subtitle: .init(self.subtitle), footnote: .init(self.footnote), icons: .init(self.icons), detailImage: .init(self.detailImage), status: .init(self.status), accessoryType: self.accessoryType, hierarchyIndicator: .init(self.hierarchyIndicator)))
            .shouldApplyDefaultStyle(false)
            .hierarchyItemViewStyle(HierarchyItemViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
