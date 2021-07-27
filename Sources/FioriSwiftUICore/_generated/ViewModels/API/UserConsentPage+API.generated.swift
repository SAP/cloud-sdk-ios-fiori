// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct UserConsentPage<Title: View, BodyText: View, HtmlContent: View, Footnote: View> {
    @Environment(\.titleModifier) private var titleModifier
	@Environment(\.bodyTextModifier) private var bodyTextModifier
	@Environment(\.htmlContentModifier) private var htmlContentModifier
	@Environment(\.footnoteModifier) private var footnoteModifier

    let _title: Title
	let _bodyText: BodyText
	let _htmlContent: HtmlContent
	let _footnote: Footnote
	let tableName = "FioriSwiftUICore"
	@State var contentHeight: CGFloat = .zero
	let bundle = Bundle.module

    private var isModelInit: Bool = false
	private var isBodyTextNil: Bool = false
	private var isHtmlContentNil: Bool = false
	private var isFootnoteNil: Bool = false

    public init(
        @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder htmlContent: @escaping () -> HtmlContent,
		@ViewBuilder footnote: @escaping () -> Footnote
        ) {
            self._title = title()
			self._bodyText = bodyText()
			self._htmlContent = htmlContent()
			self._footnote = footnote()
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
	@ViewBuilder var htmlContent: some View {
        if isModelInit {
            _htmlContent.modifier(htmlContentModifier.concat(Fiori.UserConsentPage.htmlContent).concat(Fiori.UserConsentPage.htmlContentCumulative))
        } else {
            _htmlContent.modifier(htmlContentModifier.concat(Fiori.UserConsentPage.htmlContent))
        }
    }
	@ViewBuilder var footnote: some View {
        if isModelInit {
            _footnote.modifier(footnoteModifier.concat(Fiori.UserConsentPage.footnote).concat(Fiori.UserConsentPage.footnoteCumulative))
        } else {
            _footnote.modifier(footnoteModifier.concat(Fiori.UserConsentPage.footnote))
        }
    }
    
	var isBodyTextEmptyView: Bool {
        ((isModelInit && isBodyTextNil) || BodyText.self == EmptyView.self) ? true : false
    }

	var isHtmlContentEmptyView: Bool {
        ((isModelInit && isHtmlContentNil) || HtmlContent.self == EmptyView.self) ? true : false
    }

	var isFootnoteEmptyView: Bool {
        ((isModelInit && isFootnoteNil) || Footnote.self == EmptyView.self) ? true : false
    }
}

extension UserConsentPage where Title == Text,
		BodyText == _ConditionalContent<Text, EmptyView>,
		HtmlContent == _ConditionalContent<HTMLView, EmptyView>,
		Footnote == _ConditionalContent<Text, EmptyView> {

    public init(model: UserConsentPageModel) {
        self.init(title: model.title_, bodyText: model.bodyText_, htmlContent: model.htmlContent_, footnote: model.footnote_)
    }

    public init(title: String, bodyText: String? = nil, htmlContent: NSAttributedString? = nil, footnote: String? = nil) {
        self._title = Text(title)
		self._bodyText = bodyText != nil ? ViewBuilder.buildEither(first: Text(bodyText!)) : ViewBuilder.buildEither(second: EmptyView())
		self._footnote = footnote != nil ? ViewBuilder.buildEither(first: Text(footnote!)) : ViewBuilder.buildEither(second: EmptyView())
		// handle HTMLViewModel
        if (htmlContent != nil) {
            self._htmlContent = ViewBuilder.buildEither(first: HTMLView(htmlContent: htmlContent))
        } else {
            self._htmlContent = ViewBuilder.buildEither(second: EmptyView())
        }

		isModelInit = true
		isBodyTextNil = bodyText == nil ? true : false
		isHtmlContentNil = htmlContent == nil ? true : false
		isFootnoteNil = footnote == nil ? true : false
    }
}
