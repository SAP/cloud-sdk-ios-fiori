// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension KPIAnnotated where Icon == EmptyView {
    init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
            subtitle: subtitle,
            icon: { EmptyView() }
        )
    }
}

public extension KPIAnnotated where Subtitle == EmptyView {
    init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
            subtitle: { EmptyView() },
            icon: icon
        )
    }
}
