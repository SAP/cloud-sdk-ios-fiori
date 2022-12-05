// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension EmptyStateView where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			detailImage: detailImage,
			action: action
        )
    }
}

extension EmptyStateView where DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			detailImage: { EmptyView() },
			action: action
        )
    }
}

extension EmptyStateView where ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			detailImage: detailImage,
			action: { EmptyView() }
        )
    }
}

extension EmptyStateView where DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() },
			action: action
        )
    }
}

extension EmptyStateView where DescriptionText == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder detailImage: () -> DetailImage
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			detailImage: detailImage,
			action: { EmptyView() }
        )
    }
}

extension EmptyStateView where DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			detailImage: { EmptyView() },
			action: { EmptyView() }
        )
    }
}

extension EmptyStateView where DescriptionText == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() },
			action: { EmptyView() }
        )
    }
}
