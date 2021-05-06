// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension HeaderChart where Kpi == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder trend: @escaping () -> Trend
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: trend,
			kpi: { EmptyView() }
        )
    }
}

extension HeaderChart where Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder trend: @escaping () -> Trend,
		@ViewBuilder kpi: @escaping () -> Kpi
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: trend,
			kpi: kpi
        )
    }
}

extension HeaderChart where Trend == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder kpi: @escaping () -> Kpi
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: { EmptyView() },
			kpi: kpi
        )
    }
}

extension HeaderChart where Kpi == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder trend: @escaping () -> Trend
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: trend,
			kpi: { EmptyView() }
        )
    }
}

extension HeaderChart where Kpi == EmptyView, Trend == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			subtitle: subtitle,
			trend: { EmptyView() },
			kpi: { EmptyView() }
        )
    }
}

extension HeaderChart where Subtitle == EmptyView, Trend == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder kpi: @escaping () -> Kpi
    ) {
        self.init(
            title: title,
			subtitle: { EmptyView() },
			trend: { EmptyView() },
			kpi: kpi
        )
    }
}
