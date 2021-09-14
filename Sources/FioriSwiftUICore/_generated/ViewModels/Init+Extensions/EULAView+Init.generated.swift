// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension EULAView where BodyAttributedText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		didAgree: (() -> Void)? = nil,
		didDisagree: (() -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			bodyAttributedText: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction,
			cancelAction: cancelAction,
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension EULAView where ActionView == Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyAttributedText: () -> BodyAttributedText,
		@ViewBuilder secondaryAction: () -> SecondaryActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		didAgree: (() -> Void)? = nil,
		didDisagree: (() -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			bodyAttributedText: bodyAttributedText,
			action: { Action(model: _AgreeActionDefault()) },
			secondaryAction: secondaryAction,
			cancelAction: cancelAction,
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension EULAView where SecondaryActionView == Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyAttributedText: () -> BodyAttributedText,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		didAgree: (() -> Void)? = nil,
		didDisagree: (() -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			bodyAttributedText: bodyAttributedText,
			action: action,
			secondaryAction: { Action(model: _DisagreeActionDefault()) },
			cancelAction: cancelAction,
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension EULAView where CancelActionView == Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyAttributedText: () -> BodyAttributedText,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView,
		didAgree: (() -> Void)? = nil,
		didDisagree: (() -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			bodyAttributedText: bodyAttributedText,
			action: action,
			secondaryAction: secondaryAction,
			cancelAction: { Action(model: _CancelActionDefault()) },
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension EULAView where BodyAttributedText == EmptyView, ActionView == Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder secondaryAction: () -> SecondaryActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		didAgree: (() -> Void)? = nil,
		didDisagree: (() -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			bodyAttributedText: { EmptyView() },
			action: { Action(model: _AgreeActionDefault()) },
			secondaryAction: secondaryAction,
			cancelAction: cancelAction,
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension EULAView where BodyAttributedText == EmptyView, SecondaryActionView == Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder cancelAction: () -> CancelActionView,
		didAgree: (() -> Void)? = nil,
		didDisagree: (() -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			bodyAttributedText: { EmptyView() },
			action: action,
			secondaryAction: { Action(model: _DisagreeActionDefault()) },
			cancelAction: cancelAction,
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension EULAView where BodyAttributedText == EmptyView, CancelActionView == Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView,
		didAgree: (() -> Void)? = nil,
		didDisagree: (() -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			bodyAttributedText: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction,
			cancelAction: { Action(model: _CancelActionDefault()) },
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension EULAView where ActionView == Action, SecondaryActionView == Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyAttributedText: () -> BodyAttributedText,
		@ViewBuilder cancelAction: () -> CancelActionView,
		didAgree: (() -> Void)? = nil,
		didDisagree: (() -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			bodyAttributedText: bodyAttributedText,
			action: { Action(model: _AgreeActionDefault()) },
			secondaryAction: { Action(model: _DisagreeActionDefault()) },
			cancelAction: cancelAction,
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension EULAView where ActionView == Action, CancelActionView == Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyAttributedText: () -> BodyAttributedText,
		@ViewBuilder secondaryAction: () -> SecondaryActionView,
		didAgree: (() -> Void)? = nil,
		didDisagree: (() -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			bodyAttributedText: bodyAttributedText,
			action: { Action(model: _AgreeActionDefault()) },
			secondaryAction: secondaryAction,
			cancelAction: { Action(model: _CancelActionDefault()) },
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension EULAView where SecondaryActionView == Action, CancelActionView == Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyAttributedText: () -> BodyAttributedText,
		@ViewBuilder action: () -> ActionView,
		didAgree: (() -> Void)? = nil,
		didDisagree: (() -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			bodyAttributedText: bodyAttributedText,
			action: action,
			secondaryAction: { Action(model: _DisagreeActionDefault()) },
			cancelAction: { Action(model: _CancelActionDefault()) },
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension EULAView where BodyAttributedText == EmptyView, ActionView == Action, SecondaryActionView == Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder cancelAction: () -> CancelActionView,
		didAgree: (() -> Void)? = nil,
		didDisagree: (() -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			bodyAttributedText: { EmptyView() },
			action: { Action(model: _AgreeActionDefault()) },
			secondaryAction: { Action(model: _DisagreeActionDefault()) },
			cancelAction: cancelAction,
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension EULAView where BodyAttributedText == EmptyView, ActionView == Action, CancelActionView == Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder secondaryAction: () -> SecondaryActionView,
		didAgree: (() -> Void)? = nil,
		didDisagree: (() -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			bodyAttributedText: { EmptyView() },
			action: { Action(model: _AgreeActionDefault()) },
			secondaryAction: secondaryAction,
			cancelAction: { Action(model: _CancelActionDefault()) },
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension EULAView where BodyAttributedText == EmptyView, SecondaryActionView == Action, CancelActionView == Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView,
		didAgree: (() -> Void)? = nil,
		didDisagree: (() -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			bodyAttributedText: { EmptyView() },
			action: action,
			secondaryAction: { Action(model: _DisagreeActionDefault()) },
			cancelAction: { Action(model: _CancelActionDefault()) },
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension EULAView where ActionView == Action, SecondaryActionView == Action, CancelActionView == Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyAttributedText: () -> BodyAttributedText,
		didAgree: (() -> Void)? = nil,
		didDisagree: (() -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			bodyAttributedText: bodyAttributedText,
			action: { Action(model: _AgreeActionDefault()) },
			secondaryAction: { Action(model: _DisagreeActionDefault()) },
			cancelAction: { Action(model: _CancelActionDefault()) },
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension EULAView where BodyAttributedText == EmptyView, ActionView == Action, SecondaryActionView == Action, CancelActionView == Action {
    public init(
    @ViewBuilder title: () -> Title,
		didAgree: (() -> Void)? = nil,
		didDisagree: (() -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			bodyAttributedText: { EmptyView() },
			action: { Action(model: _AgreeActionDefault()) },
			secondaryAction: { Action(model: _DisagreeActionDefault()) },
			cancelAction: { Action(model: _CancelActionDefault()) },
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}
