// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension KPIItem where Kpi == EmptyView {
    public init(
    @ViewBuilder subtitle: () -> Subtitle
    ) {
        self.init(
            kpi: { EmptyView() },
			subtitle: subtitle
        )
    }
}

extension KPIItem where Subtitle == EmptyView {
    public init(
    @ViewBuilder kpi: () -> Kpi
    ) {
        self.init(
            kpi: kpi,
			subtitle: { EmptyView() }
        )
    }
}

extension KPIItem where Kpi == EmptyView, Subtitle == EmptyView {
    public init(
    
    ) {
        self.init(
            kpi: { EmptyView() },
			subtitle: { EmptyView() }
        )
    }
}
