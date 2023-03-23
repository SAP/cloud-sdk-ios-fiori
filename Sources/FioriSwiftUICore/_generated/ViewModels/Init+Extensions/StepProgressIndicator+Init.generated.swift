// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension StepProgressIndicator where CurrentStepName == EmptyView {
    public init(
    @ViewBuilder allStepsAction: () -> AllStepsActionView,
		@IndexedViewBuilder steps: () -> Steps,
		@ViewBuilder cancelAction: () -> CancelActionView
    ) {
        self.init(
            currentStepName: { EmptyView() },
			allStepsAction: allStepsAction,
			steps: steps,
			cancelAction: cancelAction
        )
    }
}

extension StepProgressIndicator where AllStepsActionView == Action {
    public init(
    @ViewBuilder currentStepName: () -> CurrentStepName,
		@IndexedViewBuilder steps: () -> Steps,
		@ViewBuilder cancelAction: () -> CancelActionView
    ) {
        self.init(
            currentStepName: currentStepName,
			allStepsAction: { Action(model: _AllStepsActionDefault()) },
			steps: steps,
			cancelAction: cancelAction
        )
    }
}

extension StepProgressIndicator where CancelActionView == Action {
    public init(
    @ViewBuilder currentStepName: () -> CurrentStepName,
		@ViewBuilder allStepsAction: () -> AllStepsActionView,
		@IndexedViewBuilder steps: () -> Steps
    ) {
        self.init(
            currentStepName: currentStepName,
			allStepsAction: allStepsAction,
			steps: steps,
			cancelAction: { Action(model: _CancelActionDefault()) }
        )
    }
}

extension StepProgressIndicator where CurrentStepName == EmptyView, AllStepsActionView == Action {
    public init(
    @IndexedViewBuilder steps: () -> Steps,
		@ViewBuilder cancelAction: () -> CancelActionView
    ) {
        self.init(
            currentStepName: { EmptyView() },
			allStepsAction: { Action(model: _AllStepsActionDefault()) },
			steps: steps,
			cancelAction: cancelAction
        )
    }
}

extension StepProgressIndicator where CurrentStepName == EmptyView, CancelActionView == Action {
    public init(
    @ViewBuilder allStepsAction: () -> AllStepsActionView,
		@IndexedViewBuilder steps: () -> Steps
    ) {
        self.init(
            currentStepName: { EmptyView() },
			allStepsAction: allStepsAction,
			steps: steps,
			cancelAction: { Action(model: _CancelActionDefault()) }
        )
    }
}

extension StepProgressIndicator where AllStepsActionView == Action, CancelActionView == Action {
    public init(
    @ViewBuilder currentStepName: () -> CurrentStepName,
		@IndexedViewBuilder steps: () -> Steps
    ) {
        self.init(
            currentStepName: currentStepName,
			allStepsAction: { Action(model: _AllStepsActionDefault()) },
			steps: steps,
			cancelAction: { Action(model: _CancelActionDefault()) }
        )
    }
}

extension StepProgressIndicator where CurrentStepName == EmptyView, AllStepsActionView == Action, CancelActionView == Action {
    public init(
    @IndexedViewBuilder steps: () -> Steps
    ) {
        self.init(
            currentStepName: { EmptyView() },
			allStepsAction: { Action(model: _AllStepsActionDefault()) },
			steps: steps,
			cancelAction: { Action(model: _CancelActionDefault()) }
        )
    }
}
