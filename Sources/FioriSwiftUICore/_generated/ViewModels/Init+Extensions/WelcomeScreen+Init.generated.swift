// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension WelcomeScreen where ActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Footnote == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textInputValue: textInputValue,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textInputValue: @escaping () -> TextInputValue,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textInputValue: textInputValue,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}
