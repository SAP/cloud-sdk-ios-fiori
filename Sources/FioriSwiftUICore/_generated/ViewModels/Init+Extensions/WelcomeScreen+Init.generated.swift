// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension WelcomeScreen where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel,
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: primaryActionLabel,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel,
			icon: icon
        )
    }
}

extension WelcomeScreen where Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: primaryActionLabel,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where PrimaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel,
			icon: icon
        )
    }
}

extension WelcomeScreen where SecondaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: primaryActionLabel,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionLabel: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: primaryActionLabel,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, PrimaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, SecondaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionLabel: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel,
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: primaryActionLabel,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, PrimaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel,
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, SecondaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: primaryActionLabel,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionLabel: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: primaryActionLabel,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel,
			icon: icon
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, PrimaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, SecondaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: primaryActionLabel,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionLabel: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: primaryActionLabel,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView {
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
			primaryActionLabel: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionLabel: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where PrimaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel,
			icon: icon
        )
    }
}

extension WelcomeScreen where SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: primaryActionLabel,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, PrimaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionLabel: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, PrimaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, SecondaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionLabel: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionLabel: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, PrimaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, PrimaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, SecondaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: primaryActionLabel,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionLabel: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: primaryActionLabel,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionLabel: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, PrimaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel,
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: primaryActionLabel,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionLabel: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, PrimaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: primaryActionLabel,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, PrimaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionLabel: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionLabel: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, PrimaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel,
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			subtitle: subtitle,
			footnote: footnote,
			secondaryActionLabel: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, PrimaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionLabel: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, PrimaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: primaryActionLabel,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where Icon == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			subtitle: subtitle,
			footnote: { EmptyView() },
			secondaryActionLabel: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, PrimaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel,
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, Icon == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Footnote == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder icon: @escaping () -> Icon
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: { EmptyView() },
			icon: icon
        )
    }
}

extension WelcomeScreen where DescriptionText == EmptyView, Icon == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}

extension WelcomeScreen where Footnote == EmptyView, Icon == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			primaryActionLabel: { EmptyView() },
			subtitle: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: { EmptyView() },
			icon: { EmptyView() }
        )
    }
}
