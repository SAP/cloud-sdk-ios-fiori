// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension HeaderChart where Kpi == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder trend: @escaping () -> Trend,
		@ViewBuilder trendImage: @escaping () -> TrendImage,
		@ViewBuilder chart: @escaping () -> Chart
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

extension HeaderChart where Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder trend: @escaping () -> Trend,
		@ViewBuilder trendImage: @escaping () -> TrendImage,
		@ViewBuilder kpi: @escaping () -> Kpi,
		@ViewBuilder chart: @escaping () -> Chart
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
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder trendImage: @escaping () -> TrendImage,
		@ViewBuilder kpi: @escaping () -> Kpi,
		@ViewBuilder chart: @escaping () -> Chart
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
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder trend: @escaping () -> Trend,
		@ViewBuilder kpi: @escaping () -> Kpi,
		@ViewBuilder chart: @escaping () -> Chart
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

extension HeaderChart where Chart == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder trend: @escaping () -> Trend,
		@ViewBuilder trendImage: @escaping () -> TrendImage,
		@ViewBuilder kpi: @escaping () -> Kpi
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

extension HeaderChart where Kpi == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder trend: @escaping () -> Trend,
		@ViewBuilder trendImage: @escaping () -> TrendImage,
		@ViewBuilder chart: @escaping () -> Chart
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

extension HeaderChart where Kpi == EmptyView, Trend == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder trendImage: @escaping () -> TrendImage,
		@ViewBuilder chart: @escaping () -> Chart
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

extension HeaderChart where Kpi == EmptyView, TrendImage == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder trend: @escaping () -> Trend,
		@ViewBuilder chart: @escaping () -> Chart
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

extension HeaderChart where Kpi == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder trend: @escaping () -> Trend,
		@ViewBuilder trendImage: @escaping () -> TrendImage
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

extension HeaderChart where Subtitle == EmptyView, Trend == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder trendImage: @escaping () -> TrendImage,
		@ViewBuilder kpi: @escaping () -> Kpi,
		@ViewBuilder chart: @escaping () -> Chart
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
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder trend: @escaping () -> Trend,
		@ViewBuilder kpi: @escaping () -> Kpi,
		@ViewBuilder chart: @escaping () -> Chart
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

extension HeaderChart where Subtitle == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder trend: @escaping () -> Trend,
		@ViewBuilder trendImage: @escaping () -> TrendImage,
		@ViewBuilder kpi: @escaping () -> Kpi
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
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder kpi: @escaping () -> Kpi,
		@ViewBuilder chart: @escaping () -> Chart
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

extension HeaderChart where Trend == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder trendImage: @escaping () -> TrendImage,
		@ViewBuilder kpi: @escaping () -> Kpi
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

extension HeaderChart where TrendImage == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder trend: @escaping () -> Trend,
		@ViewBuilder kpi: @escaping () -> Kpi
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

extension HeaderChart where Kpi == EmptyView, Subtitle == EmptyView, Trend == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder trendImage: @escaping () -> TrendImage,
		@ViewBuilder chart: @escaping () -> Chart
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

extension HeaderChart where Kpi == EmptyView, Subtitle == EmptyView, TrendImage == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder trend: @escaping () -> Trend,
		@ViewBuilder chart: @escaping () -> Chart
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

extension HeaderChart where Kpi == EmptyView, Subtitle == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder trend: @escaping () -> Trend,
		@ViewBuilder trendImage: @escaping () -> TrendImage
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

extension HeaderChart where Kpi == EmptyView, Trend == EmptyView, TrendImage == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder chart: @escaping () -> Chart
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

extension HeaderChart where Kpi == EmptyView, Trend == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder trendImage: @escaping () -> TrendImage
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

extension HeaderChart where Kpi == EmptyView, TrendImage == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder trend: @escaping () -> Trend
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

extension HeaderChart where Subtitle == EmptyView, Trend == EmptyView, TrendImage == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder kpi: @escaping () -> Kpi,
		@ViewBuilder chart: @escaping () -> Chart
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

extension HeaderChart where Subtitle == EmptyView, Trend == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder trendImage: @escaping () -> TrendImage,
		@ViewBuilder kpi: @escaping () -> Kpi
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

extension HeaderChart where Subtitle == EmptyView, TrendImage == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder trend: @escaping () -> Trend,
		@ViewBuilder kpi: @escaping () -> Kpi
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

extension HeaderChart where Trend == EmptyView, TrendImage == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder kpi: @escaping () -> Kpi
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

extension HeaderChart where Kpi == EmptyView, Subtitle == EmptyView, Trend == EmptyView, TrendImage == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder chart: @escaping () -> Chart
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

extension HeaderChart where Kpi == EmptyView, Subtitle == EmptyView, Trend == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder trendImage: @escaping () -> TrendImage
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

extension HeaderChart where Kpi == EmptyView, Subtitle == EmptyView, TrendImage == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder trend: @escaping () -> Trend
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

extension HeaderChart where Kpi == EmptyView, Trend == EmptyView, TrendImage == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
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

extension HeaderChart where Subtitle == EmptyView, Trend == EmptyView, TrendImage == EmptyView, Chart == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder kpi: @escaping () -> Kpi
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
