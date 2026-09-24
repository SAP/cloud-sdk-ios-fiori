// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct _KPIProgressItem<Kpi: View, Subtitle: View, Footnote: View> {
    @Environment(\.kpiModifier) private var kpiModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.isEnabled) var isEnabled
	@Environment(\.kpiProgressViewStyle) var kpiProgressViewStyle

    let _kpi: Kpi
	let _fraction: Double?
	let _subtitle: Subtitle
	let _footnote: Footnote
	@State var isPressed: Bool = false
	var action: (() -> Void)? = nil
    private var isModelInit: Bool = false
	private var isKpiNil: Bool = false
	private var isSubtitleNil: Bool = false
	private var isFootnoteNil: Bool = false

    public init(
        @ViewBuilder kpi: () -> Kpi,
		fraction: Double?,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote
        ) {
            self._kpi = kpi()
			self._fraction = fraction
			self._subtitle = subtitle()
			self._footnote = footnote()
    }

    @ViewBuilder var kpi: some View {
        if isModelInit {
            _kpi.modifier(kpiModifier.concat(Fiori._KPIProgressItem.kpi).concat(Fiori._KPIProgressItem.kpiCumulative))
        } else {
            _kpi.modifier(kpiModifier.concat(Fiori._KPIProgressItem.kpi))
        }
    }
	@ViewBuilder var subtitle: some View {
        if isModelInit {
            _subtitle.modifier(subtitleModifier.concat(Fiori._KPIProgressItem.subtitle).concat(Fiori._KPIProgressItem.subtitleCumulative))
        } else {
            _subtitle.modifier(subtitleModifier.concat(Fiori._KPIProgressItem.subtitle))
        }
    }
	@ViewBuilder var footnote: some View {
        if isModelInit {
            _footnote.modifier(footnoteModifier.concat(Fiori._KPIProgressItem.footnote).concat(Fiori._KPIProgressItem.footnoteCumulative))
        } else {
            _footnote.modifier(footnoteModifier.concat(Fiori._KPIProgressItem.footnote))
        }
    }
    
	var isKpiEmptyView: Bool {
        ((isModelInit && isKpiNil) || Kpi.self == EmptyView.self) ? true : false
    }

	var isSubtitleEmptyView: Bool {
        ((isModelInit && isSubtitleNil) || Subtitle.self == EmptyView.self) ? true : false
    }

	var isFootnoteEmptyView: Bool {
        ((isModelInit && isFootnoteNil) || Footnote.self == EmptyView.self) ? true : false
    }
}

extension _KPIProgressItem where Kpi == _ConditionalContent<Text, EmptyView>,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView> {

    public init(model: _KPIProgressItemModel) {
        self.init(kpi: model.kpi, fraction: model.fraction, subtitle: model.subtitle, footnote: model.footnote)
    }

    public init(kpi: String? = nil, fraction: Double? = nil, subtitle: String? = nil, footnote: String? = nil) {
        self._kpi = kpi != nil ? ViewBuilder.buildEither(first: Text(kpi!)) : ViewBuilder.buildEither(second: EmptyView())
		self._fraction = fraction
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isKpiNil = kpi == nil ? true : false
		isSubtitleNil = subtitle == nil ? true : false
		isFootnoteNil = footnote == nil ? true : false
    }
}
