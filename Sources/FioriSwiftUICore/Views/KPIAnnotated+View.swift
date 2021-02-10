import SwiftUI

// TODO: - Implement Fiori style definitions

extension Fiori {
    enum KPIAnnotated {
        typealias Title = EmptyModifier
        typealias Subtitle = EmptyModifier
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
        static let subtitle = Subtitle()
        static let icon = Icon()
    }
}

// TODO: - Implement KPIAnnotated View body

extension KPIAnnotated: View {
    public var body: some View {
        VStack(spacing: 2) {
            KPI(title: {
                title
            }, icon: {
                icon
            })
            subtitle
        }
    }
}
