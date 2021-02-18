// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension CollectionItem where DetailImage == EmptyView {
    init(
        @ViewBuilder title: @escaping () -> Title,
        @ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            detailImage: { EmptyView() },
            title: title,
            subtitle: subtitle
        )
    }
}

public extension CollectionItem where Subtitle == EmptyView {
    init(
        @ViewBuilder detailImage: @escaping () -> DetailImage,
        @ViewBuilder title: @escaping () -> Title
    ) {
        self.init(
            detailImage: detailImage,
            title: title,
            subtitle: { EmptyView() }
        )
    }
}
