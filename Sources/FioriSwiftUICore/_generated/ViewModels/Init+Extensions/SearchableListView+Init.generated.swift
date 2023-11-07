// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

@available(iOS 15.0, macOS 12.0, *)
extension SearchableListView where CancelActionView == Action {
    public init(
    @ViewBuilder doneAction: () -> DoneActionView
    ) {
        self.init(
            cancelAction: { Action(model: _CancelActionDefault()) },
			doneAction: doneAction
        )
    }
}

@available(iOS 15.0, macOS 12.0, *)
extension SearchableListView where DoneActionView == Action {
    public init(
    @ViewBuilder cancelAction: () -> CancelActionView
    ) {
        self.init(
            cancelAction: cancelAction,
			doneAction: { Action(model: _DoneActionDefault()) }
        )
    }
}

@available(iOS 15.0, macOS 12.0, *)
extension SearchableListView where CancelActionView == Action, DoneActionView == Action {
    public init(
    
    ) {
        self.init(
            cancelAction: { Action(model: _CancelActionDefault()) },
			doneAction: { Action(model: _DoneActionDefault()) }
        )
    }
}
