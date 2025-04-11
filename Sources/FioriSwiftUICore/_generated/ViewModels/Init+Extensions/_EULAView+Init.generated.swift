// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension _EULAView where BodyAttributedText == EmptyView {
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

extension _EULAView where ActionView == _Action {
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
			action: { _Action(model: _AgreeActionDefault()) },
			secondaryAction: secondaryAction,
			cancelAction: cancelAction,
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension _EULAView where SecondaryActionView == _Action {
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
			secondaryAction: { _Action(model: _DisagreeActionDefault()) },
			cancelAction: cancelAction,
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension _EULAView where CancelActionView == _Action {
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
			cancelAction: { _Action(model: _CancelActionDefault()) },
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension _EULAView where BodyAttributedText == EmptyView, ActionView == _Action {
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
			action: { _Action(model: _AgreeActionDefault()) },
			secondaryAction: secondaryAction,
			cancelAction: cancelAction,
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension _EULAView where BodyAttributedText == EmptyView, SecondaryActionView == _Action {
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
			secondaryAction: { _Action(model: _DisagreeActionDefault()) },
			cancelAction: cancelAction,
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension _EULAView where BodyAttributedText == EmptyView, CancelActionView == _Action {
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
			cancelAction: { _Action(model: _CancelActionDefault()) },
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension _EULAView where ActionView == _Action, SecondaryActionView == _Action {
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
			action: { _Action(model: _AgreeActionDefault()) },
			secondaryAction: { _Action(model: _DisagreeActionDefault()) },
			cancelAction: cancelAction,
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension _EULAView where ActionView == _Action, CancelActionView == _Action {
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
			action: { _Action(model: _AgreeActionDefault()) },
			secondaryAction: secondaryAction,
			cancelAction: { _Action(model: _CancelActionDefault()) },
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension _EULAView where SecondaryActionView == _Action, CancelActionView == _Action {
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
			secondaryAction: { _Action(model: _DisagreeActionDefault()) },
			cancelAction: { _Action(model: _CancelActionDefault()) },
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension _EULAView where BodyAttributedText == EmptyView, ActionView == _Action, SecondaryActionView == _Action {
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
			action: { _Action(model: _AgreeActionDefault()) },
			secondaryAction: { _Action(model: _DisagreeActionDefault()) },
			cancelAction: cancelAction,
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension _EULAView where BodyAttributedText == EmptyView, ActionView == _Action, CancelActionView == _Action {
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
			action: { _Action(model: _AgreeActionDefault()) },
			secondaryAction: secondaryAction,
			cancelAction: { _Action(model: _CancelActionDefault()) },
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension _EULAView where BodyAttributedText == EmptyView, SecondaryActionView == _Action, CancelActionView == _Action {
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
			secondaryAction: { _Action(model: _DisagreeActionDefault()) },
			cancelAction: { _Action(model: _CancelActionDefault()) },
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension _EULAView where ActionView == _Action, SecondaryActionView == _Action, CancelActionView == _Action {
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
			action: { _Action(model: _AgreeActionDefault()) },
			secondaryAction: { _Action(model: _DisagreeActionDefault()) },
			cancelAction: { _Action(model: _CancelActionDefault()) },
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}

extension _EULAView where BodyAttributedText == EmptyView, ActionView == _Action, SecondaryActionView == _Action, CancelActionView == _Action {
    public init(
    @ViewBuilder title: () -> Title,
		didAgree: (() -> Void)? = nil,
		didDisagree: (() -> Void)? = nil,
		didCancel: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			bodyAttributedText: { EmptyView() },
			action: { _Action(model: _AgreeActionDefault()) },
			secondaryAction: { _Action(model: _DisagreeActionDefault()) },
			cancelAction: { _Action(model: _CancelActionDefault()) },
			didAgree: didAgree,
			didDisagree: didDisagree,
			didCancel: didCancel
        )
    }
}
