// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct SideBarListItem<Icon: View, Title: View, Subtitle: View, AccessoryIcon: View> {
    @Environment(\.iconModifier) private var iconModifier
	@Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.accessoryIconModifier) private var accessoryIconModifier
	@Environment(\.sideBarListItemConfigMode) var sideBarListItemConfigMode

    let _icon: Icon
	let _title: Title
	let _subtitle: Subtitle
	let _accessoryIcon: AccessoryIcon
	
    private var isModelInit: Bool = false
	private var isIconNil: Bool = false
	private var isSubtitleNil: Bool = false
	private var isAccessoryIconNil: Bool = false

    public init(
        @ViewBuilder icon: @escaping () -> Icon,
		@ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder accessoryIcon: @escaping () -> AccessoryIcon
        ) {
            self._icon = icon()
			self._title = title()
			self._subtitle = subtitle()
			self._accessoryIcon = accessoryIcon()
    }

    @ViewBuilder var icon: some View {
        if isModelInit {
            _icon.modifier(iconModifier.concat(Fiori.SideBarListItem.icon).concat(Fiori.SideBarListItem.iconCumulative))
        } else {
            _icon.modifier(iconModifier.concat(Fiori.SideBarListItem.icon))
        }
    }
	@ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.SideBarListItem.title).concat(Fiori.SideBarListItem.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.SideBarListItem.title))
        }
    }
	@ViewBuilder var subtitle: some View {
        if isModelInit {
            _subtitle.modifier(subtitleModifier.concat(Fiori.SideBarListItem.subtitle).concat(Fiori.SideBarListItem.subtitleCumulative))
        } else {
            _subtitle.modifier(subtitleModifier.concat(Fiori.SideBarListItem.subtitle))
        }
    }
	@ViewBuilder var accessoryIcon: some View {
        if isModelInit {
            _accessoryIcon.modifier(accessoryIconModifier.concat(Fiori.SideBarListItem.accessoryIcon).concat(Fiori.SideBarListItem.accessoryIconCumulative))
        } else {
            _accessoryIcon.modifier(accessoryIconModifier.concat(Fiori.SideBarListItem.accessoryIcon))
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

extension SideBarListItem where Icon == _ConditionalContent<Image, EmptyView>,
		Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		AccessoryIcon == _ConditionalContent<Image, EmptyView> {

    public init(model: SideBarListItemModel) {
        self.init(icon: model.icon_, title: model.title_, subtitle: model.subtitle_, accessoryIcon: model.accessoryIcon_)
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
