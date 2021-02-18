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

    var title: some View {
        _title.modifier(titleModifier.concat(Fiori.ChartFloorplan.title))
    }

    var subtitle: some View {
        _subtitle.modifier(subtitleModifier.concat(Fiori.ChartFloorplan.subtitle))
    }

    var status: some View {
        _status.modifier(statusModifier.concat(Fiori.ChartFloorplan.status))
    }

    var valueAxisTitle: some View {
        _valueAxisTitle.modifier(valueAxisTitleModifier.concat(Fiori.ChartFloorplan.valueAxisTitle))
    }

    var seriesTitles: some View {
        _seriesTitles.modifier(seriesTitlesModifier.concat(Fiori.ChartFloorplan.seriesTitles))
    }

    var categoryAxisTitle: some View {
        _categoryAxisTitle.modifier(categoryAxisTitleModifier.concat(Fiori.ChartFloorplan.categoryAxisTitle))
    }
}

public extension ChartFloorplan where Title == Text,
    Subtitle == _ConditionalContent<Text, EmptyView>,
    Status == _ConditionalContent<Text, EmptyView>,
    ValueAxisTitle == _ConditionalContent<Text, EmptyView>,
    SeriesTitles == Text,
    CategoryAxisTitle == _ConditionalContent<Text, EmptyView>
{
    init(model: ChartFloorplanModel) {
        self.init(title: model.title_, subtitle: model.subtitle_, status: model.status_, valueAxisTitle: model.valueAxisTitle_, seriesTitles: model.seriesTitles_, categoryAxisTitle: model.categoryAxisTitle_)
    }

    init(title: String, subtitle: String? = nil, status: String? = nil, valueAxisTitle: String? = nil, seriesTitles: [String] = [], categoryAxisTitle: String? = nil) {
        self._title = Text(title)
        self._subtitle = subtitle != nil ? ViewBuilder.buildEither(first: Text(subtitle!)) : ViewBuilder.buildEither(second: EmptyView())
        self._status = status != nil ? ViewBuilder.buildEither(first: Text(status!)) : ViewBuilder.buildEither(second: EmptyView())
        self._valueAxisTitle = valueAxisTitle != nil ? ViewBuilder.buildEither(first: Text(valueAxisTitle!)) : ViewBuilder.buildEither(second: EmptyView())
        self._seriesTitles = Text(seriesTitles.joined(separator: ", "))
        self._categoryAxisTitle = categoryAxisTitle != nil ? ViewBuilder.buildEither(first: Text(categoryAxisTitle!)) : ViewBuilder.buildEither(second: EmptyView())
    }
}
