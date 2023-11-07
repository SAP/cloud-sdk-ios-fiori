// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension KPIProgressItem where Kpi == EmptyView {
    public init(
    fraction: Double? = nil,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote
    ) {
        self.init(
            kpi: { EmptyView() },
			fraction: fraction,
			subtitle: subtitle,
			footnote: footnote
        )
    }
}

extension KPIProgressItem where Subtitle == EmptyView {
    public init(
    @ViewBuilder kpi: () -> Kpi,
		fraction: Double? = nil,
		@ViewBuilder footnote: () -> Footnote
    ) {
        self.init(
            kpi: kpi,
			fraction: fraction,
			subtitle: { EmptyView() },
			footnote: footnote
        )
    }
}

extension KPIProgressItem where Footnote == EmptyView {
    public init(
    @ViewBuilder kpi: () -> Kpi,
		fraction: Double? = nil,
		@ViewBuilder subtitle: () -> Subtitle
    ) {
        self.init(
            kpi: kpi,
			fraction: fraction,
			subtitle: subtitle,
			footnote: { EmptyView() }
        )
    }
}

extension KPIProgressItem where Kpi == EmptyView, Subtitle == EmptyView {
    public init(
    fraction: Double? = nil,
		@ViewBuilder footnote: () -> Footnote
    ) {
        self.init(
            kpi: { EmptyView() },
			fraction: fraction,
			subtitle: { EmptyView() },
			footnote: footnote
        )
    }
}

extension KPIProgressItem where Kpi == EmptyView, Footnote == EmptyView {
    public init(
    fraction: Double? = nil,
		@ViewBuilder subtitle: () -> Subtitle
    ) {
        self.init(
            kpi: { EmptyView() },
			fraction: fraction,
			subtitle: subtitle,
			footnote: { EmptyView() }
        )
    }
}

extension KPIProgressItem where Subtitle == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder kpi: () -> Kpi,
		fraction: Double? = nil
    ) {
        self.init(
            kpi: kpi,
			fraction: fraction,
			subtitle: { EmptyView() },
			footnote: { EmptyView() }
        )
    }
}

extension KPIProgressItem where Kpi == EmptyView, Subtitle == EmptyView, Footnote == EmptyView {
    public init(
    fraction: Double? = nil
    ) {
        self.init(
            kpi: { EmptyView() },
			fraction: fraction,
			subtitle: { EmptyView() },
			footnote: { EmptyView() }
        )
    }
}
