// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension SortFilterMenu where CancelActionView == Action {
    public init(
    @ViewBuilder items: () -> Items,
		@ViewBuilder resetAction: () -> ResetActionView,
		@ViewBuilder applyAction: () -> ApplyActionView,
		onUpdate: (() -> Void)? = nil
    ) {
        self.init(
            items: items,
			cancelAction: { Action(model: _CancelActionDefault()) },
			resetAction: resetAction,
			applyAction: applyAction,
			onUpdate: onUpdate
        )
    }
}

extension SortFilterMenu where ResetActionView == Action {
    public init(
    @ViewBuilder items: () -> Items,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder applyAction: () -> ApplyActionView,
		onUpdate: (() -> Void)? = nil
    ) {
        self.init(
            items: items,
			cancelAction: cancelAction,
			resetAction: { Action(model: _ResetActionDefault()) },
			applyAction: applyAction,
			onUpdate: onUpdate
        )
    }
}

extension SortFilterMenu where ApplyActionView == Action {
    public init(
    @ViewBuilder items: () -> Items,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder resetAction: () -> ResetActionView,
		onUpdate: (() -> Void)? = nil
    ) {
        self.init(
            items: items,
			cancelAction: cancelAction,
			resetAction: resetAction,
			applyAction: { Action(model: _ApplyActionDefault()) },
			onUpdate: onUpdate
        )
    }
}

extension SortFilterMenu where CancelActionView == Action, ResetActionView == Action {
    public init(
    @ViewBuilder items: () -> Items,
		@ViewBuilder applyAction: () -> ApplyActionView,
		onUpdate: (() -> Void)? = nil
    ) {
        self.init(
            items: items,
			cancelAction: { Action(model: _CancelActionDefault()) },
			resetAction: { Action(model: _ResetActionDefault()) },
			applyAction: applyAction,
			onUpdate: onUpdate
        )
    }
}

extension SortFilterMenu where CancelActionView == Action, ApplyActionView == Action {
    public init(
    @ViewBuilder items: () -> Items,
		@ViewBuilder resetAction: () -> ResetActionView,
		onUpdate: (() -> Void)? = nil
    ) {
        self.init(
            items: items,
			cancelAction: { Action(model: _CancelActionDefault()) },
			resetAction: resetAction,
			applyAction: { Action(model: _ApplyActionDefault()) },
			onUpdate: onUpdate
        )
    }
}

extension SortFilterMenu where ResetActionView == Action, ApplyActionView == Action {
    public init(
    @ViewBuilder items: () -> Items,
		@ViewBuilder cancelAction: () -> CancelActionView,
		onUpdate: (() -> Void)? = nil
    ) {
        self.init(
            items: items,
			cancelAction: cancelAction,
			resetAction: { Action(model: _ResetActionDefault()) },
			applyAction: { Action(model: _ApplyActionDefault()) },
			onUpdate: onUpdate
        )
    }
}

extension SortFilterMenu where CancelActionView == Action, ResetActionView == Action, ApplyActionView == Action {
    public init(
    @ViewBuilder items: () -> Items,
		onUpdate: (() -> Void)? = nil
    ) {
        self.init(
            items: items,
			cancelAction: { Action(model: _CancelActionDefault()) },
			resetAction: { Action(model: _ResetActionDefault()) },
			applyAction: { Action(model: _ApplyActionDefault()) },
			onUpdate: onUpdate
        )
    }
}
