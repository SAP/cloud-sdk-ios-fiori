// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension KPIItem where Kpi == EmptyView {
    public init(
    @ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            kpi: { EmptyView() },
			subtitle: subtitle
        )
    }
}

extension KPIItem where Subtitle == EmptyView {
    public init(
    @ViewBuilder kpi: @escaping () -> Kpi
    ) {
        self.init(
            kpi: kpi,
			subtitle: { EmptyView() }
        )
    }
}
