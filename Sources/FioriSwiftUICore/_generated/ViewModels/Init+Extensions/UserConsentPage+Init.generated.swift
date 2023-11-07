// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension UserConsentPage where BodyAttributedText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			bodyAttributedText: { EmptyView() },
			action: action
        )
    }
}

extension UserConsentPage where ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyAttributedText: () -> BodyAttributedText
    ) {
        self.init(
            title: title,
			bodyAttributedText: bodyAttributedText,
			action: { EmptyView() }
        )
    }
}

extension UserConsentPage where BodyAttributedText == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title
    ) {
        self.init(
            title: title,
			bodyAttributedText: { EmptyView() },
			action: { EmptyView() }
        )
    }
}
