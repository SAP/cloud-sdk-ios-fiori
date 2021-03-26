// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension ActivationScreen where ActionText == EmptyView {
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
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView {
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
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: textFilled,
			actionText: actionText,
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where SecondaryActionText == EmptyView {
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
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where TextFilled == EmptyView {
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
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, DescriptionText == EmptyView {
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
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, Footnote == EmptyView {
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
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, SecondaryActionText == EmptyView {
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
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, TextFilled == EmptyView {
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
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView {
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
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, SecondaryActionText == EmptyView {
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
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, TextFilled == EmptyView {
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
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, SecondaryActionText == EmptyView {
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
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, TextFilled == EmptyView {
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
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where SecondaryActionText == EmptyView, TextFilled == EmptyView {
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
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView {
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
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, DescriptionText == EmptyView, SecondaryActionText == EmptyView {
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
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, DescriptionText == EmptyView, TextFilled == EmptyView {
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
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView {
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
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, Footnote == EmptyView, TextFilled == EmptyView {
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
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
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
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView {
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
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, TextFilled == EmptyView {
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
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
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
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
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
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder textFilled: @escaping () -> TextFilled
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: textFilled,
			actionText: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, DescriptionText == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder descriptionText: @escaping () -> DescriptionText
    ) {
        self.init(
            title: title,
			descriptionText: descriptionText,
			textFilled: { EmptyView() },
			actionText: { EmptyView() },
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView, TextFilled == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder actionText: @escaping () -> ActionText
    ) {
        self.init(
            title: title,
			descriptionText: { EmptyView() },
			textFilled: { EmptyView() },
			actionText: actionText,
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}
