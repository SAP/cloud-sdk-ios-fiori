// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension EmptyStateView where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		image: Image? = nil,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			image: image,
			action: action
        )
    }
}

extension EmptyStateView where ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		image: Image? = nil
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			image: image,
			action: { EmptyView() }
        )
    }
}

extension EmptyStateView where DescriptionText == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		image: Image? = nil
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			image: image,
			action: { EmptyView() }
        )
    }
}
