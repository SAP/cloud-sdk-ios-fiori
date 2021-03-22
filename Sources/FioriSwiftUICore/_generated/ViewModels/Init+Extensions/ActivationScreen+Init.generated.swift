// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension ActivationScreen where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			primaryActionLabel: primaryActionLabel,
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel
        )
    }
}

extension ActivationScreen where Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			primaryActionLabel: primaryActionLabel,
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel
        )
    }
}

extension ActivationScreen where PrimaryActionLabel == EmptyView {
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
			subtitle: subtitle,
			primaryActionLabel: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel
        )
    }
}

extension ActivationScreen where SecondaryActionLabel == EmptyView {
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
			secondaryActionLabel: { EmptyView() }
        )
    }
}

extension ActivationScreen where Subtitle == EmptyView {
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
			subtitle: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			primaryActionLabel: primaryActionLabel,
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, PrimaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			primaryActionLabel: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, SecondaryActionLabel == EmptyView {
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
			secondaryActionLabel: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, PrimaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: subtitle,
			primaryActionLabel: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, SecondaryActionLabel == EmptyView {
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
			secondaryActionLabel: { EmptyView() }
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel
        )
    }
}

extension ActivationScreen where PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView {
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
			secondaryActionLabel: { EmptyView() }
        )
    }
}

extension ActivationScreen where PrimaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel
        )
    }
}

extension ActivationScreen where SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
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
			secondaryActionLabel: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, PrimaryActionLabel == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: subtitle,
			primaryActionLabel: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionLabel == EmptyView {
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
			secondaryActionLabel: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionLabel: @escaping () -> PrimaryActionLabel,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			primaryActionLabel: primaryActionLabel,
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView {
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
			secondaryActionLabel: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, PrimaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			footnote: footnote,
			secondaryActionLabel: secondaryActionLabel
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
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
			secondaryActionLabel: { EmptyView() }
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView {
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
			secondaryActionLabel: { EmptyView() }
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, PrimaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			subtitle: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
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
			secondaryActionLabel: { EmptyView() }
        )
    }
}

extension ActivationScreen where PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
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
			secondaryActionLabel: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView {
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
			secondaryActionLabel: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, PrimaryActionLabel == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryActionLabel: @escaping () -> SecondaryActionLabel
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			subtitle: { EmptyView() },
			primaryActionLabel: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionLabel: secondaryActionLabel
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
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
			secondaryActionLabel: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
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
			secondaryActionLabel: { EmptyView() }
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, PrimaryActionLabel == EmptyView, SecondaryActionLabel == EmptyView, Subtitle == EmptyView {
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
			secondaryActionLabel: { EmptyView() }
        )
    }
}
