// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension SortFilterView where CancelActionView == _Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder items: () -> Items,
		@ViewBuilder resetAction: () -> ResetActionView,
		@ViewBuilder applyAction: () -> ApplyActionView,
		onUpdate: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			items: items,
			cancelAction: { _Action(model: _CancelActionDefault()) },
			resetAction: resetAction,
			applyAction: applyAction,
			onUpdate: onUpdate
        )
    }
}

extension SortFilterView where ResetActionView == _Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder items: () -> Items,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder applyAction: () -> ApplyActionView,
		onUpdate: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			items: items,
			cancelAction: cancelAction,
			resetAction: { _Action(model: _ResetActionDefault()) },
			applyAction: applyAction,
			onUpdate: onUpdate
        )
    }
}

extension SortFilterView where ApplyActionView == _Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder items: () -> Items,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder resetAction: () -> ResetActionView,
		onUpdate: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			items: items,
			cancelAction: cancelAction,
			resetAction: resetAction,
			applyAction: { _Action(model: _ApplyActionDefault()) },
			onUpdate: onUpdate
        )
    }
}

extension SortFilterView where CancelActionView == _Action, ResetActionView == _Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder items: () -> Items,
		@ViewBuilder applyAction: () -> ApplyActionView,
		onUpdate: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			items: items,
			cancelAction: { _Action(model: _CancelActionDefault()) },
			resetAction: { _Action(model: _ResetActionDefault()) },
			applyAction: applyAction,
			onUpdate: onUpdate
        )
    }
}

extension SortFilterView where CancelActionView == _Action, ApplyActionView == _Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder items: () -> Items,
		@ViewBuilder resetAction: () -> ResetActionView,
		onUpdate: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			items: items,
			cancelAction: { _Action(model: _CancelActionDefault()) },
			resetAction: resetAction,
			applyAction: { _Action(model: _ApplyActionDefault()) },
			onUpdate: onUpdate
        )
    }
}

extension SortFilterView where ResetActionView == _Action, ApplyActionView == _Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder items: () -> Items,
		@ViewBuilder cancelAction: () -> CancelActionView,
		onUpdate: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			items: items,
			cancelAction: cancelAction,
			resetAction: { _Action(model: _ResetActionDefault()) },
			applyAction: { _Action(model: _ApplyActionDefault()) },
			onUpdate: onUpdate
        )
    }
}

extension SortFilterView where CancelActionView == _Action, ResetActionView == _Action, ApplyActionView == _Action {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder items: () -> Items,
		onUpdate: (() -> Void)? = nil
    ) {
        self.init(
            title: title,
			items: items,
			cancelAction: { _Action(model: _CancelActionDefault()) },
			resetAction: { _Action(model: _ResetActionDefault()) },
			applyAction: { _Action(model: _ApplyActionDefault()) },
			onUpdate: onUpdate
        )
    }
}
