// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

extension ChartFloorplan where CategoryAxisTitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder valueAxisTitle: @escaping () -> ValueAxisTitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			status: status,
			valueAxisTitle: valueAxisTitle,
			seriesTitles: seriesTitles,
			categoryAxisTitle: { EmptyView() }
        )
    }
}

extension ChartFloorplan where Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder valueAxisTitle: @escaping () -> ValueAxisTitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles,
		@ViewBuilder categoryAxisTitle: @escaping () -> CategoryAxisTitle
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			status: { EmptyView() },
			valueAxisTitle: valueAxisTitle,
			seriesTitles: seriesTitles,
			categoryAxisTitle: categoryAxisTitle
        )
    }
}

extension ChartFloorplan where Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder valueAxisTitle: @escaping () -> ValueAxisTitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles,
		@ViewBuilder categoryAxisTitle: @escaping () -> CategoryAxisTitle
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			status: status,
			valueAxisTitle: valueAxisTitle,
			seriesTitles: seriesTitles,
			categoryAxisTitle: categoryAxisTitle
        )
    }
}

extension ChartFloorplan where ValueAxisTitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles,
		@ViewBuilder categoryAxisTitle: @escaping () -> CategoryAxisTitle
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			status: status,
			valueAxisTitle: { EmptyView() },
			seriesTitles: seriesTitles,
			categoryAxisTitle: categoryAxisTitle
        )
    }
}

extension ChartFloorplan where CategoryAxisTitle == EmptyView, Status == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder valueAxisTitle: @escaping () -> ValueAxisTitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			status: { EmptyView() },
			valueAxisTitle: valueAxisTitle,
			seriesTitles: seriesTitles,
			categoryAxisTitle: { EmptyView() }
        )
    }
}

extension ChartFloorplan where CategoryAxisTitle == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder valueAxisTitle: @escaping () -> ValueAxisTitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			status: status,
			valueAxisTitle: valueAxisTitle,
			seriesTitles: seriesTitles,
			categoryAxisTitle: { EmptyView() }
        )
    }
}

extension ChartFloorplan where CategoryAxisTitle == EmptyView, ValueAxisTitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			status: status,
			valueAxisTitle: { EmptyView() },
			seriesTitles: seriesTitles,
			categoryAxisTitle: { EmptyView() }
        )
    }
}

extension ChartFloorplan where Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder valueAxisTitle: @escaping () -> ValueAxisTitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles,
		@ViewBuilder categoryAxisTitle: @escaping () -> CategoryAxisTitle
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			status: { EmptyView() },
			valueAxisTitle: valueAxisTitle,
			seriesTitles: seriesTitles,
			categoryAxisTitle: categoryAxisTitle
        )
    }
}

extension ChartFloorplan where Status == EmptyView, ValueAxisTitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles,
		@ViewBuilder categoryAxisTitle: @escaping () -> CategoryAxisTitle
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			status: { EmptyView() },
			valueAxisTitle: { EmptyView() },
			seriesTitles: seriesTitles,
			categoryAxisTitle: categoryAxisTitle
        )
    }
}

extension ChartFloorplan where Subtitle == EmptyView, ValueAxisTitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles,
		@ViewBuilder categoryAxisTitle: @escaping () -> CategoryAxisTitle
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			status: status,
			valueAxisTitle: { EmptyView() },
			seriesTitles: seriesTitles,
			categoryAxisTitle: categoryAxisTitle
        )
    }
}

extension ChartFloorplan where CategoryAxisTitle == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder valueAxisTitle: @escaping () -> ValueAxisTitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			status: { EmptyView() },
			valueAxisTitle: valueAxisTitle,
			seriesTitles: seriesTitles,
			categoryAxisTitle: { EmptyView() }
        )
    }
}

extension ChartFloorplan where CategoryAxisTitle == EmptyView, Status == EmptyView, ValueAxisTitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			status: { EmptyView() },
			valueAxisTitle: { EmptyView() },
			seriesTitles: seriesTitles,
			categoryAxisTitle: { EmptyView() }
        )
    }
}

extension ChartFloorplan where CategoryAxisTitle == EmptyView, Subtitle == EmptyView, ValueAxisTitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			status: status,
			valueAxisTitle: { EmptyView() },
			seriesTitles: seriesTitles,
			categoryAxisTitle: { EmptyView() }
        )
    }
}

extension ChartFloorplan where Status == EmptyView, Subtitle == EmptyView, ValueAxisTitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder seriesTitles: @escaping () -> SeriesTitles,
		@ViewBuilder categoryAxisTitle: @escaping () -> CategoryAxisTitle
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			status: { EmptyView() },
			valueAxisTitle: { EmptyView() },
			seriesTitles: seriesTitles,
			categoryAxisTitle: categoryAxisTitle
        )
    }
}
