// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension CollectionItem where DetailImage == EmptyView {
    public init(
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

extension CollectionItem where Subtitle == EmptyView {
    public init(
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
