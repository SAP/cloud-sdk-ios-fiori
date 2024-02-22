// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public extension EULAView where BodyAttributedText == EmptyView {
    init(
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

public extension EULAView where ActionView == _Action {
    init(
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

public extension EULAView where SecondaryActionView == _Action {
    init(
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

public extension EULAView where CancelActionView == _Action {
    init(
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

public extension EULAView where BodyAttributedText == EmptyView, ActionView == _Action {
    init(
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

public extension EULAView where BodyAttributedText == EmptyView, SecondaryActionView == _Action {
    init(
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

public extension EULAView where BodyAttributedText == EmptyView, CancelActionView == _Action {
    init(
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

public extension EULAView where ActionView == _Action, SecondaryActionView == _Action {
    init(
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

public extension EULAView where ActionView == _Action, CancelActionView == _Action {
    init(
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

public extension EULAView where SecondaryActionView == _Action, CancelActionView == _Action {
    init(
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

public extension EULAView where BodyAttributedText == EmptyView, ActionView == _Action, SecondaryActionView == _Action {
    init(
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

public extension EULAView where BodyAttributedText == EmptyView, ActionView == _Action, CancelActionView == _Action {
    init(
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

public extension EULAView where BodyAttributedText == EmptyView, SecondaryActionView == _Action, CancelActionView == _Action {
    init(
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

public extension EULAView where ActionView == _Action, SecondaryActionView == _Action, CancelActionView == _Action {
    init(
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

public extension EULAView where BodyAttributedText == EmptyView, ActionView == _Action, SecondaryActionView == _Action, CancelActionView == _Action {
    init(
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
