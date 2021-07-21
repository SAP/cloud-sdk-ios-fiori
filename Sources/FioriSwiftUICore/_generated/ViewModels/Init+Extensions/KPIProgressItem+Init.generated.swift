// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension KPIProgressItem where Footnote == EmptyView {
    public init(
    @ViewBuilder kpi: @escaping () -> Kpi,
		fraction: Double?,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            kpi: kpi,
			fraction: fraction,
			subtitle: subtitle,
			footnote: { EmptyView() }
        )
    }
}

extension KPIProgressItem where Kpi == EmptyView {
    public init(
    fraction: Double?,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
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
    @ViewBuilder kpi: @escaping () -> Kpi,
		fraction: Double?,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            kpi: kpi,
			fraction: fraction,
			subtitle: { EmptyView() },
			footnote: footnote
        )
    }
}

extension KPIProgressItem where Footnote == EmptyView, Kpi == EmptyView {
    public init(
    fraction: Double?,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            kpi: { EmptyView() },
			fraction: fraction,
			subtitle: subtitle,
			footnote: { EmptyView() }
        )
    }
}

extension KPIProgressItem where Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder kpi: @escaping () -> Kpi,
		fraction: Double?
    ) {
        self.init(
            kpi: kpi,
			fraction: fraction,
			subtitle: { EmptyView() },
			footnote: { EmptyView() }
        )
    }
}

extension KPIProgressItem where Kpi == EmptyView, Subtitle == EmptyView {
    public init(
    fraction: Double?,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            kpi: { EmptyView() },
			fraction: fraction,
			subtitle: { EmptyView() },
			footnote: footnote
        )
    }
}
