// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension InfoView where ActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder progressIndicatorText: @escaping () -> ProgressIndicatorText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			progressIndicatorText: progressIndicatorText,
			actionText: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension InfoView where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder progressIndicatorText: @escaping () -> ProgressIndicatorText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			progressIndicatorText: progressIndicatorText,
			actionText: actionText,
			secondaryActionText: secondaryActionText
        )
    }
}

extension InfoView where ProgressIndicatorText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			progressIndicatorText: { EmptyView() },
			actionText: actionText,
			secondaryActionText: secondaryActionText
        )
    }
}

extension InfoView where SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder progressIndicatorText: @escaping () -> ProgressIndicatorText,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			progressIndicatorText: progressIndicatorText,
			actionText: actionText,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension InfoView where ActionText == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder progressIndicatorText: @escaping () -> ProgressIndicatorText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			progressIndicatorText: progressIndicatorText,
			actionText: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension InfoView where ActionText == EmptyView, ProgressIndicatorText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			progressIndicatorText: { EmptyView() },
			actionText: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension InfoView where ActionText == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder progressIndicatorText: @escaping () -> ProgressIndicatorText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			progressIndicatorText: progressIndicatorText,
			actionText: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension InfoView where DescriptionText == EmptyView, ProgressIndicatorText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			progressIndicatorText: { EmptyView() },
			actionText: actionText,
			secondaryActionText: secondaryActionText
        )
    }
}

extension InfoView where DescriptionText == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder progressIndicatorText: @escaping () -> ProgressIndicatorText,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			progressIndicatorText: progressIndicatorText,
			actionText: actionText,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension InfoView where ProgressIndicatorText == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			progressIndicatorText: { EmptyView() },
			actionText: actionText,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension InfoView where ActionText == EmptyView, DescriptionText == EmptyView, ProgressIndicatorText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			progressIndicatorText: { EmptyView() },
			actionText: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension InfoView where ActionText == EmptyView, DescriptionText == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder progressIndicatorText: @escaping () -> ProgressIndicatorText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			progressIndicatorText: progressIndicatorText,
			actionText: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension InfoView where ActionText == EmptyView, ProgressIndicatorText == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			progressIndicatorText: { EmptyView() },
			actionText: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension InfoView where DescriptionText == EmptyView, ProgressIndicatorText == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			progressIndicatorText: { EmptyView() },
			actionText: actionText,
			secondaryActionText: { EmptyView() }
        )
    }
}
