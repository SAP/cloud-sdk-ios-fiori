import SwiftUI

// TODO: - Implement Fiori style definitions

extension Fiori {
    enum KPI {
        typealias Title = EmptyModifier
        typealias Icon = EmptyModifier

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
        static let icon = Icon()
    }
}

// TODO: - Implement KPI View body

extension KPI: View {
    public var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 3) {
            icon
            title
        }
    }
}
