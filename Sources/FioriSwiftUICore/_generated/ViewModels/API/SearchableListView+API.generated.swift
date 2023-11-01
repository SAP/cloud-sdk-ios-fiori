// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

@available(iOS 15.0, macOS 12.0, *)
public struct SearchableListView<CancelActionView: View, DoneActionView: View> {
    @Environment(\.cancelActionModifier) private var cancelActionModifier
	@Environment(\.doneActionModifier) private var doneActionModifier
	@Environment(\.listBackground) var listBackground
	@Environment(\.presentationMode) var presentationMode

    let _cancelAction: CancelActionView
	let _doneAction: DoneActionView
	var contentView: AnyView? = nil
	var isTopLevel: Bool = true
	var dataHandler: (() -> ())? = nil

    private var isModelInit: Bool = false
	private var isCancelActionNil: Bool = false
	private var isDoneActionNil: Bool = false

    public init(
        @ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder doneAction: () -> DoneActionView
        ) {
            self._cancelAction = cancelAction()
			self._doneAction = doneAction()
    }

    @ViewBuilder var cancelAction: some View {
        if isModelInit {
            _cancelAction.modifier(cancelActionModifier.concat(Fiori.SearchableListView.cancelAction).concat(Fiori.SearchableListView.cancelActionCumulative))
        } else {
            _cancelAction.modifier(cancelActionModifier.concat(Fiori.SearchableListView.cancelAction))
        }
    }
	@ViewBuilder var doneAction: some View {
        if isModelInit {
            _doneAction.modifier(doneActionModifier.concat(Fiori.SearchableListView.doneAction).concat(Fiori.SearchableListView.doneActionCumulative))
        } else {
            _doneAction.modifier(doneActionModifier.concat(Fiori.SearchableListView.doneAction))
        }
    }
    
	var isCancelActionEmptyView: Bool {
        ((isModelInit && isCancelActionNil) || CancelActionView.self == EmptyView.self) ? true : false
    }

	var isDoneActionEmptyView: Bool {
        ((isModelInit && isDoneActionNil) || DoneActionView.self == EmptyView.self) ? true : false
    }
}

@available(iOS 15.0, macOS 12.0, *)
extension SearchableListView where CancelActionView == _ConditionalContent<Action, EmptyView>,
		DoneActionView == _ConditionalContent<Action, EmptyView> {

    public init(model: SearchableListViewModel) {
        self.init(cancelAction: model.cancelAction != nil ? Action(model: model.cancelAction!) : nil, doneAction: model.doneAction != nil ? Action(model: model.doneAction!) : nil)
    }

    public init(cancelAction: Action? = Action(model: _CancelActionDefault()), doneAction: Action? = Action(model: _DoneActionDefault())) {
        self._cancelAction = cancelAction != nil ? ViewBuilder.buildEither(first: cancelAction!) : ViewBuilder.buildEither(second: EmptyView())
		self._doneAction = doneAction != nil ? ViewBuilder.buildEither(first: doneAction!) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isCancelActionNil = cancelAction == nil ? true : false
		isDoneActionNil = doneAction == nil ? true : false
    }
}
