// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct ChartFloorplan<Title: View, Subtitle: View, Status: View, ValueAxisTitle: View, SeriesTitles: View, CategoryAxisTitle: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.subtitleModifier) private var subtitleModifier
	@Environment(\.statusModifier) private var statusModifier
	@Environment(\.valueAxisTitleModifier) private var valueAxisTitleModifier
	@Environment(\.seriesTitlesModifier) private var seriesTitlesModifier
	@Environment(\.categoryAxisTitleModifier) private var categoryAxisTitleModifier

    private let _title: Title
	private let _subtitle: Subtitle
	private let _status: Status
	private let _valueAxisTitle: ValueAxisTitle
	private let _seriesTitles: SeriesTitles
	private let _categoryAxisTitle: CategoryAxisTitle
	
    private var isModelInit: Bool = false
	private var isSubtitleNil: Bool = false
	private var isStatusNil: Bool = false
	private var isValueAxisTitleNil: Bool = false
	private var isCategoryAxisTitleNil: Bool = false

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder valueAxisTitle: @escaping () -> ValueAxisTitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles,
		@ViewBuilder categoryAxisTitle: @escaping () -> CategoryAxisTitle
        ) {
            self._title = title()
			self._subtitle = subtitle()
			self._status = status()
			self._valueAxisTitle = valueAxisTitle()
			self._seriesTitles = seriesTitles()
			self._categoryAxisTitle = categoryAxisTitle()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.ChartFloorplan.title).concat(Fiori.ChartFloorplan.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.ChartFloorplan.title))
        }
    }
	@ViewBuilder var subtitle: some View {
        if isModelInit {
            _subtitle.modifier(subtitleModifier.concat(Fiori.ChartFloorplan.subtitle).concat(Fiori.ChartFloorplan.subtitleCumulative))
        } else {
            _subtitle.modifier(subtitleModifier.concat(Fiori.ChartFloorplan.subtitle))
        }
    }
	@ViewBuilder var status: some View {
        if isModelInit {
            _status.modifier(statusModifier.concat(Fiori.ChartFloorplan.status).concat(Fiori.ChartFloorplan.statusCumulative))
        } else {
            _status.modifier(statusModifier.concat(Fiori.ChartFloorplan.status))
        }
    }
	@ViewBuilder var valueAxisTitle: some View {
        if isModelInit {
            _valueAxisTitle.modifier(valueAxisTitleModifier.concat(Fiori.ChartFloorplan.valueAxisTitle).concat(Fiori.ChartFloorplan.valueAxisTitleCumulative))
        } else {
            _valueAxisTitle.modifier(valueAxisTitleModifier.concat(Fiori.ChartFloorplan.valueAxisTitle))
        }
    }
	@ViewBuilder var seriesTitles: some View {
        if isModelInit {
            _seriesTitles.modifier(seriesTitlesModifier.concat(Fiori.ChartFloorplan.seriesTitles).concat(Fiori.ChartFloorplan.seriesTitlesCumulative))
        } else {
            _seriesTitles.modifier(seriesTitlesModifier.concat(Fiori.ChartFloorplan.seriesTitles))
        }
    }
	@ViewBuilder var categoryAxisTitle: some View {
        if isModelInit {
            _categoryAxisTitle.modifier(categoryAxisTitleModifier.concat(Fiori.ChartFloorplan.categoryAxisTitle).concat(Fiori.ChartFloorplan.categoryAxisTitleCumulative))
        } else {
            _categoryAxisTitle.modifier(categoryAxisTitleModifier.concat(Fiori.ChartFloorplan.categoryAxisTitle))
        }
    }
    
	var isSubtitleEmptyView: Bool {
        ((isModelInit && isSubtitleNil) || Subtitle.self == EmptyView.self) ? true : false
    }

	var isStatusEmptyView: Bool {
        ((isModelInit && isStatusNil) || Status.self == EmptyView.self) ? true : false
    }

	var isValueAxisTitleEmptyView: Bool {
        ((isModelInit && isValueAxisTitleNil) || ValueAxisTitle.self == EmptyView.self) ? true : false
    }

	var isCategoryAxisTitleEmptyView: Bool {
        ((isModelInit && isCategoryAxisTitleNil) || CategoryAxisTitle.self == EmptyView.self) ? true : false
    }
}

extension ChartFloorplan where Title == Text,
		Subtitle == _ConditionalContent<Text, EmptyView>,
		Status == _ConditionalContent<Text, EmptyView>,
		ValueAxisTitle == _ConditionalContent<Text, EmptyView>,
		SeriesTitles == Text,
		CategoryAxisTitle == _ConditionalContent<Text, EmptyView> {

    public init(model: ChartFloorplanModel) {
        self.init(title: model.title_, subtitle: model.subtitle_, status: model.status_, valueAxisTitle: model.valueAxisTitle_, seriesTitles: model.seriesTitles_, categoryAxisTitle: model.categoryAxisTitle_)
    }

    public init(title: String, subtitle: String? = nil, status: String? = nil, valueAxisTitle: String? = nil, seriesTitles: [String] = [], categoryAxisTitle: String? = nil) {
        self._title = Text(title)
		self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._status = status != nil ? ViewBuilder.buildEither(first: Text(status!)) : ViewBuilder.buildEither(second: EmptyView())
		self._valueAxisTitle = valueAxisTitle != nil ? ViewBuilder.buildEither(first: Text(valueAxisTitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._seriesTitles = Text(seriesTitles.joined(separator: ", "))
		self._categoryAxisTitle = categoryAxisTitle != nil ? ViewBuilder.buildEither(first: Text(categoryAxisTitle!)) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isSubtitleNil = subtitle == nil ? true : false
		isStatusNil = status == nil ? true : false
		isValueAxisTitleNil = valueAxisTitle == nil ? true : false
		isCategoryAxisTitleNil = categoryAxisTitle == nil ? true : false
    }
}
