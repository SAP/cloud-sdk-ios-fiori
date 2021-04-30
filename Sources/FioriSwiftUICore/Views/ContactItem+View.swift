import SwiftUI

extension Fiori {
    enum ContactItem {
        typealias Title = EmptyModifier
        typealias Subtitle = EmptyModifier
        typealias Footnote = EmptyModifier
        typealias DescriptionText = EmptyModifier
        typealias DetailImage = EmptyModifier
        typealias ActionItems = EmptyModifier

        // TODO: - substitute type-specific ViewModifier for EmptyModifier

        // replace `typealias Subtitle = EmptyModifier` with:

        //            struct Subtitle: ViewModifier {
        //                func body(content: Content) -> some View {
        //                    content
        //                        .font(.body)
        //                        .foregroundColor(.preferredColor(.primary3))
        //                        .background(Color.green)
        //                }
        //            }

        static let title = Title()
        static let subtitle = Subtitle()
        static let footnote = Footnote()
        static let descriptionText = DescriptionText()
        static let detailImage = DetailImage()
        static let actionItems = ActionItems()
    }
}

extension ContactItem: View {
    public var body: some View {
        HStack(spacing: 8) {
            detailImage
                .frame(width: 45, height: 45)

            VStack(alignment: .leading) {
                title
                subtitle
                footnote
            }
            Spacer()
            HStack(spacing: 8) {
                actionItems
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}
