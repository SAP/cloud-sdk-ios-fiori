// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/StepProgressIndicator+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement StepProgressIndicator `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum StepProgressIndicator {
        typealias CurrentStepName = EmptyModifier
        typealias CurrentStepNameCumulative = EmptyModifier
		typealias AllStepsAction = EmptyModifier
        typealias AllStepsActionCumulative = EmptyModifier
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
        static let currentStepName = CurrentStepName()
		static let allStepsAction = AllStepsAction()
		static let cancelAction = CancelAction()
        static let currentStepNameCumulative = CurrentStepNameCumulative()
		static let allStepsActionCumulative = AllStepsActionCumulative()
		static let cancelActionCumulative = CancelActionCumulative()
    }
}

// FIXME: - Implement StepProgressIndicator View body

extension StepProgressIndicator: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement StepProgressIndicator specific LibraryContentProvider

@available(iOS 14.0, macOS 11.0, *)
struct StepProgressIndicatorLibraryContent: LibraryContentProvider {
    @LibraryContentBuilder
    var views: [LibraryItem] {
        LibraryItem(StepProgressIndicator(model: LibraryPreviewData.Person.laurelosborn),
                    category: .control)
    }
}
*/
