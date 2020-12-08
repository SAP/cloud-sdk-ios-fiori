import SwiftUI

// TODO: - Implement Fiori style definitions

extension Fiori {
    enum CollectionItem {
        typealias DetailImage = EmptyModifier
        typealias Title = EmptyModifier
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
        static let detailImage = DetailImage()
        static let title = Title()
        static let subtitle = Subtitle()
    }
}

// TODO: - Implement ContactItem View body

extension CollectionItem: View {
    public var body: some View {
        VStack {
            detailImage.frame(width: 60, height: 60)
            title
            subtitle
        }
        .padding()
    }
}
