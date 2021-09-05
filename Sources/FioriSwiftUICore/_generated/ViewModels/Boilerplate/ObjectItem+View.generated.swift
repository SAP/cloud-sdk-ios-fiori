// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/ObjectItem+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement ObjectItem `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI


// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum ObjectItem {
        typealias Title = EmptyModifier
        typealias TitleCumulative = EmptyModifier
		typealias Subtitle = EmptyModifier
        typealias SubtitleCumulative = EmptyModifier
		typealias Footnote = EmptyModifier
        typealias FootnoteCumulative = EmptyModifier
		typealias DescriptionText = EmptyModifier
        typealias DescriptionTextCumulative = EmptyModifier
		typealias Status = EmptyModifier
        typealias StatusCumulative = EmptyModifier
		typealias Substatus = EmptyModifier
        typealias SubstatusCumulative = EmptyModifier
		typealias DetailImage = EmptyModifier
        typealias DetailImageCumulative = EmptyModifier
		typealias Icons = EmptyModifier
        typealias IconsCumulative = EmptyModifier
		typealias Action = EmptyModifier
        typealias ActionCumulative = EmptyModifier

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
		static let subtitle = Subtitle()
		static let footnote = Footnote()
		static let descriptionText = DescriptionText()
		static let status = Status()
		static let substatus = Substatus()
		static let detailImage = DetailImage()
		static let icons = Icons()
		static let action = Action()
        static let titleCumulative = TitleCumulative()
		static let subtitleCumulative = SubtitleCumulative()
		static let footnoteCumulative = FootnoteCumulative()
		static let descriptionTextCumulative = DescriptionTextCumulative()
		static let statusCumulative = StatusCumulative()
		static let substatusCumulative = SubstatusCumulative()
		static let detailImageCumulative = DetailImageCumulative()
		static let iconsCumulative = IconsCumulative()
		static let actionCumulative = ActionCumulative()
    }
}

// FIXME: - Implement ObjectItem View body

extension ObjectItem: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement ObjectItem specific LibraryContentProvider

@available(iOS 14.0, *)
struct ObjectItemLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(ObjectItem(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
