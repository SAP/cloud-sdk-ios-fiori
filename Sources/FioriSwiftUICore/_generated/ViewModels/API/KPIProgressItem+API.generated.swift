// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct KPIProgressItem<Kpi: View, Subtitle: View, Footnote: View> {
    @Environment(\.kpiModifier) private var kpiModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.footnoteModifier) private var footnoteModifier

    private let _kpi: Kpi
	private let _fraction: Double?
	private let _subtitle: Subtitle
	private let _footnote: Footnote
	
    private var isModelInit: Bool = false
	private var isKpiNil: Bool = false
	private var isSubtitleNil: Bool = false
	private var isFootnoteNil: Bool = false

    public init(
        @ViewBuilder kpi: @escaping () -> Kpi,
		fraction: Double?,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
        ) {
            self._kpi = kpi()
			self._fraction = fraction
			self._subtitle = subtitle()
			self._footnote = footnote()
    }

    @ViewBuilder var kpi: some View {
        if isModelInit {
            _kpi.modifier(kpiModifier.concat(Fiori.KPIProgressItem.kpi).concat(Fiori.KPIProgressItem.kpiCumulative))
        } else {
            _kpi.modifier(kpiModifier.concat(Fiori.KPIProgressItem.kpi))
        }
    }
	@ViewBuilder var subtitle: some View {
        if isModelInit {
            _subtitle.modifier(subtitleModifier.concat(Fiori.KPIProgressItem.subtitle).concat(Fiori.KPIProgressItem.subtitleCumulative))
        } else {
            _subtitle.modifier(subtitleModifier.concat(Fiori.KPIProgressItem.subtitle))
        }
    }
	@ViewBuilder var footnote: some View {
        if isModelInit {
            _footnote.modifier(footnoteModifier.concat(Fiori.KPIProgressItem.footnote).concat(Fiori.KPIProgressItem.footnoteCumulative))
        } else {
            _footnote.modifier(footnoteModifier.concat(Fiori.KPIProgressItem.footnote))
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

extension KPIProgressItem where Kpi == _ConditionalContent<Text, EmptyView>,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView> {

    public init(model: KPIProgressItemModel) {
        self.init(kpi: model.kpi_, fraction: model.fraction_, subtitle: model.subtitle_, footnote: model.footnote_)
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
