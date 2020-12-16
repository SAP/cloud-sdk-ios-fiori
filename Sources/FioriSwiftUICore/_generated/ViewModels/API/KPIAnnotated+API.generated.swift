// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct KPIAnnotated<Title: View, Subtitle: View, Icon: View, > {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.iconModifier) private var iconModifier
    
    
    private let _title: () -> Title
	private let _subtitle: () -> Subtitle
	private let _icon: () -> Icon

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
        ) {
            self._title = title
			self._subtitle = subtitle
			self._icon = icon
    }

    var title: some View {
        _title().modifier(titleModifier.concat(Fiori.KPIAnnotated.title))
    }
	var subtitle: some View {
        _subtitle().modifier(subtitleModifier.concat(Fiori.KPIAnnotated.subtitle))
    }
	var icon: some View {
        _icon().modifier(iconModifier.concat(Fiori.KPIAnnotated.icon))
    }
}

extension KPIAnnotated where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Icon == _ConditionalContent<Image, EmptyView> {
    
    public init(model: KPIAnnotatedModel) {
        self.init(title: model.title_, subtitle: model.subtitle_, icon: model.icon_)
    }

    public init(title: String, subtitle: String? = nil, icon: Image? = nil) {
        self._title = { Text(title) }
		self._subtitle = { subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView()) }
		self._icon = { icon != nil ? ViewBuilder.buildEither(first: icon!) : ViewBuilder.buildEither(second: EmptyView()) }
    }
} 
