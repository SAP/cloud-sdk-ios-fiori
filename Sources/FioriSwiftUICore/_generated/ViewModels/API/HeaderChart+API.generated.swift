// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct HeaderChart<Title: View, Subtitle: View, Trend: View, TrendImage: View, Kpi: View, Chart: View> {
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
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder trend: @escaping () -> Trend,
		@ViewBuilder trendImage: @escaping () -> TrendImage,
		@ViewBuilder kpi: @escaping () -> Kpi,
		@ViewBuilder chart: @escaping () -> Chart
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
	@ViewBuilder var trendImage: some View {
        if isModelInit {
            _trendImage.modifier(trendImageModifier.concat(Fiori.HeaderChart.trendImage).concat(Fiori.HeaderChart.trendImageCumulative))
        } else {
            _trendImage.modifier(trendImageModifier.concat(Fiori.HeaderChart.trendImage))
        }
    }
	@ViewBuilder var kpi: some View {
        if isModelInit {
            _kpi.modifier(kpiModifier.concat(Fiori.HeaderChart.kpi).concat(Fiori.HeaderChart.kpiCumulative))
        } else {
            _kpi.modifier(kpiModifier.concat(Fiori.HeaderChart.kpi))
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

extension HeaderChart where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Trend == _ConditionalContent<Text, EmptyView>,
		TrendImage == _ConditionalContent<Image, EmptyView>,
		Kpi == _ConditionalContent<Text, EmptyView> {

    public init(model: HeaderChartModel, @ViewBuilder chart: @escaping () -> Chart) {
        self.init(title: model.title_, subtitle: model.subtitle_, trend: model.trend_, trendImage: model.trendImage_, kpi: model.kpi_, chart: chart)
    }

    public init(title: String, subtitle: String? = nil, trend: String? = nil, trendImage: Image? = nil, kpi: String? = nil, @ViewBuilder chart: @escaping () -> Chart) {
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
