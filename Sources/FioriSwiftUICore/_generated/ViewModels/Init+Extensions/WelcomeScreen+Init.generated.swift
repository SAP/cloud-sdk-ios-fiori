// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension WelcomeScreen where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			icon: icon,
			textInput: textInput,
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: icon,
			textInput: textInput,
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: icon,
			textInput: textInput,
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Icon == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: footnote,
			icon: { EmptyView() },
			textInput: textInput,
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: footnote,
			icon: icon,
			textInput: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: footnote,
			icon: icon,
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: footnote,
			icon: icon,
			textInput: textInput,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: icon,
			textInput: textInput,
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: icon,
			textInput: textInput,
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			icon: { EmptyView() },
			textInput: textInput,
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			icon: icon,
			textInput: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			icon: icon,
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			icon: icon,
			textInput: textInput,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: icon,
			textInput: textInput,
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: { EmptyView() },
			textInput: textInput,
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: icon,
			textInput: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: icon,
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: icon,
			textInput: textInput,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: textInput,
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: icon,
			textInput: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: icon,
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: icon,
			textInput: textInput,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: footnote,
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: footnote,
			icon: { EmptyView() },
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: footnote,
			icon: { EmptyView() },
			textInput: textInput,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where TextInputView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: footnote,
			icon: icon,
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where TextInputView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: footnote,
			icon: icon,
			textInput: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: footnote,
			icon: icon,
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: icon,
			textInput: textInput,
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: { EmptyView() },
			textInput: textInput,
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: icon,
			textInput: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: icon,
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: icon,
			textInput: textInput,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: textInput,
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: icon,
			textInput: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: icon,
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: icon,
			textInput: textInput,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			icon: { EmptyView() },
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			icon: { EmptyView() },
			textInput: textInput,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, TextInputView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			icon: icon,
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, TextInputView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			icon: icon,
			textInput: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			icon: icon,
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Footnote == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: textInput,
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Footnote == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: icon,
			textInput: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Footnote == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: icon,
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Footnote == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: icon,
			textInput: textInput,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Icon == EmptyView, TextInputView == EmptyView {
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
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Icon == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: { EmptyView() },
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Icon == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: { EmptyView() },
			textInput: textInput,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, TextInputView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: icon,
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, TextInputView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: icon,
			textInput: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: icon,
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: textInput,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, TextInputView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: icon,
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, TextInputView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: icon,
			textInput: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: icon,
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, TextInputView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: footnote,
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, TextInputView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: footnote,
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: footnote,
			icon: { EmptyView() },
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where TextInputView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: footnote,
			icon: icon,
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Footnote == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: textInput,
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Footnote == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: icon,
			textInput: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Footnote == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: icon,
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Footnote == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: icon,
			textInput: textInput,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Icon == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Icon == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: { EmptyView() },
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Icon == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: { EmptyView() },
			textInput: textInput,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, TextInputView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: icon,
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, TextInputView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: icon,
			textInput: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: icon,
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: textInput,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, TextInputView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: icon,
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, TextInputView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: icon,
			textInput: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: icon,
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, TextInputView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, TextInputView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			icon: { EmptyView() },
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, TextInputView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			icon: icon,
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Footnote == EmptyView, Icon == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Footnote == EmptyView, Icon == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: textInput,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Footnote == EmptyView, TextInputView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: icon,
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Footnote == EmptyView, TextInputView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: icon,
			textInput: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Footnote == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: icon,
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Icon == EmptyView, TextInputView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Icon == EmptyView, TextInputView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Icon == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: { EmptyView() },
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, TextInputView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: icon,
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, TextInputView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, TextInputView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, TextInputView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder icon: () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: icon,
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, TextInputView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: footnote,
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Footnote == EmptyView, Icon == EmptyView, TextInputView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: action,
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Footnote == EmptyView, Icon == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder textInput: () -> TextInputView,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: textInput,
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Footnote == EmptyView, TextInputView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: icon,
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Footnote == EmptyView, TextInputView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: icon,
			textInput: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Footnote == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder icon: () -> Icon,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: icon,
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Icon == EmptyView, TextInputView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Icon == EmptyView, TextInputView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Icon == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: { EmptyView() },
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, TextInputView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder icon: () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: icon,
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, TextInputView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, TextInputView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, TextInputView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder icon: () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: icon,
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, TextInputView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footnote: () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Footnote == EmptyView, Icon == EmptyView, TextInputView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Footnote == EmptyView, Icon == EmptyView, TextInputView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Footnote == EmptyView, Icon == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Footnote == EmptyView, TextInputView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder icon: () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: icon,
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Icon == EmptyView, TextInputView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder footnote: () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, TextInputView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText,
		@ViewBuilder subtitle: () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Footnote == EmptyView, Icon == EmptyView, TextInputView == EmptyView, ActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: secondaryAction
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Footnote == EmptyView, Icon == EmptyView, TextInputView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: action,
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Footnote == EmptyView, Icon == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder textInput: () -> TextInputView
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: textInput,
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Footnote == EmptyView, TextInputView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder icon: () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: icon,
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Icon == EmptyView, TextInputView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, TextInputView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, Footnote == EmptyView, Icon == EmptyView, TextInputView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder descriptionText: () -> DescriptionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, Footnote == EmptyView, Icon == EmptyView, TextInputView == EmptyView, ActionView == EmptyView, SecondaryActionView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			icon: { EmptyView() },
			textInput: { EmptyView() },
			action: { EmptyView() },
			secondaryAction: { EmptyView() }
        )
    }
}
