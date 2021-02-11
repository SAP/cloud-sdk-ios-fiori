import SwiftUI

// TODO: - Implement Fiori style definitions

extension Fiori {
    enum KPI {
        typealias Icon = EmptyModifier

        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(.largeTitle)
                    .fixedSize()
                    // .foregroundColor(.preferredColor(.primary3))
                    .foregroundColor(.green)
            }
        }

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
