// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension KPIAnnotated where Icon == EmptyView {
    public init(
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

extension KPIAnnotated where Subtitle == EmptyView {
    public init(
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
