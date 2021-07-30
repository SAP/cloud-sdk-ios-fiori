// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension ActivationScreen where ActionText == EmptyView {
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
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView {
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
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where Footnote == EmptyView {
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
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where SecondaryActionText == EmptyView {
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
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, DescriptionText == EmptyView {
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
			footnote: footnote,
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, Footnote == EmptyView {
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
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, SecondaryActionText == EmptyView {
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
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView {
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
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, SecondaryActionText == EmptyView {
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
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where Footnote == EmptyView, SecondaryActionText == EmptyView {
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
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, DescriptionText == EmptyView, Footnote == EmptyView {
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
			footnote: { EmptyView() },
			secondaryActionText: secondaryActionText
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, DescriptionText == EmptyView, SecondaryActionText == EmptyView {
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
			footnote: footnote,
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where ActionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView {
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
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}

extension ActivationScreen where DescriptionText == EmptyView, Footnote == EmptyView, SecondaryActionText == EmptyView {
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
			footnote: { EmptyView() },
			secondaryActionText: { EmptyView() }
        )
    }
}
