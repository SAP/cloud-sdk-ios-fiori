// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension StepProgressIndicator where Title == EmptyView {
    public init(
    selection: Binding<String>,
		@ViewBuilder action: () -> ActionView,
		@IndexedViewBuilder steps: () -> Steps,
		@ViewBuilder cancelAction: () -> CancelActionView
    ) {
        self.init(
            selection: selection,
			title: { EmptyView() },
			action: action,
			steps: steps,
			cancelAction: cancelAction
        )
    }
}

extension StepProgressIndicator where ActionView == Action {
    public init(
    selection: Binding<String>,
		@ViewBuilder title: () -> Title,
		@IndexedViewBuilder steps: () -> Steps,
		@ViewBuilder cancelAction: () -> CancelActionView
    ) {
        self.init(
            selection: selection,
			title: title,
			action: { Action(model: _AllStepsActionDefault()) },
			steps: steps,
			cancelAction: cancelAction
        )
    }
}

extension StepProgressIndicator where CancelActionView == Action {
    public init(
    selection: Binding<String>,
		@ViewBuilder title: () -> Title,
		@ViewBuilder action: () -> ActionView,
		@IndexedViewBuilder steps: () -> Steps
    ) {
        self.init(
            selection: selection,
			title: title,
			action: action,
			steps: steps,
			cancelAction: { Action(model: _CancelActionDefault()) }
        )
    }
}

extension StepProgressIndicator where Title == EmptyView, ActionView == Action {
    public init(
    selection: Binding<String>,
		@IndexedViewBuilder steps: () -> Steps,
		@ViewBuilder cancelAction: () -> CancelActionView
    ) {
        self.init(
            selection: selection,
			title: { EmptyView() },
			action: { Action(model: _AllStepsActionDefault()) },
			steps: steps,
			cancelAction: cancelAction
        )
    }
}

extension StepProgressIndicator where Title == EmptyView, CancelActionView == Action {
    public init(
    selection: Binding<String>,
		@ViewBuilder action: () -> ActionView,
		@IndexedViewBuilder steps: () -> Steps
    ) {
        self.init(
            selection: selection,
			title: { EmptyView() },
			action: action,
			steps: steps,
			cancelAction: { Action(model: _CancelActionDefault()) }
        )
    }
}

extension StepProgressIndicator where ActionView == Action, CancelActionView == Action {
    public init(
    selection: Binding<String>,
		@ViewBuilder title: () -> Title,
		@IndexedViewBuilder steps: () -> Steps
    ) {
        self.init(
            selection: selection,
			title: title,
			action: { Action(model: _AllStepsActionDefault()) },
			steps: steps,
			cancelAction: { Action(model: _CancelActionDefault()) }
        )
    }
}

extension StepProgressIndicator where Title == EmptyView, ActionView == Action, CancelActionView == Action {
    public init(
    selection: Binding<String>,
		@IndexedViewBuilder steps: () -> Steps
    ) {
        self.init(
            selection: selection,
			title: { EmptyView() },
			action: { Action(model: _AllStepsActionDefault()) },
			steps: steps,
			cancelAction: { Action(model: _CancelActionDefault()) }
        )
    }
}
