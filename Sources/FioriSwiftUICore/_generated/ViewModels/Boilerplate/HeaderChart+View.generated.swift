// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
//TODO: Copy commented code to new file: `FioriSwiftUICore/Views/HeaderChart+View.swift`
//TODO: Implement default Fiori style definitions as `ViewModifier`
//TODO: Implement HeaderChart `View` body
//TODO: Implement LibraryContentProvider

/// - Important: to make `@Environment` properties (e.g. `horizontalSizeClass`), internally accessible
/// to extensions, add as sourcery annotation in `FioriSwiftUICore/Models/ModelDefinitions.swift`
/// to declare a wrapped property
/// e.g.:  `// sourcery: add_env_props = ["horizontalSizeClass"]`

/*
import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum HeaderChart {
        typealias Title = EmptyModifier
		typealias Subtitle = EmptyModifier
		typealias Trend = EmptyModifier
		typealias Kpi = EmptyModifier

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
		static let trend = Trend()
		static let kpi = Kpi()
    }
}

// FIXME: - Implement HeaderChart View body

extension HeaderChart: View {
    public var body: some View {
        <# View body #>
    }
}

// FIXME: - Implement HeaderChart specific LibraryContentProvider

 @available(iOS 14.0, *)
 struct HeaderChartLibraryContent: LibraryContentProvider {
     @LibraryContentBuilder
     var views: [LibraryItem] {
         LibraryItem(HeaderChart(model: LibraryPreviewData.Person.laurelosborn),
                     category: .control)
     }
 }
*/
