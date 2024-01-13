// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension EmptyStateView where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder detailImage: () -> DetailImage,
		@ViewBuilder action: () -> ActionView,
        alignmentAxis: Axis = .vertical
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			detailImage: detailImage,
			action: action,
            alignmentAxis: alignmentAxis
        )
    }
}

extension EmptyStateView where DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder action: () -> ActionView,
        alignmentAxis: Axis = .vertical
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			detailImage: { EmptyView() },
			action: action,
            alignmentAxis: alignmentAxis
        )
    }
}

extension EmptyStateView where ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder detailImage: () -> DetailImage,
        alignmentAxis: Axis = .vertical
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			detailImage: detailImage,
			action: { EmptyView() },
            alignmentAxis: alignmentAxis
        )
    }
}

extension EmptyStateView where DescriptionText == EmptyView, DetailImage == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView,
        alignmentAxis: Axis = .vertical
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() },
			action: action,
            alignmentAxis: alignmentAxis
        )
    }
}

extension EmptyStateView where DescriptionText == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder detailImage: () -> DetailImage,
        alignmentAxis: Axis = .vertical
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			detailImage: detailImage,
			action: { EmptyView() },
            alignmentAxis: alignmentAxis
        )
    }
}

extension EmptyStateView where DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
        alignmentAxis: Axis = .vertical
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			detailImage: { EmptyView() },
			action: { EmptyView() },
            alignmentAxis: alignmentAxis
        )
    }
}

extension EmptyStateView where DescriptionText == EmptyView, DetailImage == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
        alignmentAxis: Axis = .vertical
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			detailImage: { EmptyView() },
			action: { EmptyView() },
            alignmentAxis: alignmentAxis
        )
    }
}
