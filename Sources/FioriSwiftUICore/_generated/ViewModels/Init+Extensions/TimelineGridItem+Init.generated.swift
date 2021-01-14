// Generated using Sourcery 1.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftUI

extension TimelineGridItem where Status == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder timestamp: @escaping () -> Timestamp
        ) {
        self.init(
            title: title,
			timestamp: timestamp,
			status: { EmptyView() }
        )
    }
}

extension TimelineGridItem where Timestamp == EmptyView {
    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder status: @escaping () -> Status
        ) {
        self.init(
            title: title,
			timestamp: { EmptyView() },
			status: status
        )
    }
}
