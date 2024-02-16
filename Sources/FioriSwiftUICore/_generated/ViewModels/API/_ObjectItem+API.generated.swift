// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct _ObjectItem<Title: View, Subtitle: View, Footnote: View, DescriptionText: View, Status: View, Substatus: View, DetailImage: View, Icons: View, Avatars: View, FootnoteIcons: View, Tags: View, ActionView: View> {
    @Environment(\.titleModifier) private var titleModifier
    @Environment(\.subtitleModifier) private var subtitleModifier
    @Environment(\.footnoteModifier) private var footnoteModifier
    @Environment(\.descriptionTextModifier) private var descriptionTextModifier
    @Environment(\.statusModifier) private var statusModifier
    @Environment(\.substatusModifier) private var substatusModifier
    @Environment(\.detailImageModifier) private var detailImageModifier
    @Environment(\.iconsModifier) private var iconsModifier
    @Environment(\.avatarsModifier) private var avatarsModifier
    @Environment(\.footnoteIconsModifier) private var footnoteIconsModifier
    @Environment(\.tagsModifier) private var tagsModifier
    @Environment(\.actionModifier) private var actionModifier
    @Environment(\.splitPercent) var splitPercent
    @Environment(\.sizeCategory) var sizeCategory
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    let _title: Title
    let _subtitle: Subtitle
    let _footnote: Footnote
    let _descriptionText: DescriptionText
    let _status: Status
    let _substatus: Substatus
    let _detailImage: DetailImage
    let _icons: Icons
    let _avatars: Avatars
    let _footnoteIcons: FootnoteIcons
    let _tags: Tags
    let _action: ActionView
    @State var mainViewSize: CGSize = .zero

    private var isModelInit: Bool = false
    private var isSubtitleNil: Bool = false
    private var isFootnoteNil: Bool = false
    private var isDescriptionTextNil: Bool = false
    private var isStatusNil: Bool = false
    private var isSubstatusNil: Bool = false
    private var isDetailImageNil: Bool = false
    private var isIconsNil: Bool = false
    private var isAvatarsNil: Bool = false
    private var isFootnoteIconsNil: Bool = false
    private var isTagsNil: Bool = false
    private var isActionNil: Bool = false

    public init(
        @ViewBuilder title: () -> Title,
        @ViewBuilder subtitle: () -> Subtitle,
        @ViewBuilder footnote: () -> Footnote,
        @ViewBuilder descriptionText: () -> DescriptionText,
        @ViewBuilder status: () -> Status,
        @ViewBuilder substatus: () -> Substatus,
        @ViewBuilder detailImage: () -> DetailImage,
        @IconBuilder icons: () -> Icons,
        @AvatarsBuilder avatars: () -> Avatars,
        @FootnoteIconsBuilder footnoteIcons: () -> FootnoteIcons,
        @TagBuilder tags: () -> Tags,
        @ViewBuilder action: () -> ActionView
    ) {
        self._title = title()
        self._subtitle = subtitle()
        self._footnote = footnote()
        self._descriptionText = descriptionText()
        self._status = status()
        self._substatus = substatus()
        self._detailImage = detailImage()
        self._icons = icons()
        self._avatars = avatars()
        self._footnoteIcons = footnoteIcons()
        self._tags = tags()
        self._action = action()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori._ObjectItem.title).concat(Fiori._ObjectItem.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori._ObjectItem.title))
        }
    }

    @ViewBuilder var subtitle: some View {
        if isModelInit {
            _subtitle.modifier(subtitleModifier.concat(Fiori._ObjectItem.subtitle).concat(Fiori._ObjectItem.subtitleCumulative))
        } else {
            _subtitle.modifier(subtitleModifier.concat(Fiori._ObjectItem.subtitle))
        }
    }

    @ViewBuilder var footnote: some View {
        if isModelInit {
            _footnote.modifier(footnoteModifier.concat(Fiori._ObjectItem.footnote).concat(Fiori._ObjectItem.footnoteCumulative))
        } else {
            _footnote.modifier(footnoteModifier.concat(Fiori._ObjectItem.footnote))
        }
    }

    @ViewBuilder var descriptionText: some View {
        if isModelInit {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori._ObjectItem.descriptionText).concat(Fiori._ObjectItem.descriptionTextCumulative))
        } else {
            _descriptionText.modifier(descriptionTextModifier.concat(Fiori._ObjectItem.descriptionText))
        }
    }

    @ViewBuilder var status: some View {
        if isModelInit {
            _status.modifier(statusModifier.concat(Fiori._ObjectItem.status).concat(Fiori._ObjectItem.statusCumulative))
        } else {
            _status.modifier(statusModifier.concat(Fiori._ObjectItem.status))
        }
    }

    @ViewBuilder var substatus: some View {
        if isModelInit {
            _substatus.modifier(substatusModifier.concat(Fiori._ObjectItem.substatus).concat(Fiori._ObjectItem.substatusCumulative))
        } else {
            _substatus.modifier(substatusModifier.concat(Fiori._ObjectItem.substatus))
        }
    }

    @ViewBuilder var detailImage: some View {
        if isModelInit {
            _detailImage.modifier(detailImageModifier.concat(Fiori._ObjectItem.detailImage).concat(Fiori._ObjectItem.detailImageCumulative))
        } else {
            _detailImage.modifier(detailImageModifier.concat(Fiori._ObjectItem.detailImage))
        }
    }

    @ViewBuilder var icons: some View {
        if isModelInit {
            _icons.modifier(iconsModifier.concat(Fiori._ObjectItem.icons).concat(Fiori._ObjectItem.iconsCumulative))
        } else {
            _icons.modifier(iconsModifier.concat(Fiori._ObjectItem.icons))
        }
    }

    @ViewBuilder var avatars: some View {
        if isModelInit {
            _avatars.modifier(avatarsModifier.concat(Fiori._ObjectItem.avatars).concat(Fiori._ObjectItem.avatarsCumulative))
        } else {
            _avatars.modifier(avatarsModifier.concat(Fiori._ObjectItem.avatars))
        }
    }

    @ViewBuilder var footnoteIcons: some View {
        if isModelInit {
            _footnoteIcons.modifier(footnoteIconsModifier.concat(Fiori._ObjectItem.footnoteIcons).concat(Fiori._ObjectItem.footnoteIconsCumulative))
        } else {
            _footnoteIcons.modifier(footnoteIconsModifier.concat(Fiori._ObjectItem.footnoteIcons))
        }
    }

    @ViewBuilder var tags: some View {
        if isModelInit {
            _tags.modifier(tagsModifier.concat(Fiori._ObjectItem.tags).concat(Fiori._ObjectItem.tagsCumulative))
        } else {
            _tags.modifier(tagsModifier.concat(Fiori._ObjectItem.tags))
        }
    }

    @ViewBuilder var action: some View {
        if isModelInit {
            _action.modifier(actionModifier.concat(Fiori._ObjectItem.action).concat(Fiori._ObjectItem.actionCumulative))
        } else {
            _action.modifier(actionModifier.concat(Fiori._ObjectItem.action))
        }
    }
    
    var isSubtitleEmptyView: Bool {
        ((self.isModelInit && self.isSubtitleNil) || Subtitle.self == EmptyView.self) ? true : false
    }

    var isFootnoteEmptyView: Bool {
        ((self.isModelInit && self.isFootnoteNil) || Footnote.self == EmptyView.self) ? true : false
    }

    var isDescriptionTextEmptyView: Bool {
        ((self.isModelInit && self.isDescriptionTextNil) || DescriptionText.self == EmptyView.self) ? true : false
    }

    var isStatusEmptyView: Bool {
        ((self.isModelInit && self.isStatusNil) || Status.self == EmptyView.self) ? true : false
    }

    var isSubstatusEmptyView: Bool {
        ((self.isModelInit && self.isSubstatusNil) || Substatus.self == EmptyView.self) ? true : false
    }

    var isDetailImageEmptyView: Bool {
        ((self.isModelInit && self.isDetailImageNil) || DetailImage.self == EmptyView.self) ? true : false
    }

    var isIconsEmptyView: Bool {
        ((self.isModelInit && self.isIconsNil) || Icons.self == EmptyView.self) ? true : false
    }

    var isAvatarsEmptyView: Bool {
        ((self.isModelInit && self.isAvatarsNil) || Avatars.self == EmptyView.self) ? true : false
    }

    var isFootnoteIconsEmptyView: Bool {
        ((self.isModelInit && self.isFootnoteIconsNil) || FootnoteIcons.self == EmptyView.self) ? true : false
    }

    var isTagsEmptyView: Bool {
        ((self.isModelInit && self.isTagsNil) || Tags.self == EmptyView.self) ? true : false
    }

    var isActionEmptyView: Bool {
        ((self.isModelInit && self.isActionNil) || ActionView.self == EmptyView.self) ? true : false
    }
}

public extension _ObjectItem where Title == Text,
    Subtitle == _ConditionalContent<Text, EmptyView>,
    Footnote == _ConditionalContent<Text, EmptyView>,
    DescriptionText == _ConditionalContent<Text, EmptyView>,
    Status == _ConditionalContent<TextOrIconView, EmptyView>,
    Substatus == _ConditionalContent<TextOrIconView, EmptyView>,
    DetailImage == _ConditionalContent<Image, EmptyView>,
    Icons == _ConditionalContent<IconStack, EmptyView>,
    Avatars == _ConditionalContent<AvatarStack, EmptyView>,
    FootnoteIcons == _ConditionalContent<FootnoteIconStack, EmptyView>,
    Tags == _ConditionalContent<TagStack, EmptyView>,
    ActionView == _ConditionalContent<_Action, EmptyView>
{
    init(model: _ObjectItemModel) {
        self.init(title: model.title, subtitle: model.subtitle, footnote: model.footnote, descriptionText: model.descriptionText, status: model.status, substatus: model.substatus, detailImage: model.detailImage, icons: model.icons, avatars: model.avatars, footnoteIcons: model.footnoteIcons, tags: model.tags, action: model.action != nil ? _Action(model: model.action!) : nil)
    }

    init(title: String, subtitle: String? = nil, footnote: String? = nil, descriptionText: String? = nil, status: TextOrIcon? = nil, substatus: TextOrIcon? = nil, detailImage: Image? = nil, icons: [TextOrIcon]? = nil, avatars: [TextOrIcon]? = nil, footnoteIcons: [TextOrIcon]? = nil, tags: [String]? = nil, action: _Action? = nil) {
        self._title = Text(title)
        self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
        self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
        self._descriptionText = descriptionText != nil ? ViewBuilder.buildEither(first: Text(descriptionText!)) : ViewBuilder.buildEither(second: EmptyView())
        self._status = status != nil ? ViewBuilder.buildEither(first: TextOrIconView(status: status!)) : ViewBuilder.buildEither(second: EmptyView())
        self._substatus = substatus != nil ? ViewBuilder.buildEither(first: TextOrIconView(substatus: substatus!)) : ViewBuilder.buildEither(second: EmptyView())
        self._detailImage = detailImage != nil ? ViewBuilder.buildEither(first: detailImage!) : ViewBuilder.buildEither(second: EmptyView())
        self._icons = icons != nil ? ViewBuilder.buildEither(first: IconStack(icons: icons!)) : ViewBuilder.buildEither(second: EmptyView())
        self._avatars = avatars != nil ? ViewBuilder.buildEither(first: AvatarStack(avatars: avatars!)) : ViewBuilder.buildEither(second: EmptyView())
        self._footnoteIcons = footnoteIcons != nil ? ViewBuilder.buildEither(first: FootnoteIconStack(footnoteIcons: footnoteIcons!)) : ViewBuilder.buildEither(second: EmptyView())
        self._tags = tags != nil ? ViewBuilder.buildEither(first: TagStack(tags: tags!)) : ViewBuilder.buildEither(second: EmptyView())
        self._action = action != nil ? ViewBuilder.buildEither(first: action!) : ViewBuilder.buildEither(second: EmptyView())

        self.isModelInit = true
        self.isSubtitleNil = subtitle == nil ? true : false
        self.isFootnoteNil = footnote == nil ? true : false
        self.isDescriptionTextNil = descriptionText == nil ? true : false
        self.isStatusNil = status == nil ? true : false
        self.isSubstatusNil = substatus == nil ? true : false
        self.isDetailImageNil = detailImage == nil ? true : false
        self.isIconsNil = icons == nil ? true : false
        self.isAvatarsNil = avatars == nil ? true : false
        self.isFootnoteIconsNil = footnoteIcons == nil ? true : false
        self.isTagsNil = tags == nil ? true : false
        self.isActionNil = action == nil ? true : false
    }
}
