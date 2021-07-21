// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension UserConsentPage where BodyText == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder htmlContent: @escaping () -> HtmlContent,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			bodyText: { EmptyView() },
			htmlContent: htmlContent,
			footnote: footnote
        )
    }
}

extension UserConsentPage where Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder htmlContent: @escaping () -> HtmlContent
    ) {
        self.init(
            title: title,
			bodyText: bodyText,
			htmlContent: htmlContent,
			footnote: { EmptyView() }
        )
    }
}

extension UserConsentPage where HtmlContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			bodyText: bodyText,
			htmlContent: { EmptyView() },
			footnote: footnote
        )
    }
}

extension UserConsentPage where BodyText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder htmlContent: @escaping () -> HtmlContent
    ) {
        self.init(
            title: title,
			bodyText: { EmptyView() },
			htmlContent: htmlContent,
			footnote: { EmptyView() }
        )
    }
}

extension UserConsentPage where BodyText == EmptyView, HtmlContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder footnote: @escaping () -> Footnote
    ) {
        self.init(
            title: title,
			bodyText: { EmptyView() },
			htmlContent: { EmptyView() },
			footnote: footnote
        )
    }
}

extension UserConsentPage where Footnote == EmptyView, HtmlContent == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder bodyText: @escaping () -> BodyText
    ) {
        self.init(
            title: title,
			bodyText: bodyText,
			htmlContent: { EmptyView() },
			footnote: { EmptyView() }
        )
    }
}
