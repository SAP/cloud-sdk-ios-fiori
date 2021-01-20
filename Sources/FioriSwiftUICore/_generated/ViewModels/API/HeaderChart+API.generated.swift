// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

public struct HeaderChart<Title: View, Subtitle: View, Trend: View, Kpi: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.trendModifier) private var trendModifier
	@Environment(\.kpiModifier) private var kpiModifier

    private let _title: Title
	private let _subtitle: Subtitle
	private let _trend: Trend
	private let _kpi: Kpi 

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

    var title: some View {
        _title.modifier(titleModifier.concat(Fiori.HeaderChart.title))
    }
	var subtitle: some View {
        _subtitle.modifier(subtitleModifier.concat(Fiori.HeaderChart.subtitle))
    }
	var trend: some View {
        _trend.modifier(trendModifier.concat(Fiori.HeaderChart.trend))
    }
	var kpi: some View {
        _kpi.modifier(kpiModifier.concat(Fiori.HeaderChart.kpi))
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
    }
} 
