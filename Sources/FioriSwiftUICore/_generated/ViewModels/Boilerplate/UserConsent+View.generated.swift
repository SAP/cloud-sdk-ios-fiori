// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/UserConsent+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement UserConsent `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum UserConsent {
        typealias ActionTitle = EmptyModifier
        typealias ActionTitleCumulative = EmptyModifier
		typealias FirstActionTitle = EmptyModifier
        typealias FirstActionTitleCumulative = EmptyModifier
		typealias SecondActionTitle = EmptyModifier
        typealias SecondActionTitleCumulative = EmptyModifier

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
        static let actionTitle = ActionTitle()
		static let firstActionTitle = FirstActionTitle()
		static let secondActionTitle = SecondActionTitle()
        static let actionTitleCumulative = ActionTitleCumulative()
		static let firstActionTitleCumulative = FirstActionTitleCumulative()
		static let secondActionTitleCumulative = SecondActionTitleCumulative()
    }
}

// FIXME: - Implement UserConsent View body

extension UserConsent: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement UserConsent specific LibraryContentProvider

@available(iOS 14.0, *)
struct UserConsentLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(UserConsent(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
