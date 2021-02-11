// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

extension ActivityItem where Icon == EmptyView {
    public init(
    @ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            icon: { EmptyView() },
			subtitle: subtitle
        )
    }
}

extension ActivityItem where Subtitle == EmptyView {
    public init(
    @ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            icon: icon,
			subtitle: { EmptyView() }
        )
    }
}
