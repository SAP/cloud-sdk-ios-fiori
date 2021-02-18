import SwiftUI

public extension TimelineGridItem where Status == EmptyView {
    init(
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

public extension TimelineGridItem where Timestamp == EmptyView {
    init(
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
