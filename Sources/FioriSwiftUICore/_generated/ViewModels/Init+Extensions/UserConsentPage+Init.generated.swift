// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension UserConsentPage where BodyText == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote,
		@ViewBuilder htmlView: () -> HtmlView
    ) {
        self.init(
            title: title,
			bodyText: { EmptyView() },
			footnote: footnote,
			htmlView: htmlView
        )
    }
}

extension UserConsentPage where Footnote == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder htmlView: () -> HtmlView
    ) {
        self.init(
            title: title,
			bodyText: bodyText,
			footnote: { EmptyView() },
			htmlView: htmlView
        )
    }
}

extension UserConsentPage where HtmlView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText,
		@ViewBuilder footnote: () -> Footnote
    ) {
        self.init(
            title: title,
			bodyText: bodyText,
			footnote: footnote,
			htmlView: { EmptyView() }
        )
    }
}

extension UserConsentPage where BodyText == EmptyView, Footnote == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder htmlView: () -> HtmlView
    ) {
        self.init(
            title: title,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			htmlView: htmlView
        )
    }
}

extension UserConsentPage where BodyText == EmptyView, HtmlView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder footnote: () -> Footnote
    ) {
        self.init(
            title: title,
			bodyText: { EmptyView() },
			footnote: footnote,
			htmlView: { EmptyView() }
        )
    }
}

extension UserConsentPage where Footnote == EmptyView, HtmlView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder bodyText: () -> BodyText
    ) {
        self.init(
            title: title,
			bodyText: bodyText,
			footnote: { EmptyView() },
			htmlView: { EmptyView() }
        )
    }
}

extension UserConsentPage where BodyText == EmptyView, Footnote == EmptyView, HtmlView == EmptyView {
    public init(
    @ViewBuilder title: () -> Title
    ) {
        self.init(
            title: title,
			bodyText: { EmptyView() },
			footnote: { EmptyView() },
			htmlView: { EmptyView() }
        )
    }
}
