// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
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

extension StepProgressIndicator where ActionView == _Action {
    public init(
    selection: Binding<String>,
		@ViewBuilder title: () -> Title,
		@IndexedViewBuilder steps: () -> Steps,
		@ViewBuilder cancelAction: () -> CancelActionView
    ) {
        self.init(
            selection: selection,
			title: title,
			action: { _Action(model: _AllStepsActionDefault()) },
			steps: steps,
			cancelAction: cancelAction
        )
    }
}

extension StepProgressIndicator where CancelActionView == _Action {
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
			cancelAction: { _Action(model: _CancelActionDefault()) }
        )
    }
}

extension StepProgressIndicator where Title == EmptyView, ActionView == _Action {
    public init(
    selection: Binding<String>,
		@IndexedViewBuilder steps: () -> Steps,
		@ViewBuilder cancelAction: () -> CancelActionView
    ) {
        self.init(
            selection: selection,
			title: { EmptyView() },
			action: { _Action(model: _AllStepsActionDefault()) },
			steps: steps,
			cancelAction: cancelAction
        )
    }
}

extension StepProgressIndicator where Title == EmptyView, CancelActionView == _Action {
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
			cancelAction: { _Action(model: _CancelActionDefault()) }
        )
    }
}

extension StepProgressIndicator where ActionView == _Action, CancelActionView == _Action {
    public init(
    selection: Binding<String>,
		@ViewBuilder title: () -> Title,
		@IndexedViewBuilder steps: () -> Steps
    ) {
        self.init(
            selection: selection,
			title: title,
			action: { _Action(model: _AllStepsActionDefault()) },
			steps: steps,
			cancelAction: { _Action(model: _CancelActionDefault()) }
        )
    }
}

extension StepProgressIndicator where Title == EmptyView, ActionView == _Action, CancelActionView == _Action {
    public init(
    selection: Binding<String>,
		@IndexedViewBuilder steps: () -> Steps
    ) {
        self.init(
            selection: selection,
			title: { EmptyView() },
			action: { _Action(model: _AllStepsActionDefault()) },
			steps: steps,
			cancelAction: { _Action(model: _CancelActionDefault()) }
        )
    }
}
