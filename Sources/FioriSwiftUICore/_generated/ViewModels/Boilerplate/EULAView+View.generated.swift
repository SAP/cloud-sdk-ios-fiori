// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/EULAView+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement EULAView `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum EULAView {
        typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier
		typealias BodyAttributedText = EmptyModifier
        typealias BodyAttributedTextCumulative = EmptyModifier
		typealias Action = EmptyModifier
        typealias ActionCumulative = EmptyModifier
		typealias SecondaryAction = EmptyModifier
        typealias SecondaryActionCumulative = EmptyModifier
		typealias CancelAction = EmptyModifier
        typealias CancelActionCumulative = EmptyModifier

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
		static let bodyAttributedText = BodyAttributedText()
		static let action = Action()
		static let secondaryAction = SecondaryAction()
		static let cancelAction = CancelAction()
        static let titleCumulative = TitleCumulative()
		static let bodyAttributedTextCumulative = BodyAttributedTextCumulative()
		static let actionCumulative = ActionCumulative()
		static let secondaryActionCumulative = SecondaryActionCumulative()
		static let cancelActionCumulative = CancelActionCumulative()
    }
}

// FIXME: - Implement EULAView View body

extension EULAView: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement EULAView specific LibraryContentProvider

@available(iOS 14.0, macOS 11.0, *)
struct EULAViewLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(EULAView(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
