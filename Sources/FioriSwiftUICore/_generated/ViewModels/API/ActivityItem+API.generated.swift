// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct ActivityItem<Icon: View, Subtitle: View> {
    @Environment(\.iconModifier) private var iconModifier
	@Environment(\.subtitleModifier) private var subtitleModifier

    let _icon: Icon
	let _subtitle: Subtitle
	
    private var isModelInit: Bool = false
	private var isIconNil: Bool = false
	private var isSubtitleNil: Bool = false

    public init(
        @ViewBuilder icon: () -> Icon,
		@ViewBuilder subtitle: () -> Subtitle
        ) {
            self._icon = icon()
			self._subtitle = subtitle()
    }

    @ViewBuilder var icon: some View {
        if isModelInit {
            _icon.modifier(iconModifier.concat(Fiori.ActivityItem.icon).concat(Fiori.ActivityItem.iconCumulative))
        } else {
            _icon.modifier(iconModifier.concat(Fiori.ActivityItem.icon))
        }
    }
	@ViewBuilder var subtitle: some View {
        if isModelInit {
            _subtitle.modifier(subtitleModifier.concat(Fiori.ActivityItem.subtitle).concat(Fiori.ActivityItem.subtitleCumulative))
        } else {
            _subtitle.modifier(subtitleModifier.concat(Fiori.ActivityItem.subtitle))
        }
    }
    
	var isIconEmptyView: Bool {
        ((isModelInit && isIconNil) || Icon.self == EmptyView.self) ? true : false
    }

	var isSubtitleEmptyView: Bool {
        ((isModelInit && isSubtitleNil) || Subtitle.self == EmptyView.self) ? true : false
    }
}

extension ActivityItem where Icon == _ConditionalContent<Image, EmptyView>,
		Subtitle == _ConditionalContent<Text, EmptyView> {

    public init(model: ActivityItemModel) {
        self.init(icon: model.icon, subtitle: model.subtitle)
    }

    public init(icon: Image? = nil, subtitle: String? = nil) {
        self._icon = icon != nil ? ViewBuilder.buildEither(first: icon!) : ViewBuilder.buildEither(second: EmptyView())
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isIconNil = icon == nil ? true : false
		isSubtitleNil = subtitle == nil ? true : false
    }
}
