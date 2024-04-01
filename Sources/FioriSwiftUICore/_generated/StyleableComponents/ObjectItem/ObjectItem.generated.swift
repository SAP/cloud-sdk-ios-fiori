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
    let tags: any View
    let action: any View

    @Environment(\.objectItemStyle) var style

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
                @TagBuilder tags: () -> any View = { EmptyView() },
                @ViewBuilder action: () -> any View = { EmptyView() })
    {
        self.title = Title { title() }
        self.subtitle = Subtitle { subtitle() }
        self.footnote = Footnote { footnote() }
        self.description = Description { description() }
        self.status = Status { status() }
        self.substatus = Substatus { substatus() }
        self.detailImage = DetailImage { detailImage() }
        self.icons = Icons { icons() }
        self.avatars = Avatars { avatars() }
        self.footnoteIcons = FootnoteIcons { footnoteIcons() }
        self.tags = Tags { tags() }
        self.action = Action { action() }
    }
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
         tags: [AttributedString] = [],
         action: FioriButton? = nil)
    {
        self.init(title: { Text(title) }, subtitle: { OptionalText(subtitle) }, footnote: { OptionalText(footnote) }, description: { OptionalText(description) }, status: { TextOrIconView(status) }, substatus: { TextOrIconView(substatus) }, detailImage: { detailImage }, icons: { IconStack(icons) }, avatars: { AvatarStack(avatars) }, footnoteIcons: { FootnoteIconStack(footnoteIcons) }, tags: { TagStack(tags) }, action: { action })
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
        self.tags = configuration.tags
        self.action = configuration.action
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension ObjectItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(title: .init(self.title), subtitle: .init(self.subtitle), footnote: .init(self.footnote), description: .init(self.description), status: .init(self.status), substatus: .init(self.substatus), detailImage: .init(self.detailImage), icons: .init(self.icons), avatars: .init(self.avatars), footnoteIcons: .init(self.footnoteIcons), tags: .init(self.tags), action: .init(self.action))).typeErased
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
        ObjectItem(.init(title: .init(self.title), subtitle: .init(self.subtitle), footnote: .init(self.footnote), description: .init(self.description), status: .init(self.status), substatus: .init(self.substatus), detailImage: .init(self.detailImage), icons: .init(self.icons), avatars: .init(self.avatars), footnoteIcons: .init(self.footnoteIcons), tags: .init(self.tags), action: .init(self.action)))
            .shouldApplyDefaultStyle(false)
            .objectItemStyle(ObjectItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
