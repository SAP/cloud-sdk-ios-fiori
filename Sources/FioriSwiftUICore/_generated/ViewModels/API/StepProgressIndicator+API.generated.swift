// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct StepProgressIndicator<CurrentStepName: View, AllStepsActionView: View, Steps: IndexedViewContainer, CancelActionView: View> {
    @Environment(\.currentStepNameModifier) private var currentStepNameModifier
	@Environment(\.allStepsActionModifier) private var allStepsActionModifier
	@Environment(\.cancelActionModifier) private var cancelActionModifier
	@Environment(\.presentationMode) var presentationMode

    let _currentStepName: CurrentStepName
	let _allStepsAction: AllStepsActionView
	let _steps: Steps
	let _cancelAction: CancelActionView
	var axis: Axis = .horizontal
	@State var isPresented: Bool = false

    private var isModelInit: Bool = false
	private var isCurrentStepNameNil: Bool = false
	private var isAllStepsActionNil: Bool = false
	private var isCancelActionNil: Bool = false

    public init(
        @ViewBuilder currentStepName: () -> CurrentStepName,
		@ViewBuilder allStepsAction: () -> AllStepsActionView,
		@IndexedViewBuilder steps: () -> Steps,
		@ViewBuilder cancelAction: () -> CancelActionView
        ) {
            self._currentStepName = currentStepName()
			self._allStepsAction = allStepsAction()
			self._steps = steps()
			self._cancelAction = cancelAction()
    }

    @ViewBuilder var currentStepName: some View {
        if isModelInit {
            _currentStepName.modifier(currentStepNameModifier.concat(Fiori.StepProgressIndicator.currentStepName).concat(Fiori.StepProgressIndicator.currentStepNameCumulative))
        } else {
            _currentStepName.modifier(currentStepNameModifier.concat(Fiori.StepProgressIndicator.currentStepName))
        }
    }
	@ViewBuilder var allStepsAction: some View {
        if isModelInit {
            _allStepsAction.modifier(allStepsActionModifier.concat(Fiori.StepProgressIndicator.allStepsAction).concat(Fiori.StepProgressIndicator.allStepsActionCumulative))
        } else {
            _allStepsAction.modifier(allStepsActionModifier.concat(Fiori.StepProgressIndicator.allStepsAction))
        }
    }
	var steps: Steps {
        _steps
    }
	@ViewBuilder var cancelAction: some View {
        if isModelInit {
            _cancelAction.modifier(cancelActionModifier.concat(Fiori.StepProgressIndicator.cancelAction).concat(Fiori.StepProgressIndicator.cancelActionCumulative))
        } else {
            _cancelAction.modifier(cancelActionModifier.concat(Fiori.StepProgressIndicator.cancelAction))
        }
    }
    
	var isCurrentStepNameEmptyView: Bool {
        ((isModelInit && isCurrentStepNameNil) || CurrentStepName.self == EmptyView.self) ? true : false
    }

	var isAllStepsActionEmptyView: Bool {
        ((isModelInit && isAllStepsActionNil) || AllStepsActionView.self == EmptyView.self) ? true : false
    }

	var isCancelActionEmptyView: Bool {
        ((isModelInit && isCancelActionNil) || CancelActionView.self == EmptyView.self) ? true : false
    }
}

extension StepProgressIndicator where CurrentStepName == _ConditionalContent<Text, EmptyView>,
		AllStepsActionView == _ConditionalContent<Action, EmptyView>,
		Steps == StepsContainer,
		CancelActionView == _ConditionalContent<Action, EmptyView> {

    public init(model: StepProgressIndicatorModel) {
        self.init(currentStepName: model.currentStepName, allStepsAction: model.allStepsAction != nil ? Action(model: model.allStepsAction!) : nil, steps: model.steps, cancelAction: model.cancelAction != nil ? Action(model: model.cancelAction!) : nil)
    }

    public init(currentStepName: String? = nil, allStepsAction: Action? = Action(model: _AllStepsActionDefault()), steps: [SingleStepModel] = [], cancelAction: Action? = Action(model: _CancelActionDefault())) {
        self._currentStepName = currentStepName != nil ? ViewBuilder.buildEither(first: Text(currentStepName!)) : ViewBuilder.buildEither(second: EmptyView())
		self._allStepsAction = allStepsAction != nil ? ViewBuilder.buildEither(first: allStepsAction!) : ViewBuilder.buildEither(second: EmptyView())
		self._steps = StepsContainer(steps: steps)
		self._cancelAction = cancelAction != nil ? ViewBuilder.buildEither(first: cancelAction!) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isCurrentStepNameNil = currentStepName == nil ? true : false
		isAllStepsActionNil = allStepsAction == nil ? true : false
		isCancelActionNil = cancelAction == nil ? true : false
    }
}
