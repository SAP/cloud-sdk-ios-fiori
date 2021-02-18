// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension HeaderChart where Kpi == EmptyView {
    init(
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

public extension HeaderChart where Subtitle == EmptyView {
    init(
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

public extension HeaderChart where Trend == EmptyView {
    init(
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

public extension HeaderChart where Kpi == EmptyView, Subtitle == EmptyView {
    init(
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

public extension HeaderChart where Kpi == EmptyView, Trend == EmptyView {
    init(
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

public extension HeaderChart where Subtitle == EmptyView, Trend == EmptyView {
    init(
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
