// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension _ActivationScreen where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			footnote: footnote,
			action: action,
			secondaryAction: secondaryAction,
			textInput: textInput
        )
    }
}

extension _ActivationScreen where Footnote == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			footnote: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction,
			textInput: textInput
        )
    }
}

extension _ActivationScreen where ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder secondaryAction: () -> SecondaryActionView,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			footnote: footnote,
			action: { EmptyView() },
			secondaryAction: secondaryAction,
			textInput: textInput
        )
    }
}

extension _ActivationScreen where SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			footnote: footnote,
			action: action,
			secondaryAction: { EmptyView() },
			textInput: textInput
        )
    }
}

extension _ActivationScreen where TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			footnote: footnote,
			action: action,
			secondaryAction: secondaryAction,
			textInput: { EmptyView() }
        )
    }
}

extension _ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			footnote: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction,
			textInput: textInput
        )
    }
}

extension _ActivationScreen where DescriptionText == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder secondaryAction: () -> SecondaryActionView,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			footnote: footnote,
			action: { EmptyView() },
			secondaryAction: secondaryAction,
			textInput: textInput
        )
    }
}

extension _ActivationScreen where DescriptionText == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			footnote: footnote,
			action: action,
			secondaryAction: { EmptyView() },
			textInput: textInput
        )
    }
}

extension _ActivationScreen where DescriptionText == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			footnote: footnote,
			action: action,
			secondaryAction: secondaryAction,
			textInput: { EmptyView() }
        )
    }
}

extension _ActivationScreen where Footnote == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder secondaryAction: () -> SecondaryActionView,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			footnote: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction,
			textInput: textInput
        )
    }
}

extension _ActivationScreen where Footnote == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			footnote: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() },
			textInput: textInput
        )
    }
}

extension _ActivationScreen where Footnote == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			footnote: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction,
			textInput: { EmptyView() }
        )
    }
}

extension _ActivationScreen where ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			footnote: footnote,
			action: { EmptyView() },
			secondaryAction: { EmptyView() },
			textInput: textInput
        )
    }
}

extension _ActivationScreen where ActionView == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			footnote: footnote,
			action: { EmptyView() },
			secondaryAction: secondaryAction,
			textInput: { EmptyView() }
        )
    }
}

extension _ActivationScreen where SecondaryActionView == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			footnote: footnote,
			action: action,
			secondaryAction: { EmptyView() },
			textInput: { EmptyView() }
        )
    }
}

extension _ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder secondaryAction: () -> SecondaryActionView,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			footnote: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction,
			textInput: textInput
        )
    }
}

extension _ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			footnote: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() },
			textInput: textInput
        )
    }
}

extension _ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			footnote: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction,
			textInput: { EmptyView() }
        )
    }
}

extension _ActivationScreen where DescriptionText == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			footnote: footnote,
			action: { EmptyView() },
			secondaryAction: { EmptyView() },
			textInput: textInput
        )
    }
}

extension _ActivationScreen where DescriptionText == EmptyView, ActionView == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			footnote: footnote,
			action: { EmptyView() },
			secondaryAction: secondaryAction,
			textInput: { EmptyView() }
        )
    }
}

extension _ActivationScreen where DescriptionText == EmptyView, SecondaryActionView == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			footnote: footnote,
			action: action,
			secondaryAction: { EmptyView() },
			textInput: { EmptyView() }
        )
    }
}

extension _ActivationScreen where Footnote == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			footnote: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() },
			textInput: textInput
        )
    }
}

extension _ActivationScreen where Footnote == EmptyView, ActionView == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			footnote: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction,
			textInput: { EmptyView() }
        )
    }
}

extension _ActivationScreen where Footnote == EmptyView, SecondaryActionView == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			footnote: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() },
			textInput: { EmptyView() }
        )
    }
}

extension _ActivationScreen where ActionView == EmptyView, SecondaryActionView == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			footnote: footnote,
			action: { EmptyView() },
			secondaryAction: { EmptyView() },
			textInput: { EmptyView() }
        )
    }
}

extension _ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			footnote: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() },
			textInput: textInput
        )
    }
}

extension _ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, ActionView == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			footnote: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction,
			textInput: { EmptyView() }
        )
    }
}

extension _ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionView == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			footnote: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() },
			textInput: { EmptyView() }
        )
    }
}

extension _ActivationScreen where DescriptionText == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			footnote: footnote,
			action: { EmptyView() },
			secondaryAction: { EmptyView() },
			textInput: { EmptyView() }
        )
    }
}

extension _ActivationScreen where Footnote == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			footnote: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() },
			textInput: { EmptyView() }
        )
    }
}

extension _ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			footnote: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() },
			textInput: { EmptyView() }
        )
    }
}
