// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/UserConsentPage+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement UserConsentPage `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum UserConsentPage {
        typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier
		typealias BodyText = EmptyModifier
        typealias BodyTextCumulative = EmptyModifier
		typealias HtmlContent = EmptyModifier
        typealias HtmlContentCumulative = EmptyModifier
		typealias Footnote = EmptyModifier
        typealias FootnoteCumulative = EmptyModifier

        // TODO: - substitute type-specific ViewModifier for EmptyModifier
        /*
            // replace `typealias Subtitle = EmptyModifier` with:

            struct Subtitle: ViewModifier {
                func body(content: Content) -> some View {
                    content
                        .font(.body)
                        .foregroundColor(.preferredColor(.primary3))
                }
            }
        */
        static let title = Title()
		static let bodyText = BodyText()
		static let htmlContent = HtmlContent()
		static let footnote = Footnote()
        static let titleCumulative = TitleCumulative()
		static let bodyTextCumulative = BodyTextCumulative()
		static let htmlContentCumulative = HtmlContentCumulative()
		static let footnoteCumulative = FootnoteCumulative()
    }
}

// FIXME: - Implement UserConsentPage View body

extension UserConsentPage: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement UserConsentPage specific LibraryContentProvider

@available(iOS 14.0, *)
struct UserConsentPageLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(UserConsentPage(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
