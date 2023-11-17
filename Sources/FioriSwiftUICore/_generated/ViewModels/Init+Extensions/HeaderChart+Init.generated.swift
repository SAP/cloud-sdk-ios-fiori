// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension HeaderChart where Subtitle == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder trend: () -> Trend,
		@ViewBuilder trendImage: () -> TrendImage,
		@ViewBuilder kpi: () -> Kpi,
		@ViewBuilder chart: () -> Chart
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: trend,
			trendImage: trendImage,
			kpi: kpi,
			chart: chart
        )
    }
}

extension HeaderChart where Trend == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder trendImage: () -> TrendImage,
		@ViewBuilder kpi: () -> Kpi,
		@ViewBuilder chart: () -> Chart
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: { EmptyView() },
			trendImage: trendImage,
			kpi: kpi,
			chart: chart
        )
    }
}

extension HeaderChart where TrendImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder trend: () -> Trend,
		@ViewBuilder kpi: () -> Kpi,
		@ViewBuilder chart: () -> Chart
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: trend,
			trendImage: { EmptyView() },
			kpi: kpi,
			chart: chart
        )
    }
}

extension HeaderChart where Kpi == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder trend: () -> Trend,
		@ViewBuilder trendImage: () -> TrendImage,
		@ViewBuilder chart: () -> Chart
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: trend,
			trendImage: trendImage,
			kpi: { EmptyView() },
			chart: chart
        )
    }
}

extension HeaderChart where Chart == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder trend: () -> Trend,
		@ViewBuilder trendImage: () -> TrendImage,
		@ViewBuilder kpi: () -> Kpi
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: trend,
			trendImage: trendImage,
			kpi: kpi,
			chart: { EmptyView() }
        )
    }
}

extension HeaderChart where Subtitle == EmptyView, Trend == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder trendImage: () -> TrendImage,
		@ViewBuilder kpi: () -> Kpi,
		@ViewBuilder chart: () -> Chart
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: { EmptyView() },
			trendImage: trendImage,
			kpi: kpi,
			chart: chart
        )
    }
}

extension HeaderChart where Subtitle == EmptyView, TrendImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder trend: () -> Trend,
		@ViewBuilder kpi: () -> Kpi,
		@ViewBuilder chart: () -> Chart
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: trend,
			trendImage: { EmptyView() },
			kpi: kpi,
			chart: chart
        )
    }
}

extension HeaderChart where Subtitle == EmptyView, Kpi == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder trend: () -> Trend,
		@ViewBuilder trendImage: () -> TrendImage,
		@ViewBuilder chart: () -> Chart
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: trend,
			trendImage: trendImage,
			kpi: { EmptyView() },
			chart: chart
        )
    }
}

extension HeaderChart where Subtitle == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder trend: () -> Trend,
		@ViewBuilder trendImage: () -> TrendImage,
		@ViewBuilder kpi: () -> Kpi
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: trend,
			trendImage: trendImage,
			kpi: kpi,
			chart: { EmptyView() }
        )
    }
}

extension HeaderChart where Trend == EmptyView, TrendImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder kpi: () -> Kpi,
		@ViewBuilder chart: () -> Chart
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: { EmptyView() },
			trendImage: { EmptyView() },
			kpi: kpi,
			chart: chart
        )
    }
}

extension HeaderChart where Trend == EmptyView, Kpi == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder trendImage: () -> TrendImage,
		@ViewBuilder chart: () -> Chart
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: { EmptyView() },
			trendImage: trendImage,
			kpi: { EmptyView() },
			chart: chart
        )
    }
}

extension HeaderChart where Trend == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder trendImage: () -> TrendImage,
		@ViewBuilder kpi: () -> Kpi
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: { EmptyView() },
			trendImage: trendImage,
			kpi: kpi,
			chart: { EmptyView() }
        )
    }
}

extension HeaderChart where TrendImage == EmptyView, Kpi == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder trend: () -> Trend,
		@ViewBuilder chart: () -> Chart
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: trend,
			trendImage: { EmptyView() },
			kpi: { EmptyView() },
			chart: chart
        )
    }
}

extension HeaderChart where TrendImage == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder trend: () -> Trend,
		@ViewBuilder kpi: () -> Kpi
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: trend,
			trendImage: { EmptyView() },
			kpi: kpi,
			chart: { EmptyView() }
        )
    }
}

extension HeaderChart where Kpi == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder trend: () -> Trend,
		@ViewBuilder trendImage: () -> TrendImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: trend,
			trendImage: trendImage,
			kpi: { EmptyView() },
			chart: { EmptyView() }
        )
    }
}

extension HeaderChart where Subtitle == EmptyView, Trend == EmptyView, TrendImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder kpi: () -> Kpi,
		@ViewBuilder chart: () -> Chart
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: { EmptyView() },
			trendImage: { EmptyView() },
			kpi: kpi,
			chart: chart
        )
    }
}

extension HeaderChart where Subtitle == EmptyView, Trend == EmptyView, Kpi == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder trendImage: () -> TrendImage,
		@ViewBuilder chart: () -> Chart
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: { EmptyView() },
			trendImage: trendImage,
			kpi: { EmptyView() },
			chart: chart
        )
    }
}

extension HeaderChart where Subtitle == EmptyView, Trend == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder trendImage: () -> TrendImage,
		@ViewBuilder kpi: () -> Kpi
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: { EmptyView() },
			trendImage: trendImage,
			kpi: kpi,
			chart: { EmptyView() }
        )
    }
}

extension HeaderChart where Subtitle == EmptyView, TrendImage == EmptyView, Kpi == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder trend: () -> Trend,
		@ViewBuilder chart: () -> Chart
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: trend,
			trendImage: { EmptyView() },
			kpi: { EmptyView() },
			chart: chart
        )
    }
}

extension HeaderChart where Subtitle == EmptyView, TrendImage == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder trend: () -> Trend,
		@ViewBuilder kpi: () -> Kpi
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: trend,
			trendImage: { EmptyView() },
			kpi: kpi,
			chart: { EmptyView() }
        )
    }
}

extension HeaderChart where Subtitle == EmptyView, Kpi == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder trend: () -> Trend,
		@ViewBuilder trendImage: () -> TrendImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: trend,
			trendImage: trendImage,
			kpi: { EmptyView() },
			chart: { EmptyView() }
        )
    }
}

extension HeaderChart where Trend == EmptyView, TrendImage == EmptyView, Kpi == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder chart: () -> Chart
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: { EmptyView() },
			trendImage: { EmptyView() },
			kpi: { EmptyView() },
			chart: chart
        )
    }
}

extension HeaderChart where Trend == EmptyView, TrendImage == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder kpi: () -> Kpi
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: { EmptyView() },
			trendImage: { EmptyView() },
			kpi: kpi,
			chart: { EmptyView() }
        )
    }
}

extension HeaderChart where Trend == EmptyView, Kpi == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder trendImage: () -> TrendImage
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: { EmptyView() },
			trendImage: trendImage,
			kpi: { EmptyView() },
			chart: { EmptyView() }
        )
    }
}

extension HeaderChart where TrendImage == EmptyView, Kpi == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder trend: () -> Trend
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: trend,
			trendImage: { EmptyView() },
			kpi: { EmptyView() },
			chart: { EmptyView() }
        )
    }
}

extension HeaderChart where Subtitle == EmptyView, Trend == EmptyView, TrendImage == EmptyView, Kpi == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder chart: () -> Chart
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: { EmptyView() },
			trendImage: { EmptyView() },
			kpi: { EmptyView() },
			chart: chart
        )
    }
}

extension HeaderChart where Subtitle == EmptyView, Trend == EmptyView, TrendImage == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder kpi: () -> Kpi
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: { EmptyView() },
			trendImage: { EmptyView() },
			kpi: kpi,
			chart: { EmptyView() }
        )
    }
}

extension HeaderChart where Subtitle == EmptyView, Trend == EmptyView, Kpi == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder trendImage: () -> TrendImage
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: { EmptyView() },
			trendImage: trendImage,
			kpi: { EmptyView() },
			chart: { EmptyView() }
        )
    }
}

extension HeaderChart where Subtitle == EmptyView, TrendImage == EmptyView, Kpi == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder trend: () -> Trend
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: trend,
			trendImage: { EmptyView() },
			kpi: { EmptyView() },
			chart: { EmptyView() }
        )
    }
}

extension HeaderChart where Trend == EmptyView, TrendImage == EmptyView, Kpi == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: { EmptyView() },
			trendImage: { EmptyView() },
			kpi: { EmptyView() },
			chart: { EmptyView() }
        )
    }
}

extension HeaderChart where Subtitle == EmptyView, Trend == EmptyView, TrendImage == EmptyView, Kpi == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: () -> Title
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: { EmptyView() },
			trendImage: { EmptyView() },
			kpi: { EmptyView() },
			chart: { EmptyView() }
        )
    }
}
