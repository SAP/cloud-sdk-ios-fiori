// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct HeaderChart<Title: View, Subtitle: View, Trend: View, Kpi: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.trendModifier) private var trendModifier
	@Environment(\.kpiModifier) private var kpiModifier

    let _title: Title
	let _subtitle: Subtitle
	let _trend: Trend
	let _kpi: Kpi
	
    private var isModelInit: Bool = false
	private var isSubtitleNil: Bool = false
	private var isTrendNil: Bool = false
	private var isKpiNil: Bool = false

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder trend: @escaping () -> Trend,
		@ViewBuilder kpi: @escaping () -> Kpi
        ) {
            self._title = title()
			self._subtitle = subtitle()
			self._trend = trend()
			self._kpi = kpi()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.HeaderChart.title).concat(Fiori.HeaderChart.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.HeaderChart.title))
        }
    }
	@ViewBuilder var subtitle: some View {
        if isModelInit {
            _subtitle.modifier(subtitleModifier.concat(Fiori.HeaderChart.subtitle).concat(Fiori.HeaderChart.subtitleCumulative))
        } else {
            _subtitle.modifier(subtitleModifier.concat(Fiori.HeaderChart.subtitle))
        }
    }
	@ViewBuilder var trend: some View {
        if isModelInit {
            _trend.modifier(trendModifier.concat(Fiori.HeaderChart.trend).concat(Fiori.HeaderChart.trendCumulative))
        } else {
            _trend.modifier(trendModifier.concat(Fiori.HeaderChart.trend))
        }
    }
	@ViewBuilder var kpi: some View {
        if isModelInit {
            _kpi.modifier(kpiModifier.concat(Fiori.HeaderChart.kpi).concat(Fiori.HeaderChart.kpiCumulative))
        } else {
            _kpi.modifier(kpiModifier.concat(Fiori.HeaderChart.kpi))
        }
    }
    
	var isSubtitleEmptyView: Bool {
        ((isModelInit && isSubtitleNil) || Subtitle.self == EmptyView.self) ? true : false
    }

	var isTrendEmptyView: Bool {
        ((isModelInit && isTrendNil) || Trend.self == EmptyView.self) ? true : false
    }

	var isKpiEmptyView: Bool {
        ((isModelInit && isKpiNil) || Kpi.self == EmptyView.self) ? true : false
    }
}

extension HeaderChart where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Trend == _ConditionalContent<Text, EmptyView>,
		Kpi == _ConditionalContent<Text, EmptyView> {

    public init(model: HeaderChartModel) {
        self.init(title: model.title_, subtitle: model.subtitle_, trend: model.trend_, kpi: model.kpi_)
    }

    public init(title: String, subtitle: String? = nil, trend: String? = nil, kpi: String? = nil) {
        self._title = Text(title)
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._trend = trend != nil ? ViewBuilder.buildEither(first: Text(trend!)) : ViewBuilder.buildEither(second: EmptyView())
		self._kpi = kpi != nil ? ViewBuilder.buildEither(first: Text(kpi!)) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isSubtitleNil = subtitle == nil ? true : false
		isTrendNil = trend == nil ? true : false
		isKpiNil = kpi == nil ? true : false
    }
}
