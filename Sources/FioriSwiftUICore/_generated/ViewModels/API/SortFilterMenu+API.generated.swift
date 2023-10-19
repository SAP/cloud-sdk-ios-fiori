// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct SortFilterMenu<Items: View, CancelActionView: View, ResetActionView: View, ApplyActionView: View> {
    @Environment(\.itemsModifier) private var itemsModifier
	@Environment(\.cancelActionModifier) private var cancelActionModifier
	@Environment(\.resetActionModifier) private var resetActionModifier
	@Environment(\.applyActionModifier) private var applyActionModifier

    var _items: Items
	let _cancelAction: CancelActionView
	let _resetAction: ResetActionView
	let _applyAction: ApplyActionView
	var _onUpdate: (() -> Void)?
	

    private var isModelInit: Bool = false
	private var isCancelActionNil: Bool = false
	private var isResetActionNil: Bool = false
	private var isApplyActionNil: Bool = false
	private var isOnUpdateNil: Bool = false

    public init(
        @ViewBuilder items: () -> Items,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder resetAction: () -> ResetActionView,
		@ViewBuilder applyAction: () -> ApplyActionView,
		onUpdate: (() -> Void)? = nil
        ) {
            self._items = items()
			self._cancelAction = cancelAction()
			self._resetAction = resetAction()
			self._applyAction = applyAction()
			self._onUpdate = onUpdate
    }

    @ViewBuilder var items: some View {
        if isModelInit {
            _items.modifier(itemsModifier.concat(Fiori.SortFilterMenu.items).concat(Fiori.SortFilterMenu.itemsCumulative))
        } else {
            _items.modifier(itemsModifier.concat(Fiori.SortFilterMenu.items))
        }
    }
	@ViewBuilder var cancelAction: some View {
        if isModelInit {
            _cancelAction.modifier(cancelActionModifier.concat(Fiori.SortFilterMenu.cancelAction).concat(Fiori.SortFilterMenu.cancelActionCumulative))
        } else {
            _cancelAction.modifier(cancelActionModifier.concat(Fiori.SortFilterMenu.cancelAction))
        }
    }
	@ViewBuilder var resetAction: some View {
        if isModelInit {
            _resetAction.modifier(resetActionModifier.concat(Fiori.SortFilterMenu.resetAction).concat(Fiori.SortFilterMenu.resetActionCumulative))
        } else {
            _resetAction.modifier(resetActionModifier.concat(Fiori.SortFilterMenu.resetAction))
        }
    }
	@ViewBuilder var applyAction: some View {
        if isModelInit {
            _applyAction.modifier(applyActionModifier.concat(Fiori.SortFilterMenu.applyAction).concat(Fiori.SortFilterMenu.applyActionCumulative))
        } else {
            _applyAction.modifier(applyActionModifier.concat(Fiori.SortFilterMenu.applyAction))
        }
    }
    
	var isCancelActionEmptyView: Bool {
        ((isModelInit && isCancelActionNil) || CancelActionView.self == EmptyView.self) ? true : false
    }

	var isResetActionEmptyView: Bool {
        ((isModelInit && isResetActionNil) || ResetActionView.self == EmptyView.self) ? true : false
    }

	var isApplyActionEmptyView: Bool {
        ((isModelInit && isApplyActionNil) || ApplyActionView.self == EmptyView.self) ? true : false
    }
}

extension SortFilterMenu where Items == _SortFilterMenuItemContainer,
		CancelActionView == _ConditionalContent<Action, EmptyView>,
		ResetActionView == _ConditionalContent<Action, EmptyView>,
		ApplyActionView == _ConditionalContent<Action, EmptyView> {

    public init(model: SortFilterMenuModel) {
        self.init(items: Binding<[[SortFilterItem]]>(get: { model.items }, set: { model.items = $0 }), cancelAction: model.cancelAction != nil ? Action(model: model.cancelAction!) : nil, resetAction: model.resetAction != nil ? Action(model: model.resetAction!) : nil, applyAction: model.applyAction != nil ? Action(model: model.applyAction!) : nil, onUpdate: model.onUpdate)
    }

    public init(items: Binding<[[SortFilterItem]]>, cancelAction: Action? = Action(model: _CancelActionDefault()), resetAction: Action? = Action(model: _ResetActionDefault()), applyAction: Action? = Action(model: _ApplyActionDefault()), onUpdate: (() -> Void)? = nil) {
        self._items = _SortFilterMenuItemContainer(items: items)
		self._cancelAction = cancelAction != nil ? ViewBuilder.buildEither(first: cancelAction!) : ViewBuilder.buildEither(second: EmptyView())
		self._resetAction = resetAction != nil ? ViewBuilder.buildEither(first: resetAction!) : ViewBuilder.buildEither(second: EmptyView())
		self._applyAction = applyAction != nil ? ViewBuilder.buildEither(first: applyAction!) : ViewBuilder.buildEither(second: EmptyView())
		self._onUpdate = onUpdate

		isModelInit = true
		isCancelActionNil = cancelAction == nil ? true : false
		isResetActionNil = resetAction == nil ? true : false
		isApplyActionNil = applyAction == nil ? true : false
		isOnUpdateNil = onUpdate == nil ? true : false
    }
}
