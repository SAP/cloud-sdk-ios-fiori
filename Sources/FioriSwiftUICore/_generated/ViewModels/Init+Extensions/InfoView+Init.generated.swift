// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension InfoView where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		showLoadingIndicator: Bool? = nil,
		loadingIndicatorText: String? = nil,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			showLoadingIndicator: showLoadingIndicator,
			loadingIndicatorText: loadingIndicatorText,
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension InfoView where ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		showLoadingIndicator: Bool? = nil,
		loadingIndicatorText: String? = nil,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			showLoadingIndicator: showLoadingIndicator,
			loadingIndicatorText: loadingIndicatorText,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension InfoView where SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		showLoadingIndicator: Bool? = nil,
		loadingIndicatorText: String? = nil,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			showLoadingIndicator: showLoadingIndicator,
			loadingIndicatorText: loadingIndicatorText,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension InfoView where DescriptionText == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		showLoadingIndicator: Bool? = nil,
		loadingIndicatorText: String? = nil,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			showLoadingIndicator: showLoadingIndicator,
			loadingIndicatorText: loadingIndicatorText,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension InfoView where DescriptionText == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		showLoadingIndicator: Bool? = nil,
		loadingIndicatorText: String? = nil,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			showLoadingIndicator: showLoadingIndicator,
			loadingIndicatorText: loadingIndicatorText,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension InfoView where ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		showLoadingIndicator: Bool? = nil,
		loadingIndicatorText: String? = nil
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			showLoadingIndicator: showLoadingIndicator,
			loadingIndicatorText: loadingIndicatorText,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension InfoView where DescriptionText == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		showLoadingIndicator: Bool? = nil,
		loadingIndicatorText: String? = nil
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			showLoadingIndicator: showLoadingIndicator,
			loadingIndicatorText: loadingIndicatorText,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}
