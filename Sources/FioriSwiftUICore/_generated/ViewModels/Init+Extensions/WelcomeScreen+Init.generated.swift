// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension WelcomeScreen where ActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: subtitle,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: subtitle,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: subtitle,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: subtitle,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Footnote == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: subtitle,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Icon == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: subtitle,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: subtitle,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where SecondaryActionText == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Icon == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: subtitle,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Icon == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
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
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Icon == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textFilled: @escaping () -> TextFilled
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, DescriptionText == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: actionText,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}
