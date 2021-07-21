// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct EULAView<Title: View, HtmlContent: View, ActionText: View, SecondaryActionText: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.htmlContentModifier) private var htmlContentModifier
	@Environment(\.actionTextModifier) private var actionTextModifier
	@Environment(\.secondaryActionTextModifier) private var secondaryActionTextModifier
	@Environment(\.presentationMode) var presentationMode

    let _title: Title
	let _htmlContent: HtmlContent
	let _actionText: ActionText
	let _secondaryActionText: SecondaryActionText
	@State var contentHeight: CGFloat = .zero

    private var isModelInit: Bool = false
	private var isHtmlContentNil: Bool = false
	private var isActionTextNil: Bool = false
	private var isSecondaryActionTextNil: Bool = false

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder htmlContent: @escaping () -> HtmlContent,
		@ViewBuilder actionText: @escaping () -> ActionText,
		@ViewBuilder secondaryActionText: @escaping () -> SecondaryActionText
        ) {
            self._title = title()
			self._htmlContent = htmlContent()
			self._actionText = actionText()
			self._secondaryActionText = secondaryActionText()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.EULAView.title).concat(Fiori.EULAView.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.EULAView.title))
        }
    }
	@ViewBuilder var htmlContent: some View {
        if isModelInit {
            _htmlContent.modifier(htmlContentModifier.concat(Fiori.EULAView.htmlContent).concat(Fiori.EULAView.htmlContentCumulative))
        } else {
            _htmlContent.modifier(htmlContentModifier.concat(Fiori.EULAView.htmlContent))
        }
    }
	@ViewBuilder var actionText: some View {
        if isModelInit {
            _actionText.modifier(actionTextModifier.concat(Fiori.EULAView.actionText).concat(Fiori.EULAView.actionTextCumulative))
        } else {
            _actionText.modifier(actionTextModifier.concat(Fiori.EULAView.actionText))
        }
    }
	@ViewBuilder var secondaryActionText: some View {
        if isModelInit {
            _secondaryActionText.modifier(secondaryActionTextModifier.concat(Fiori.EULAView.secondaryActionText).concat(Fiori.EULAView.secondaryActionTextCumulative))
        } else {
            _secondaryActionText.modifier(secondaryActionTextModifier.concat(Fiori.EULAView.secondaryActionText))
        }
    }
    
	var isHtmlContentEmptyView: Bool {
        ((isModelInit && isHtmlContentNil) || HtmlContent.self == EmptyView.self) ? true : false
    }

	var isActionTextEmptyView: Bool {
        ((isModelInit && isActionTextNil) || ActionText.self == EmptyView.self) ? true : false
    }

	var isSecondaryActionTextEmptyView: Bool {
        ((isModelInit && isSecondaryActionTextNil) || SecondaryActionText.self == EmptyView.self) ? true : false
    }
}

extension EULAView where Title == Text,
		HtmlContent == _ConditionalContent<HTMLView, EmptyView>,
		ActionText == _ConditionalContent<Action, EmptyView>,
		SecondaryActionText == _ConditionalContent<SecondaryAction, EmptyView> {

    public init(model: EULAViewModel) {
        self.init(title: model.title_, htmlContent: model.htmlContent_, actionText: model.actionText_, secondaryActionText: model.secondaryActionText_, didSelectAction: model.didSelectAction, didSelectSecondaryAction: model.didSelectSecondaryAction)
    }

    public init(title: String, htmlContent: NSAttributedString? = nil, actionText: String? = nil, secondaryActionText: String? = nil, didSelectAction: (() -> Void)? = nil, didSelectSecondaryAction: (() -> Void)? = nil) {
        self._title = Text(title)
		// handle HTMLViewModel
        if (htmlContent != nil) {
            self._htmlContent = ViewBuilder.buildEither(first: HTMLView(htmlContent: htmlContent))
        } else {
            self._htmlContent = ViewBuilder.buildEither(second: EmptyView())
        }
		// handle ActionModel
        if (actionText != nil) {
            self._actionText = ViewBuilder.buildEither(first: Action(actionText: actionText,didSelectAction: didSelectAction))
        } else {
            self._actionText = ViewBuilder.buildEither(second: EmptyView())
        }
		// handle SecondaryActionModel
        if (secondaryActionText != nil) {
            self._secondaryActionText = ViewBuilder.buildEither(first: SecondaryAction(secondaryActionText: secondaryActionText,didSelectSecondaryAction: didSelectSecondaryAction))
        } else {
            self._secondaryActionText = ViewBuilder.buildEither(second: EmptyView())
        }

		isModelInit = true
		isHtmlContentNil = htmlContent == nil ? true : false
		isActionTextNil = actionText == nil ? true : false
		isSecondaryActionTextNil = secondaryActionText == nil ? true : false
    }
}
