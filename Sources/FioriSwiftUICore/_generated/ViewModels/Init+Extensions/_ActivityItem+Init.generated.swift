// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension _ActivityItem where Icon == EmptyView {
    public init(
    @ViewBuilder subtitle: () -> Subtitle
    ) {
        self.init(
            icon: { EmptyView() },
			subtitle: subtitle
        )
    }
}

extension _ActivityItem where Subtitle == EmptyView {
    public init(
    @ViewBuilder icon: () -> Icon
    ) {
        self.init(
            icon: icon,
			subtitle: { EmptyView() }
        )
    }
}

extension _ActivityItem where Icon == EmptyView, Subtitle == EmptyView {
    public init(
    
    ) {
        self.init(
            icon: { EmptyView() },
			subtitle: { EmptyView() }
        )
    }
}
