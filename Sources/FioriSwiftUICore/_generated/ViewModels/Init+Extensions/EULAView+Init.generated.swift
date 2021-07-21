// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension EULAView where ActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder htmlContent: @escaping () -> HtmlContent,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			htmlContent: htmlContent,
			actionText: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension EULAView where HtmlContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			htmlContent: { EmptyView() },
			actionText: actionText,
			secondaryActionText: secondaryActionText
        )
    }
}

extension EULAView where SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder htmlContent: @escaping () -> HtmlContent,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			htmlContent: htmlContent,
			actionText: actionText,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension EULAView where ActionText == EmptyView, HtmlContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			htmlContent: { EmptyView() },
			actionText: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension EULAView where ActionText == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder htmlContent: @escaping () -> HtmlContent
    ) {
        self.init(
            title: title,
			htmlContent: htmlContent,
			actionText: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension EULAView where HtmlContent == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			htmlContent: { EmptyView() },
			actionText: actionText,
			secondaryActionText: { EmptyView() }
        )
    }
}
