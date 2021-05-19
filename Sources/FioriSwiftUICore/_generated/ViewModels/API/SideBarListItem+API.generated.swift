// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct SideBarListItem<Icon: View, Title: View, Detail: View, AccessoryIcon: View> {
    @Environment(\.iconModifier) private var iconModifier
	@Environment(\.titleModifier) private var titleModifier
	@Environment(\.detailModifier) private var detailModifier
	@Environment(\.accessoryIconModifier) private var accessoryIconModifier

    let _icon: Icon
	let _title: Title
	let _detail: Detail
	let _accessoryIcon: AccessoryIcon
	
    private var isModelInit: Bool = false
	private var isIconNil: Bool = false
	private var isDetailNil: Bool = false
	private var isAccessoryIconNil: Bool = false

    public init(
        @ViewBuilder icon: @escaping () -> Icon,
		@ViewBuilder title: @escaping () -> Title,
		@ViewBuilder detail: @escaping () -> Detail,
		@ViewBuilder accessoryIcon: @escaping () -> AccessoryIcon
        ) {
            self._icon = icon()
			self._title = title()
			self._detail = detail()
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
	@ViewBuilder var detail: some View {
        if isModelInit {
            _detail.modifier(detailModifier.concat(Fiori.SideBarListItem.detail).concat(Fiori.SideBarListItem.detailCumulative))
        } else {
            _detail.modifier(detailModifier.concat(Fiori.SideBarListItem.detail))
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

	var isDetailEmptyView: Bool {
        ((isModelInit && isDetailNil) || Detail.self == EmptyView.self) ? true : false
    }

	var isAccessoryIconEmptyView: Bool {
        ((isModelInit && isAccessoryIconNil) || AccessoryIcon.self == EmptyView.self) ? true : false
    }
}

extension SideBarListItem where Icon == _ConditionalContent<Image, EmptyView>,
		Title == Text,
		Detail == _ConditionalContent<Text, EmptyView>,
		AccessoryIcon == _ConditionalContent<Image, EmptyView> {

    public init(model: SideBarListItemModel) {
        self.init(icon: model.icon_, title: model.title_, detail: model.detail_, accessoryIcon: model.accessoryIcon_)
    }

    public init(icon: Image? = nil, title: String, detail: String? = nil, accessoryIcon: Image? = nil) {
        self._icon = icon != nil ? ViewBuilder.buildEither(first: icon!) : ViewBuilder.buildEither(second: EmptyView())
		self._title = Text(title)
		self._detail = detail != nil ? ViewBuilder.buildEither(first: Text(detail!)) : ViewBuilder.buildEither(second: EmptyView())
		self._accessoryIcon = accessoryIcon != nil ? ViewBuilder.buildEither(first: accessoryIcon!) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isIconNil = icon == nil ? true : false
		isDetailNil = detail == nil ? true : false
		isAccessoryIconNil = accessoryIcon == nil ? true : false
    }
}
