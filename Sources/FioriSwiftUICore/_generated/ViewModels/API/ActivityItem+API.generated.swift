// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct ActivityItem<Icon: View, Subtitle: View> {
    @Environment(\.iconModifier) private var iconModifier
	@Environment(\.subtitleModifier) private var subtitleModifier

    private let _icon: Icon
	private let _subtitle: Subtitle
	
    private var isModelInit: Bool = false
	private var isIconNil: Bool = false
	private var isSubtitleNil: Bool = false

    public init(
        @ViewBuilder icon: @escaping () -> Icon,
		@ViewBuilder subtitle: @escaping () -> Subtitle
        ) {
            self._icon = icon()
			self._subtitle = subtitle()
    }

    var icon: some View {
        _icon.modifier(iconModifier.concat(Fiori.ActivityItem.icon))
    }
	var subtitle: some View {
        _subtitle.modifier(subtitleModifier.concat(Fiori.ActivityItem.subtitle))
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
        self.init(icon: model.icon_, subtitle: model.subtitle_)
    }

    public init(icon: Image? = nil, subtitle: String? = nil) {
        self._icon = icon != nil ? ViewBuilder.buildEither(first: icon!) : ViewBuilder.buildEither(second: EmptyView())
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isIconNil = icon == nil ? true : false
		isSubtitleNil = subtitle == nil ? true : false
    }
}
