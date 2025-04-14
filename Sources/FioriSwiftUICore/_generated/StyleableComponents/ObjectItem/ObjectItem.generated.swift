// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// A view that displays information of an object.
public struct ObjectItem {
    let title: any View
    let subtitle: any View
    let footnote: any View
    let description: any View
    let status: any View
    let substatus: any View
    let detailImage: any View
    let icons: any View
    let avatars: any View
    let footnoteIcons: any View
    let footnoteIconsText: any View
    let tags: any View
    let action: any View
    /// For accessory enhancement
    let objectItemButton: any View
    /// Indicate whether the description is shown in compact mode. Default value is `false`.
    let showDescriptionInCompact: Bool

    @Environment(\.objectItemStyle) var style

    var componentIdentifier: String = ObjectItem.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder subtitle: () -> any View = { EmptyView() },
                @ViewBuilder footnote: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() },
                @ViewBuilder status: () -> any View = { EmptyView() },
                @ViewBuilder substatus: () -> any View = { EmptyView() },
                @ViewBuilder detailImage: () -> any View = { EmptyView() },
                @IconBuilder icons: () -> any View = { EmptyView() },
                @AvatarsBuilder avatars: () -> any View = { EmptyView() },
                @FootnoteIconsBuilder footnoteIcons: () -> any View = { EmptyView() },
                @ViewBuilder footnoteIconsText: () -> any View = { EmptyView() },
                @TagBuilder tags: () -> any View = { EmptyView() },
                @ViewBuilder action: () -> any View = { EmptyView() },
                @ViewBuilder objectItemButton: () -> any View = { EmptyView() },
                showDescriptionInCompact: Bool = false,
                componentIdentifier: String? = ObjectItem.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.subtitle = Subtitle(subtitle: subtitle, componentIdentifier: componentIdentifier)
        self.footnote = Footnote(footnote: footnote, componentIdentifier: componentIdentifier)
        self.description = Description(description: description, componentIdentifier: componentIdentifier)
        self.status = Status(status: status, componentIdentifier: componentIdentifier)
        self.substatus = Substatus(substatus: substatus, componentIdentifier: componentIdentifier)
        self.detailImage = DetailImage(detailImage: detailImage, componentIdentifier: componentIdentifier)
        self.icons = Icons(icons: icons, componentIdentifier: componentIdentifier)
        self.avatars = Avatars(avatars: avatars, componentIdentifier: componentIdentifier)
        self.footnoteIcons = FootnoteIcons(footnoteIcons: footnoteIcons, componentIdentifier: componentIdentifier)
        self.footnoteIconsText = FootnoteIconsText(footnoteIconsText: footnoteIconsText, componentIdentifier: componentIdentifier)
        self.tags = Tags(tags: tags, componentIdentifier: componentIdentifier)
        self.action = Action(action: action, componentIdentifier: componentIdentifier)
        self.objectItemButton = objectItemButton()
        self.showDescriptionInCompact = showDescriptionInCompact
        self.componentIdentifier = componentIdentifier ?? ObjectItem.identifier
    }
}

public extension ObjectItem {
    static let identifier = "fiori_objectitem_component"
}

public extension ObjectItem {
    init(title: AttributedString,
         subtitle: AttributedString? = nil,
         footnote: AttributedString? = nil,
         description: AttributedString? = nil,
         status: TextOrIcon? = nil,
         substatus: TextOrIcon? = nil,
         detailImage: Image? = nil,
         icons: [TextOrIcon] = [],
         avatars: [TextOrIcon] = [],
         footnoteIcons: [TextOrIcon] = [],
         footnoteIconsText: AttributedString? = nil,
         tags: [AttributedString] = [],
         action: FioriButton? = nil,
         objectItemButton: FioriButton? = nil,
         showDescriptionInCompact: Bool = false)
    {
        self.init(title: { Text(title) }, subtitle: { OptionalText(subtitle) }, footnote: { OptionalText(footnote) }, description: { OptionalText(description) }, status: { TextOrIconView(status) }, substatus: { TextOrIconView(substatus) }, detailImage: { detailImage }, icons: { IconStack(icons) }, avatars: { AvatarsListStack(avatars) }, footnoteIcons: { FootnoteIconStack(footnoteIcons) }, footnoteIconsText: { OptionalText(footnoteIconsText) }, tags: { TagStack(tags) }, action: { action }, objectItemButton: { objectItemButton }, showDescriptionInCompact: showDescriptionInCompact)
    }
}

public extension ObjectItem {
    init(_ configuration: ObjectItemConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ObjectItemConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.subtitle = configuration.subtitle
        self.footnote = configuration.footnote
        self.description = configuration.description
        self.status = configuration.status
        self.substatus = configuration.substatus
        self.detailImage = configuration.detailImage
        self.icons = configuration.icons
        self.avatars = configuration.avatars
        self.footnoteIcons = configuration.footnoteIcons
        self.footnoteIconsText = configuration.footnoteIconsText
        self.tags = configuration.tags
        self.action = configuration.action
        self.objectItemButton = configuration.objectItemButton
        self.showDescriptionInCompact = configuration.showDescriptionInCompact
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ObjectItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), subtitle: .init(self.subtitle), footnote: .init(self.footnote), description: .init(self.description), status: .init(self.status), substatus: .init(self.substatus), detailImage: .init(self.detailImage), icons: .init(self.icons), avatars: .init(self.avatars), footnoteIcons: .init(self.footnoteIcons), footnoteIconsText: .init(self.footnoteIconsText), tags: .init(self.tags), action: .init(self.action), objectItemButton: .init(self.objectItemButton), showDescriptionInCompact: self.showDescriptionInCompact)).typeErased
                .transformEnvironment(\.objectItemStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ObjectItem {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ObjectItem(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), subtitle: .init(self.subtitle), footnote: .init(self.footnote), description: .init(self.description), status: .init(self.status), substatus: .init(self.substatus), detailImage: .init(self.detailImage), icons: .init(self.icons), avatars: .init(self.avatars), footnoteIcons: .init(self.footnoteIcons), footnoteIconsText: .init(self.footnoteIconsText), tags: .init(self.tags), action: .init(self.action), objectItemButton: .init(self.objectItemButton), showDescriptionInCompact: self.showDescriptionInCompact))
            .shouldApplyDefaultStyle(false)
            .objectItemStyle(ObjectItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
