// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension ActivationScreen where DescriptionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder primaryActionText: @escaping () -> PrimaryActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			primaryActionText: primaryActionText,
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder primaryActionText: @escaping () -> PrimaryActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			primaryActionText: primaryActionText,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where PrimaryActionText == EmptyView {
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
			primaryActionText: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder primaryActionText: @escaping () -> PrimaryActionText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			primaryActionText: primaryActionText,
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionText: @escaping () -> PrimaryActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			primaryActionText: primaryActionText,
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder primaryActionText: @escaping () -> PrimaryActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			primaryActionText: primaryActionText,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, PrimaryActionText == EmptyView {
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
			primaryActionText: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder primaryActionText: @escaping () -> PrimaryActionText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			primaryActionText: primaryActionText,
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionText: @escaping () -> PrimaryActionText,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			primaryActionText: primaryActionText,
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, PrimaryActionText == EmptyView {
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
			primaryActionText: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder primaryActionText: @escaping () -> PrimaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			primaryActionText: primaryActionText,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionText: @escaping () -> PrimaryActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			primaryActionText: primaryActionText,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where PrimaryActionText == EmptyView, SecondaryActionText == EmptyView {
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
			primaryActionText: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where PrimaryActionText == EmptyView, TextFilled == EmptyView {
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
			primaryActionText: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionText: @escaping () -> PrimaryActionText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			primaryActionText: primaryActionText,
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, PrimaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			primaryActionText: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder primaryActionText: @escaping () -> PrimaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			primaryActionText: primaryActionText,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionText: @escaping () -> PrimaryActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			primaryActionText: primaryActionText,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, PrimaryActionText == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			primaryActionText: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, PrimaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			primaryActionText: { EmptyView() },
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionText: @escaping () -> PrimaryActionText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			primaryActionText: primaryActionText,
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, PrimaryActionText == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder textFilled: @escaping () -> TextFilled
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			primaryActionText: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, PrimaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			primaryActionText: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder primaryActionText: @escaping () -> PrimaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			primaryActionText: primaryActionText,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where PrimaryActionText == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			primaryActionText: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, PrimaryActionText == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			primaryActionText: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, PrimaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			primaryActionText: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder primaryActionText: @escaping () -> PrimaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			primaryActionText: primaryActionText,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, PrimaryActionText == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			primaryActionText: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, PrimaryActionText == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			primaryActionText: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}
