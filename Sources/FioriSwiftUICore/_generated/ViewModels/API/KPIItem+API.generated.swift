// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct KPIItem<Kpi: View, Subtitle: View> {
    @Environment(\.kpiModifier) private var kpiModifier
	@Environment(\.subtitleModifier) private var subtitleModifier

    private let _kpi: Kpi
	private let _subtitle: Subtitle
	var action: (() -> Void)? = nil
    public init(
        @ViewBuilder kpi: @escaping () -> Kpi,
		@ViewBuilder subtitle: @escaping () -> Subtitle
        ) {
            self._kpi = kpi()
			self._subtitle = subtitle()
    }

    var kpi: some View {
        _kpi.modifier(kpiModifier.concat(Fiori.KPIItem.kpi))
    }
	var subtitle: some View {
        _subtitle.modifier(subtitleModifier.concat(Fiori.KPIItem.subtitle))
    }
    
}

extension KPIItem where Kpi == _ConditionalContent<Text, EmptyView>,
		Subtitle == _ConditionalContent<Text, EmptyView> {

    public init(model: KPIItemModel) {
        self.init(kpi: model.kpi_, subtitle: model.subtitle_)
    }

    public init(kpi: String? = nil, subtitle: String? = nil) {
        self._kpi = kpi != nil ? ViewBuilder.buildEither(first: Text(kpi!)) : ViewBuilder.buildEither(second: EmptyView())
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
    }
}
