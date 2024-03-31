// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

@available(iOS 15.0, macOS 12.0, *)
extension SearchableListView where CancelActionView == _Action {
    public init(
    @ViewBuilder doneAction: () -> DoneActionView
    ) {
        self.init(
            cancelAction: { _Action(model: _CancelActionDefault()) },
			doneAction: doneAction
        )
    }
}

@available(iOS 15.0, macOS 12.0, *)
extension SearchableListView where DoneActionView == _Action {
    public init(
    @ViewBuilder cancelAction: () -> CancelActionView
    ) {
        self.init(
            cancelAction: cancelAction,
			doneAction: { _Action(model: _DoneActionDefault()) }
        )
    }
}

@available(iOS 15.0, macOS 12.0, *)
extension SearchableListView where CancelActionView == _Action, DoneActionView == _Action {
    public init(
    
    ) {
        self.init(
            cancelAction: { _Action(model: _CancelActionDefault()) },
			doneAction: { _Action(model: _DoneActionDefault()) }
        )
    }
}
