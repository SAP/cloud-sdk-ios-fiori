// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension ActivationScreen where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			primaryActionLabel: primaryActionLabel,
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			primaryActionLabel: primaryActionLabel,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where PrimaryActionLabel == EmptyView {
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
			subtitle: subtitle,
			primaryActionLabel: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			primaryActionLabel: primaryActionLabel,
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			primaryActionLabel: primaryActionLabel,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, PrimaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			primaryActionLabel: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			primaryActionLabel: primaryActionLabel,
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, PrimaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			primaryActionLabel: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			primaryActionLabel: primaryActionLabel,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where PrimaryActionLabel == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			primaryActionLabel: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where PrimaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, PrimaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			primaryActionLabel: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			primaryActionLabel: primaryActionLabel,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			primaryActionLabel: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, PrimaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			primaryActionLabel: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, PrimaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where PrimaryActionLabel == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			primaryActionLabel: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, PrimaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}
