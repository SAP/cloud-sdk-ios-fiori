// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension ChartFloorplan where CategoryAxisTitle == EmptyView {
    init(
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

public extension ChartFloorplan where Status == EmptyView {
    init(
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

public extension ChartFloorplan where Subtitle == EmptyView {
    init(
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

public extension ChartFloorplan where ValueAxisTitle == EmptyView {
    init(
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

public extension ChartFloorplan where CategoryAxisTitle == EmptyView, Status == EmptyView {
    init(
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

public extension ChartFloorplan where CategoryAxisTitle == EmptyView, Subtitle == EmptyView {
    init(
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

public extension ChartFloorplan where CategoryAxisTitle == EmptyView, ValueAxisTitle == EmptyView {
    init(
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

public extension ChartFloorplan where Status == EmptyView, Subtitle == EmptyView {
    init(
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

public extension ChartFloorplan where Status == EmptyView, ValueAxisTitle == EmptyView {
    init(
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

public extension ChartFloorplan where Subtitle == EmptyView, ValueAxisTitle == EmptyView {
    init(
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

public extension ChartFloorplan where CategoryAxisTitle == EmptyView, Status == EmptyView, Subtitle == EmptyView {
    init(
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

public extension ChartFloorplan where CategoryAxisTitle == EmptyView, Status == EmptyView, ValueAxisTitle == EmptyView {
    init(
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

public extension ChartFloorplan where CategoryAxisTitle == EmptyView, Subtitle == EmptyView, ValueAxisTitle == EmptyView {
    init(
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

public extension ChartFloorplan where Status == EmptyView, Subtitle == EmptyView, ValueAxisTitle == EmptyView {
    init(
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
