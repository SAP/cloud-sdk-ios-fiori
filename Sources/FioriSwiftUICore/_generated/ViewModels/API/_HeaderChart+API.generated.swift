// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct _HeaderChart<Title: View, Subtitle: View, Trend: View, TrendImage: View, Kpi: View, Chart: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.trendModifier) private var trendModifier
	@Environment(\.trendImageModifier) private var trendImageModifier
	@Environment(\.kpiModifier) private var kpiModifier

    let _title: Title
	let _subtitle: Subtitle
	let _trend: Trend
	let _trendImage: TrendImage
	let _kpi: Kpi
	let _chart: Chart
	@State var mainViewSize: CGSize = CGSize(width: 312, height: 0)
    private var isModelInit: Bool = false
	private var isSubtitleNil: Bool = false
	private var isTrendNil: Bool = false
	private var isTrendImageNil: Bool = false
	private var isKpiNil: Bool = false

    public init(
        @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder trend: () -> Trend,
		@ViewBuilder trendImage: () -> TrendImage,
		@ViewBuilder kpi: () -> Kpi,
		@ViewBuilder chart: () -> Chart
        ) {
            self._title = title()
			self._subtitle = subtitle()
			self._trend = trend()
			self._trendImage = trendImage()
			self._kpi = kpi()
			self._chart = chart()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori._HeaderChart.title).concat(Fiori._HeaderChart.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori._HeaderChart.title))
        }
    }
	@ViewBuilder var subtitle: some View {
        if isModelInit {
            _subtitle.modifier(subtitleModifier.concat(Fiori._HeaderChart.subtitle).concat(Fiori._HeaderChart.subtitleCumulative))
        } else {
            _subtitle.modifier(subtitleModifier.concat(Fiori._HeaderChart.subtitle))
        }
    }
	@ViewBuilder var trend: some View {
        if isModelInit {
            _trend.modifier(trendModifier.concat(Fiori._HeaderChart.trend).concat(Fiori._HeaderChart.trendCumulative))
        } else {
            _trend.modifier(trendModifier.concat(Fiori._HeaderChart.trend))
        }
    }
	@ViewBuilder var trendImage: some View {
        if isModelInit {
            _trendImage.modifier(trendImageModifier.concat(Fiori._HeaderChart.trendImage).concat(Fiori._HeaderChart.trendImageCumulative))
        } else {
            _trendImage.modifier(trendImageModifier.concat(Fiori._HeaderChart.trendImage))
        }
    }
	@ViewBuilder var kpi: some View {
        if isModelInit {
            _kpi.modifier(kpiModifier.concat(Fiori._HeaderChart.kpi).concat(Fiori._HeaderChart.kpiCumulative))
        } else {
            _kpi.modifier(kpiModifier.concat(Fiori._HeaderChart.kpi))
        }
    }
    var chart: some View {
        _chart
    }
	var isSubtitleEmptyView: Bool {
        ((isModelInit && isSubtitleNil) || Subtitle.self == EmptyView.self) ? true : false
    }

	var isTrendEmptyView: Bool {
        ((isModelInit && isTrendNil) || Trend.self == EmptyView.self) ? true : false
    }

	var isTrendImageEmptyView: Bool {
        ((isModelInit && isTrendImageNil) || TrendImage.self == EmptyView.self) ? true : false
    }

	var isKpiEmptyView: Bool {
        ((isModelInit && isKpiNil) || Kpi.self == EmptyView.self) ? true : false
    }
}

extension _HeaderChart where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Trend == _ConditionalContent<Text, EmptyView>,
		TrendImage == _ConditionalContent<Image, EmptyView>,
		Kpi == _ConditionalContent<Text, EmptyView> {

    public init(model: _HeaderChartModel, @ViewBuilder chart: () -> Chart) {
        self.init(title: model.title, subtitle: model.subtitle, trend: model.trend, trendImage: model.trendImage, kpi: model.kpi, chart: chart)
    }

    public init(title: String, subtitle: String? = nil, trend: String? = nil, trendImage: Image? = nil, kpi: String? = nil, @ViewBuilder chart: () -> Chart) {
        self._title = Text(title)
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._trend = trend != nil ? ViewBuilder.buildEither(first: Text(trend!)) : ViewBuilder.buildEither(second: EmptyView())
		self._trendImage = trendImage != nil ? ViewBuilder.buildEither(first: trendImage!) : ViewBuilder.buildEither(second: EmptyView())
		self._kpi = kpi != nil ? ViewBuilder.buildEither(first: Text(kpi!)) : ViewBuilder.buildEither(second: EmptyView())
		self._chart = chart()

		isModelInit = true
		isSubtitleNil = subtitle == nil ? true : false
		isTrendNil = trend == nil ? true : false
		isTrendImageNil = trendImage == nil ? true : false
		isKpiNil = kpi == nil ? true : false
    }
}
