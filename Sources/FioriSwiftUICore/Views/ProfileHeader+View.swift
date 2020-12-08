import SwiftUI

extension Fiori {
    enum ProfileHeader {
        typealias Title = EmptyModifier
        typealias Subtitle = EmptyModifier
        typealias Footnote = EmptyModifier
        typealias DescriptionText = EmptyModifier
        typealias DetailImage = EmptyModifier

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
        static let detailImage = DetailImage()
    }
}

extension ProfileHeader: View {
    public var body: some View {
        if horizontalSizeClass == .some(.compact) {
            VStack(spacing: 8) {
                detailImage
                        .frame(width: 128, height: 128)
                VStack(spacing: 4) {
                    title
                    subtitle
                    footnote
                }
                descriptionText
//                HStack(spacing: 8) {
//                    actionItems
//                }
            }
            .multilineTextAlignment(.center)
        } else {
            HStack(spacing: 8) {
                detailImage
                    .frame(width: 65, height: 65)
                VStack(alignment: .leading) {
                    title
                    subtitle
                    footnote
                }
                descriptionText
                Spacer()
//                HStack(spacing: 8) {
//                    actionItems
//                }
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
        }
        
    }
}
