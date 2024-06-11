// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct _SideBarListItem<Icon: View, Title: View, Subtitle: View, AccessoryIcon: View> {
    @Environment(\.iconModifier) private var iconModifier
	@Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.accessoryIconModifier) private var accessoryIconModifier
	@Environment(\.sizeCategory) var sizeCategory
	@Environment(\.sideBarListItemConfigMode) var sideBarListItemConfigMode

    let _icon: Icon
	let _title: Title
	let _subtitle: Subtitle
	let _accessoryIcon: AccessoryIcon
	@ScaledMetric var scale: CGFloat = 1
    private var isModelInit: Bool = false
	private var isIconNil: Bool = false
	private var isSubtitleNil: Bool = false
	private var isAccessoryIconNil: Bool = false

    public init(
        @ViewBuilder icon: () -> Icon,
		@ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder accessoryIcon: () -> AccessoryIcon
        ) {
            self._icon = icon()
			self._title = title()
			self._subtitle = subtitle()
			self._accessoryIcon = accessoryIcon()
    }

    @ViewBuilder var icon: some View {
        if isModelInit {
            _icon.modifier(iconModifier.concat(Fiori._SideBarListItem.icon).concat(Fiori._SideBarListItem.iconCumulative))
        } else {
            _icon.modifier(iconModifier.concat(Fiori._SideBarListItem.icon))
        }
    }
	@ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori._SideBarListItem.title).concat(Fiori._SideBarListItem.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori._SideBarListItem.title))
        }
    }
	@ViewBuilder var subtitle: some View {
        if isModelInit {
            _subtitle.modifier(subtitleModifier.concat(Fiori._SideBarListItem.subtitle).concat(Fiori._SideBarListItem.subtitleCumulative))
        } else {
            _subtitle.modifier(subtitleModifier.concat(Fiori._SideBarListItem.subtitle))
        }
    }
	@ViewBuilder var accessoryIcon: some View {
        if isModelInit {
            _accessoryIcon.modifier(accessoryIconModifier.concat(Fiori._SideBarListItem.accessoryIcon).concat(Fiori._SideBarListItem.accessoryIconCumulative))
        } else {
            _accessoryIcon.modifier(accessoryIconModifier.concat(Fiori._SideBarListItem.accessoryIcon))
        }
    }
    
	var isIconEmptyView: Bool {
        ((isModelInit && isIconNil) || Icon.self == EmptyView.self) ? true : false
    }

	var isSubtitleEmptyView: Bool {
        ((isModelInit && isSubtitleNil) || Subtitle.self == EmptyView.self) ? true : false
    }

	var isAccessoryIconEmptyView: Bool {
        ((isModelInit && isAccessoryIconNil) || AccessoryIcon.self == EmptyView.self) ? true : false
    }
}

extension _SideBarListItem where Icon == _ConditionalContent<Image, EmptyView>,
		Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		AccessoryIcon == _ConditionalContent<Image, EmptyView> {

    public init(model: _SideBarListItemModel) {
        self.init(icon: model.icon, title: model.title, subtitle: model.subtitle, accessoryIcon: model.accessoryIcon)
    }

    public init(icon: Image? = nil, title: String, subtitle: String? = nil, accessoryIcon: Image? = nil) {
        self._icon = icon != nil ? ViewBuilder.buildEither(first: icon!) : ViewBuilder.buildEither(second: EmptyView())
		self._title = Text(title)
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._accessoryIcon = accessoryIcon != nil ? ViewBuilder.buildEither(first: accessoryIcon!) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isIconNil = icon == nil ? true : false
		isSubtitleNil = subtitle == nil ? true : false
		isAccessoryIconNil = accessoryIcon == nil ? true : false
    }
}
