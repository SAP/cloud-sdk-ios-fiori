// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct _SortFilterView<Title: View, Items: View, CancelActionView: View, ResetActionView: View, ApplyActionView: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.itemsModifier) private var itemsModifier
	@Environment(\.cancelActionModifier) private var cancelActionModifier
	@Environment(\.resetActionModifier) private var resetActionModifier
	@Environment(\.applyActionModifier) private var applyActionModifier
	@Environment(\.dismiss) var dismiss

    let _title: Title
	var _items: Items
	let _cancelAction: CancelActionView
	let _resetAction: ResetActionView
	let _applyAction: ApplyActionView
	let _onUpdate: (() -> Void)?
	@State var size: CGSize = .zero
	@StateObject var context: SortFilterContext = SortFilterContext()
	let popoverWidth = 393.0

    private var isModelInit: Bool = false
	private var isCancelActionNil: Bool = false
	private var isResetActionNil: Bool = false
	private var isApplyActionNil: Bool = false
	private var isOnUpdateNil: Bool = false

    public init(
        @ViewBuilder title: () -> Title,
		@ViewBuilder items: () -> Items,
		@ViewBuilder cancelAction: () -> CancelActionView,
		@ViewBuilder resetAction: () -> ResetActionView,
		@ViewBuilder applyAction: () -> ApplyActionView,
		onUpdate: (() -> Void)? = nil
        ) {
            self._title = title()
			self._items = items()
			self._cancelAction = cancelAction()
			self._resetAction = resetAction()
			self._applyAction = applyAction()
			self._onUpdate = onUpdate
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori._SortFilterView.title).concat(Fiori._SortFilterView.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori._SortFilterView.title))
        }
    }
	@ViewBuilder var items: some View {
        if isModelInit {
            _items.modifier(itemsModifier.concat(Fiori._SortFilterView.items).concat(Fiori._SortFilterView.itemsCumulative))
        } else {
            _items.modifier(itemsModifier.concat(Fiori._SortFilterView.items))
        }
    }
	@ViewBuilder var cancelAction: some View {
        if isModelInit {
            _cancelAction.modifier(cancelActionModifier.concat(Fiori._SortFilterView.cancelAction).concat(Fiori._SortFilterView.cancelActionCumulative))
        } else {
            _cancelAction.modifier(cancelActionModifier.concat(Fiori._SortFilterView.cancelAction))
        }
    }
	@ViewBuilder var resetAction: some View {
        if isModelInit {
            _resetAction.modifier(resetActionModifier.concat(Fiori._SortFilterView.resetAction).concat(Fiori._SortFilterView.resetActionCumulative))
        } else {
            _resetAction.modifier(resetActionModifier.concat(Fiori._SortFilterView.resetAction))
        }
    }
	@ViewBuilder var applyAction: some View {
        if isModelInit {
            _applyAction.modifier(applyActionModifier.concat(Fiori._SortFilterView.applyAction).concat(Fiori._SortFilterView.applyActionCumulative))
        } else {
            _applyAction.modifier(applyActionModifier.concat(Fiori._SortFilterView.applyAction))
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

extension _SortFilterView where Title == Text,
		Items == _SortFilterCFGItemContainer,
		CancelActionView == _ConditionalContent<_Action, EmptyView>,
		ResetActionView == _ConditionalContent<_Action, EmptyView>,
		ApplyActionView == _ConditionalContent<_Action, EmptyView> {

    public init(model: _SortFilterViewModel) {
        self.init(title: model.title, items: Binding<[[_SortFilterItem]]>(get: { model.items }, set: { model.items = $0 }), cancelAction: model.cancelAction != nil ? _Action(model: model.cancelAction!) : nil, resetAction: model.resetAction != nil ? _Action(model: model.resetAction!) : nil, applyAction: model.applyAction != nil ? _Action(model: model.applyAction!) : nil, onUpdate: model.onUpdate)
    }

    public init(title: String, items: Binding<[[_SortFilterItem]]>, cancelAction: _Action? = _Action(model: _CancelActionDefault()), resetAction: _Action? = _Action(model: _ResetActionDefault()), applyAction: _Action? = _Action(model: _ApplyActionDefault()), onUpdate: (() -> Void)? = nil) {
        self._title = Text(title)
		self._items = _SortFilterCFGItemContainer(items: items)
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
