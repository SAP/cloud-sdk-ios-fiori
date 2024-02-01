// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct NewObjectItem {
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
    let newAction: any View

    @Environment(\.newObjectItemStyle) var style

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
                @ViewBuilder newAction: () -> any View = { EmptyView() })
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
        self.newAction = NewAction { newAction() }
    }
}

public extension NewObjectItem {
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
         newAction: FioriButton? = nil)
    {
        self.init(title: { Text(title) }, subtitle: { OptionalText(subtitle) }, footnote: { OptionalText(footnote) }, description: { OptionalText(description) }, status: { TextOrIconView(status) }, substatus: { TextOrIconView(substatus) }, detailImage: { detailImage }, icons: { IconStack(icons) }, avatars: { AvatarStack(avatars) }, footnoteIcons: { FootnoteIconStack(footnoteIcons) }, tags: { TagStack(tags) }, newAction: { newAction })
    }
}

public extension NewObjectItem {
    init(_ configuration: NewObjectItemConfiguration) {
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
        self.newAction = configuration.newAction
    }
}

extension NewObjectItem: View {
    public var body: some View {
        style.resolve(configuration: .init(title: .init(self.title), subtitle: .init(self.subtitle), footnote: .init(self.footnote), description: .init(self.description), status: .init(self.status), substatus: .init(self.substatus), detailImage: .init(self.detailImage), icons: .init(self.icons), avatars: .init(self.avatars), footnoteIcons: .init(self.footnoteIcons), tags: .init(self.tags), newAction: .init(self.newAction))).typeErased
            .transformEnvironment(\.newObjectItemStyleStack) { stack in
                if !stack.isEmpty {
                    stack.removeLast()
                }
            }
    }
}
