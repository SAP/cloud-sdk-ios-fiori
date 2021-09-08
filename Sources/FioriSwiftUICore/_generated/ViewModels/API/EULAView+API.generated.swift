// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct EULAView<Title: View, HtmlView: View, ActionView: View, SecondaryActionView: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.htmlViewModifier) private var htmlViewModifier
	@Environment(\.actionModifier) private var actionModifier
	@Environment(\.secondaryActionModifier) private var secondaryActionModifier
	@Environment(\.presentationMode) var presentationMode

    let _title: Title
	let _htmlView: HtmlView
	let _action: ActionView
	let _secondaryAction: SecondaryActionView
	@State var contentHeight: CGFloat = .zero

    private var isModelInit: Bool = false
	private var isHtmlViewNil: Bool = false
	private var isActionNil: Bool = false
	private var isSecondaryActionNil: Bool = false

    public init(
        @ViewBuilder title: () -> Title,
		@ViewBuilder htmlView: () -> HtmlView,
		@ViewBuilder action: () -> ActionView,
		@ViewBuilder secondaryAction: () -> SecondaryActionView
        ) {
            self._title = title()
			self._htmlView = htmlView()
			self._action = action()
			self._secondaryAction = secondaryAction()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.EULAView.title).concat(Fiori.EULAView.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.EULAView.title))
        }
    }
	@ViewBuilder var htmlView: some View {
        if isModelInit {
            _htmlView.modifier(htmlViewModifier.concat(Fiori.EULAView.htmlView).concat(Fiori.EULAView.htmlViewCumulative))
        } else {
            _htmlView.modifier(htmlViewModifier.concat(Fiori.EULAView.htmlView))
        }
    }
	@ViewBuilder var action: some View {
        if isModelInit {
            _action.modifier(actionModifier.concat(Fiori.EULAView.action).concat(Fiori.EULAView.actionCumulative))
        } else {
            _action.modifier(actionModifier.concat(Fiori.EULAView.action))
        }
    }
	@ViewBuilder var secondaryAction: some View {
        if isModelInit {
            _secondaryAction.modifier(secondaryActionModifier.concat(Fiori.EULAView.secondaryAction).concat(Fiori.EULAView.secondaryActionCumulative))
        } else {
            _secondaryAction.modifier(secondaryActionModifier.concat(Fiori.EULAView.secondaryAction))
        }
    }
    
	var isHtmlViewEmptyView: Bool {
        ((isModelInit && isHtmlViewNil) || HtmlView.self == EmptyView.self) ? true : false
    }

	var isActionEmptyView: Bool {
        ((isModelInit && isActionNil) || Action.self == EmptyView.self) ? true : false
    }

	var isSecondaryActionEmptyView: Bool {
        ((isModelInit && isSecondaryActionNil) || SecondaryAction.self == EmptyView.self) ? true : false
    }
}

extension EULAView where Title == Text,
		HtmlView == _ConditionalContent<HTMLView, EmptyView>,
		ActionView == _ConditionalContent<Action, EmptyView>,
		SecondaryActionView == _ConditionalContent<SecondaryAction, EmptyView> {

    public init(model: EULAViewModel) {
        self.init(title: model.title, htmlView: model.htmlView != nil ? HTMLView(model: model.htmlView!) : nil, action: model.action != nil ? Action(model: model.action!) : nil, secondaryAction: model.secondaryAction != nil ? SecondaryAction(model: model.secondaryAction!) : nil)
    }

    public init(title: String, htmlView: HTMLView? = nil, action: Action? = nil, secondaryAction: SecondaryAction? = nil) {
        self._title = Text(title)
		self._htmlView = htmlView != nil ? ViewBuilder.buildEither(first: htmlView!) : ViewBuilder.buildEither(second: EmptyView())
		self._action = action != nil ? ViewBuilder.buildEither(first: action!) : ViewBuilder.buildEither(second: EmptyView())
		self._secondaryAction = secondaryAction != nil ? ViewBuilder.buildEither(first: secondaryAction!) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isHtmlViewNil = htmlView == nil ? true : false
		isActionNil = action == nil ? true : false
		isSecondaryActionNil = secondaryAction == nil ? true : false
    }
}
