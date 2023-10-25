// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension InfoView where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder progressIndicator: () -> ProgressIndicatorView,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			progressIndicator: progressIndicator,
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension InfoView where ProgressIndicatorView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			progressIndicator: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension InfoView where ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder progressIndicator: () -> ProgressIndicatorView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			progressIndicator: progressIndicator,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension InfoView where SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder progressIndicator: () -> ProgressIndicatorView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			progressIndicator: progressIndicator,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension InfoView where DescriptionText == EmptyView, ProgressIndicatorView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			progressIndicator: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension InfoView where DescriptionText == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder progressIndicator: () -> ProgressIndicatorView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			progressIndicator: progressIndicator,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension InfoView where DescriptionText == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder progressIndicator: () -> ProgressIndicatorView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			progressIndicator: progressIndicator,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension InfoView where ProgressIndicatorView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			progressIndicator: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension InfoView where ProgressIndicatorView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			progressIndicator: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension InfoView where ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder progressIndicator: () -> ProgressIndicatorView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			progressIndicator: progressIndicator,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension InfoView where DescriptionText == EmptyView, ProgressIndicatorView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			progressIndicator: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension InfoView where DescriptionText == EmptyView, ProgressIndicatorView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			progressIndicator: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension InfoView where DescriptionText == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder progressIndicator: () -> ProgressIndicatorView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			progressIndicator: progressIndicator,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension InfoView where ProgressIndicatorView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			progressIndicator: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension InfoView where DescriptionText == EmptyView, ProgressIndicatorView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			progressIndicator: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}
