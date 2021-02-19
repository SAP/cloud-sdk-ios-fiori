// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension ActivityItem where Icon == EmptyView {
    init(
        @ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            icon: { EmptyView() },
            subtitle: subtitle
        )
    }
}

public extension ActivityItem where Subtitle == EmptyView {
    init(
        @ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            icon: icon,
            subtitle: { EmptyView() }
        )
    }
}
