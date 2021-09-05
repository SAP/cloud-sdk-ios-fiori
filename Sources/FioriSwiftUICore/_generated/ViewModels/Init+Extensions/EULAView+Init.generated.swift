// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension EULAView where HtmlView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			htmlView: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension EULAView where ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder htmlView: () -> HtmlView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			htmlView: htmlView,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension EULAView where SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder htmlView: () -> HtmlView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			htmlView: htmlView,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension EULAView where HtmlView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			htmlView: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension EULAView where HtmlView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			htmlView: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension EULAView where ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder htmlView: () -> HtmlView
    ) {
        self.init(
            title: title,
			htmlView: htmlView,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension EULAView where HtmlView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title
    ) {
        self.init(
            title: title,
			htmlView: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}
