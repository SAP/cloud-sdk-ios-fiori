// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct UserConsent<ActionTitle: View, FirstActionTitle: View, SecondActionTitle: View> {
    @Environment(\.actionTitleModifier) private var actionTitleModifier
	@Environment(\.firstActionTitleModifier) private var firstActionTitleModifier
	@Environment(\.secondActionTitleModifier) private var secondActionTitleModifier
	@Environment(\.presentationMode) var presentationMode

    let _forms: [UserConsentFormData]
	let _currentPageIndex: Binding<Int>
	let _currentFormIndex: Binding<Int>
	let _itemAccepted: Binding<[Int]>
	let _actionTitle: ActionTitle
	let _firstActionTitle: FirstActionTitle
	let _secondActionTitle: SecondActionTitle
	var _onCancel: (() -> Void)? = nil
	let tableName = "FioriSwiftUICore"
	@State var currentState: UserConsentState = .userConsentInit
	let bundle = Bundle.module
	@State var numAccepted: Int = 0
	@State var contentHeight: CGFloat = .zero
    private var isModelInit: Bool = false
	private var isActionTitleNil: Bool = false
	private var isFirstActionTitleNil: Bool = false
	private var isSecondActionTitleNil: Bool = false

    public init(
        forms: [UserConsentFormData],
		currentPageIndex: Binding<Int>,
		currentFormIndex: Binding<Int>,
		itemAccepted: Binding<[Int]>,
		@ViewBuilder actionTitle: @escaping () -> ActionTitle,
		@ViewBuilder firstActionTitle: @escaping () -> FirstActionTitle,
		@ViewBuilder secondActionTitle: @escaping () -> SecondActionTitle
        ) {
            self._forms = forms
			self._currentPageIndex = currentPageIndex
			self._currentFormIndex = currentFormIndex
			self._itemAccepted = itemAccepted
			self._actionTitle = actionTitle()
			self._firstActionTitle = firstActionTitle()
			self._secondActionTitle = secondActionTitle()
    }

    @ViewBuilder var actionTitle: some View {
        if isModelInit {
            _actionTitle.modifier(actionTitleModifier.concat(Fiori.UserConsent.actionTitle).concat(Fiori.UserConsent.actionTitleCumulative))
        } else {
            _actionTitle.modifier(actionTitleModifier.concat(Fiori.UserConsent.actionTitle))
        }
    }
	@ViewBuilder var firstActionTitle: some View {
        if isModelInit {
            _firstActionTitle.modifier(firstActionTitleModifier.concat(Fiori.UserConsent.firstActionTitle).concat(Fiori.UserConsent.firstActionTitleCumulative))
        } else {
            _firstActionTitle.modifier(firstActionTitleModifier.concat(Fiori.UserConsent.firstActionTitle))
        }
    }
	@ViewBuilder var secondActionTitle: some View {
        if isModelInit {
            _secondActionTitle.modifier(secondActionTitleModifier.concat(Fiori.UserConsent.secondActionTitle).concat(Fiori.UserConsent.secondActionTitleCumulative))
        } else {
            _secondActionTitle.modifier(secondActionTitleModifier.concat(Fiori.UserConsent.secondActionTitle))
        }
    }
    
	var isActionTitleEmptyView: Bool {
        ((isModelInit && isActionTitleNil) || ActionTitle.self == EmptyView.self) ? true : false
    }

	var isFirstActionTitleEmptyView: Bool {
        ((isModelInit && isFirstActionTitleNil) || FirstActionTitle.self == EmptyView.self) ? true : false
    }

	var isSecondActionTitleEmptyView: Bool {
        ((isModelInit && isSecondActionTitleNil) || SecondActionTitle.self == EmptyView.self) ? true : false
    }
}

extension UserConsent where ActionTitle == _ConditionalContent<Text, EmptyView>,
		FirstActionTitle == _ConditionalContent<Text, EmptyView>,
		SecondActionTitle == _ConditionalContent<Text, EmptyView> {

    public init(model: UserConsentModel) {
        self.init(forms: model.forms_, currentPageIndex: model.currentPageIndex_, currentFormIndex: model.currentFormIndex_, itemAccepted: model.itemAccepted_, actionTitle: model.actionTitle_, firstActionTitle: model.firstActionTitle_, secondActionTitle: model.secondActionTitle_, onCancel: model.onCancel)
    }

    public init(forms: [UserConsentFormData] = [], currentPageIndex: Binding<Int>, currentFormIndex: Binding<Int>, itemAccepted: Binding<[Int]>, actionTitle: String? = nil, firstActionTitle: String? = nil, secondActionTitle: String? = nil, onCancel: (() -> Void)? = nil) {
        self._forms = forms
		self._currentPageIndex = currentPageIndex
		self._currentFormIndex = currentFormIndex
		self._itemAccepted = itemAccepted
		self._actionTitle = actionTitle != nil ? ViewBuilder.buildEither(first: Text(actionTitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._firstActionTitle = firstActionTitle != nil ? ViewBuilder.buildEither(first: Text(firstActionTitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._secondActionTitle = secondActionTitle != nil ? ViewBuilder.buildEither(first: Text(secondActionTitle!)) : ViewBuilder.buildEither(second: EmptyView())
		self._onCancel = onCancel

		isModelInit = true
		isActionTitleNil = actionTitle == nil ? true : false
		isFirstActionTitleNil = firstActionTitle == nil ? true : false
		isSecondActionTitleNil = secondActionTitle == nil ? true : false
    }
}
