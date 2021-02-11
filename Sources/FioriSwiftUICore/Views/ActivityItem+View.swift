import SwiftUI

// FIXME: - Implement Fiori style definitions

extension Fiori {
    enum ActivityItem {
        typealias Icon = EmptyModifier
        typealias Subtitle = EmptyModifier

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
        static let icon = Icon()
        static let subtitle = Subtitle()
    }
}

// FIXME: - Implement ActivityItem View body

extension ActivityItem: View {
    public var body: some View {
        VStack {
            icon
            subtitle
        }
    }
}
