import SwiftUI

extension Fiori {
    enum KPIProgressItem {
        typealias Kpi = EmptyModifier
        typealias KpiCumulative = EmptyModifier
        typealias Subtitle = EmptyModifier
        typealias SubtitleCumulative = EmptyModifier
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
        static let kpi = Kpi()
        static let subtitle = Subtitle()
        static let footnote = Footnote()
        static let kpiCumulative = KpiCumulative()
        static let subtitleCumulative = SubtitleCumulative()
        static let footnoteCumulative = FootnoteCumulative()
    }
}

// FIXME: - Implement KPIProgressItem View body

extension KPIProgressItem: View {
    public var body: some View {
        Text("TODO")
    }
}

// FIXME: - Implement KPIProgressItem specific LibraryContentProvider

// @available(iOS 14.0, *)
// struct KPIProgressItemLibraryContent: LibraryContentProvider {
//    @LibraryContentBuilder
//    var views: [LibraryItem] {
//        LibraryItem(KPIProgressItem(model: LibraryPreviewData.Person.laurelosborn),
//                    category: .control)
//    }
// }
