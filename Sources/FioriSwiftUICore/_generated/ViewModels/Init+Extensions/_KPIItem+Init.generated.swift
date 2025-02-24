// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension _KPIItem where Kpi == EmptyView {
    public init(
    @ViewBuilder subtitle: () -> Subtitle
    ) {
        self.init(
            kpi: { EmptyView() },
			subtitle: subtitle
        )
    }
}

extension _KPIItem where Subtitle == EmptyView {
    public init(
    @ViewBuilder kpi: () -> Kpi
    ) {
        self.init(
            kpi: kpi,
			subtitle: { EmptyView() }
        )
    }
}

extension _KPIItem where Kpi == EmptyView, Subtitle == EmptyView {
    public init(
    
    ) {
        self.init(
            kpi: { EmptyView() },
			subtitle: { EmptyView() }
        )
    }
}
