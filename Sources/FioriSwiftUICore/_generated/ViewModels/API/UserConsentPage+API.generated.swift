// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct UserConsentPage<Title: View, BodyText: View, Footnote: View, HtmlView: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.bodyTextModifier) private var bodyTextModifier
	@Environment(\.footnoteModifier) private var footnoteModifier
	@Environment(\.htmlViewModifier) private var htmlViewModifier

    let _title: Title
	let _bodyText: BodyText
	let _footnote: Footnote
	let _htmlView: HtmlView
	let tableName = "FioriSwiftUICore"
	@State var contentHeight: CGFloat = .zero
	let bundle = Bundle.module

    private var isModelInit: Bool = false
	private var isBodyTextNil: Bool = false
	private var isFootnoteNil: Bool = false
	private var isHtmlViewNil: Bool = false

    public init(
        @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder htmlView: () -> HtmlView
        ) {
            self._title = title()
			self._bodyText = bodyText()
			self._footnote = footnote()
			self._htmlView = htmlView()
    }

    @ViewBuilder var title: some View {
        if isModelInit {
            _title.modifier(titleModifier.concat(Fiori.UserConsentPage.title).concat(Fiori.UserConsentPage.titleCumulative))
        } else {
            _title.modifier(titleModifier.concat(Fiori.UserConsentPage.title))
        }
    }
	@ViewBuilder var bodyText: some View {
        if isModelInit {
            _bodyText.modifier(bodyTextModifier.concat(Fiori.UserConsentPage.bodyText).concat(Fiori.UserConsentPage.bodyTextCumulative))
        } else {
            _bodyText.modifier(bodyTextModifier.concat(Fiori.UserConsentPage.bodyText))
        }
    }
	@ViewBuilder var footnote: some View {
        if isModelInit {
            _footnote.modifier(footnoteModifier.concat(Fiori.UserConsentPage.footnote).concat(Fiori.UserConsentPage.footnoteCumulative))
        } else {
            _footnote.modifier(footnoteModifier.concat(Fiori.UserConsentPage.footnote))
        }
    }
	@ViewBuilder var htmlView: some View {
        if isModelInit {
            _htmlView.modifier(htmlViewModifier.concat(Fiori.UserConsentPage.htmlView).concat(Fiori.UserConsentPage.htmlViewCumulative))
        } else {
            _htmlView.modifier(htmlViewModifier.concat(Fiori.UserConsentPage.htmlView))
        }
    }
    
	var isBodyTextEmptyView: Bool {
        ((isModelInit && isBodyTextNil) || BodyText.self == EmptyView.self) ? true : false
    }

	var isFootnoteEmptyView: Bool {
        ((isModelInit && isFootnoteNil) || Footnote.self == EmptyView.self) ? true : false
    }

	var isHtmlViewEmptyView: Bool {
        ((isModelInit && isHtmlViewNil) || HtmlView.self == EmptyView.self) ? true : false
    }
}

extension UserConsentPage where Title == Text,
		BodyText == _ConditionalContent<Text, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView>,
		HtmlView == _ConditionalContent<HTMLView, EmptyView> {

    public init(model: UserConsentPageModel) {
        self.init(title: model.title, bodyText: model.bodyText, footnote: model.footnote, htmlView: model.htmlView != nil ? HTMLView(model: model.htmlView!) : nil)
    }

    public init(title: String, bodyText: String? = nil, footnote: String? = nil, htmlView: HTMLView? = nil) {
        self._title = Text(title)
		self._bodyText = bodyText != nil ? ViewBuilder.buildEither(first: Text(bodyText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
		self._htmlView = htmlView != nil ? ViewBuilder.buildEither(first: htmlView!) : ViewBuilder.buildEither(second: EmptyView())

		isModelInit = true
		isBodyTextNil = bodyText == nil ? true : false
		isFootnoteNil = footnote == nil ? true : false
		isHtmlViewNil = htmlView == nil ? true : false
    }
}
