// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `ContactItem` provides a view that shows information related to contact.
/// ## Usage
/// ```swift
/// ContactItem(title: "Headline only example", description: "One line of text description is baseline aligned.", actionItems: [.init(type: .phone, didSelectActivityItem: {
///     print("tap phone")
/// }), .init(type: .videoCall, didSelectActivityItem: {
///     print("tap videoCall")
/// }), .init(type: .message, didSelectActivityItem: {
///     print("tap message")
/// })])
///
/// ContactItem {
///      Text("Headline only example")
/// } subtitle: {
///      Text("One line of text description is baseline aligned.")
/// } description: {
///      Text("Description")
/// } detailImage: {
///      Image("person_square4").resizable()
/// } actionItems: {
///      ActivityItems(activityItems: [.init(type: .phone, didSelectActivityItem: {
///          print("tap phone")
///      })])
/// }
/// ```
public struct ContactItem {
    let title: any View
    let subtitle: any View
    let description: any View
    let detailImage: any View
    let activityItems: any View

    @Environment(\.contactItemStyle) var style

    var componentIdentifier: String = ContactItem.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() },
                @ViewBuilder detailImage: () -> any View = { EmptyView() },
                @ActivityItemsBuilder activityItems: () -> any View = { EmptyView() },
                componentIdentifier: String? = ContactItem.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.subtitle = Subtitle(subtitle: subtitle, componentIdentifier: componentIdentifier)
        self.description = Description(description: description, componentIdentifier: componentIdentifier)
        self.detailImage = DetailImage(detailImage: detailImage, componentIdentifier: componentIdentifier)
        self.activityItems = ActivityItems(activityItems: activityItems, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? ContactItem.identifier
    }
}

public extension ContactItem {
    static let identifier = "fiori_contactitem_component"
}

public extension ContactItem {
    init(title: AttributedString,
         subtitle: AttributedString? = nil,
         description: AttributedString? = nil,
         detailImage: Image? = nil,
         activityItems: [ActivityItemDataType] = [],
         componentIdentifier: String? = ContactItem.identifier)
    {
        self.init(title: { Text(title) }, subtitle: { OptionalText(subtitle) }, description: { OptionalText(description) }, detailImage: { detailImage }, activityItems: { ActivityItemsListStack(activityItems) }, componentIdentifier: componentIdentifier)
    }
}

public extension ContactItem {
    init(_ configuration: ContactItemConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ContactItemConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.description = configuration.description
        self.detailImage = configuration.detailImage
        self.activityItems = configuration.activityItems
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ContactItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), subtitle: .init(self.subtitle), description: .init(self.description), detailImage: .init(self.detailImage), activityItems: .init(self.activityItems))).typeErased
                .transformEnvironment(\.contactItemStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ContactItem {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ContactItem(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), subtitle: .init(self.subtitle), description: .init(self.description), detailImage: .init(self.detailImage), activityItems: .init(self.activityItems)))
            .shouldApplyDefaultStyle(false)
            .contactItemStyle(ContactItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
