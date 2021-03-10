// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension WelcomeScreen where ActionTitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: primaryButton,
			subtitle: subtitle,
			footnote: footnote,
			actionTitle: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: primaryButton,
			subtitle: subtitle,
			footnote: footnote,
			actionTitle: actionTitle,
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: primaryButton,
			subtitle: subtitle,
			footnote: { EmptyView() },
			actionTitle: actionTitle,
			icon: icon
        )
    }
}

extension WelcomeScreen where Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: primaryButton,
			subtitle: subtitle,
			footnote: footnote,
			actionTitle: actionTitle,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: primaryButton,
			subtitle: { EmptyView() },
			footnote: footnote,
			actionTitle: actionTitle,
			icon: icon
        )
    }
}

extension WelcomeScreen where PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			actionTitle: actionTitle,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: primaryButton,
			subtitle: subtitle,
			footnote: footnote,
			actionTitle: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: primaryButton,
			subtitle: subtitle,
			footnote: { EmptyView() },
			actionTitle: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: primaryButton,
			subtitle: subtitle,
			footnote: footnote,
			actionTitle: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: primaryButton,
			subtitle: { EmptyView() },
			footnote: footnote,
			actionTitle: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, PrimaryButton == EmptyView {
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
			primaryButton: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			actionTitle: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: primaryButton,
			subtitle: subtitle,
			footnote: { EmptyView() },
			actionTitle: actionTitle,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: primaryButton,
			subtitle: subtitle,
			footnote: footnote,
			actionTitle: actionTitle,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: primaryButton,
			subtitle: { EmptyView() },
			footnote: footnote,
			actionTitle: actionTitle,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			actionTitle: actionTitle,
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: primaryButton,
			subtitle: subtitle,
			footnote: { EmptyView() },
			actionTitle: actionTitle,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: primaryButton,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			actionTitle: actionTitle,
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			actionTitle: actionTitle,
			icon: icon
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: primaryButton,
			subtitle: { EmptyView() },
			footnote: footnote,
			actionTitle: actionTitle,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			actionTitle: actionTitle,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			actionTitle: actionTitle,
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: primaryButton,
			subtitle: subtitle,
			footnote: { EmptyView() },
			actionTitle: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, DescriptionText == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: primaryButton,
			subtitle: subtitle,
			footnote: footnote,
			actionTitle: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, DescriptionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: primaryButton,
			subtitle: { EmptyView() },
			footnote: footnote,
			actionTitle: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, DescriptionText == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			actionTitle: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, Footnote == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: primaryButton,
			subtitle: subtitle,
			footnote: { EmptyView() },
			actionTitle: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: primaryButton,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			actionTitle: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, Footnote == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			actionTitle: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: primaryButton,
			subtitle: { EmptyView() },
			footnote: footnote,
			actionTitle: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, Icon == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			actionTitle: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, Subtitle == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			actionTitle: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: primaryButton,
			subtitle: subtitle,
			footnote: { EmptyView() },
			actionTitle: actionTitle,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: primaryButton,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			actionTitle: actionTitle,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			actionTitle: actionTitle,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: primaryButton,
			subtitle: { EmptyView() },
			footnote: footnote,
			actionTitle: actionTitle,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			actionTitle: actionTitle,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			actionTitle: actionTitle,
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: primaryButton,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			actionTitle: actionTitle,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			actionTitle: actionTitle,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Subtitle == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			actionTitle: actionTitle,
			icon: icon
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, Subtitle == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			actionTitle: actionTitle,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: primaryButton,
			subtitle: subtitle,
			footnote: { EmptyView() },
			actionTitle: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: primaryButton,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			actionTitle: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			actionTitle: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, DescriptionText == EmptyView, Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: primaryButton,
			subtitle: { EmptyView() },
			footnote: footnote,
			actionTitle: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, DescriptionText == EmptyView, Icon == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			actionTitle: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, DescriptionText == EmptyView, Subtitle == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			actionTitle: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, Footnote == EmptyView, Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: primaryButton,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			actionTitle: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, Footnote == EmptyView, Icon == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			actionTitle: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			actionTitle: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, Icon == EmptyView, Subtitle == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			actionTitle: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: primaryButton,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			actionTitle: actionTitle,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			actionTitle: actionTitle,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			actionTitle: actionTitle,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, Subtitle == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			actionTitle: actionTitle,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, Subtitle == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			actionTitle: actionTitle,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryButton: @escaping () -> PrimaryButton
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: primaryButton,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			actionTitle: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			actionTitle: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			actionTitle: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, DescriptionText == EmptyView, Icon == EmptyView, Subtitle == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			actionTitle: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where ActionTitle == EmptyView, Footnote == EmptyView, Icon == EmptyView, Subtitle == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryButton: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			actionTitle: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, Subtitle == EmptyView, PrimaryButton == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryButton: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			actionTitle: actionTitle,
			icon: { EmptyView() }
        )
    }
}
