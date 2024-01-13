import SwiftUI

extension Fiori {
    enum EmptyStateView {
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(Font.fiori(forTextStyle: .body).weight(.medium))
                    .foregroundColor(Color.preferredColor(.primaryLabel))
                    .lineLimit(1)
                    .multilineTextAlignment(.center)
            }
        }
        
        typealias TitleCumulative = EmptyModifier
        
        struct DescriptionText: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(Font.fiori(forTextStyle: .body))
                    .foregroundColor(Color.preferredColor(.tertiaryLabel))
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
            }
        }
        
        typealias DescriptionTextCumulative = EmptyModifier
        
        struct DetailImage: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .aspectRatio(contentMode: .fit)
                    .frame(alignment: .leading)
            }
        }

        typealias DetailImageCumulative = EmptyModifier
        
        struct Action: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .buttonStyle(StatefulButtonStyle())
            }
        }
        
        typealias ActionCumulative = EmptyModifier
        
        static let title = Title()
        static let descriptionText = DescriptionText()
        static let detailImage = DetailImage()
        static let action = Action()
        static let titleCumulative = TitleCumulative()
        static let descriptionTextCumulative = DescriptionTextCumulative()
        static let detailImageCumulative = DetailImageCumulative()
        static let actionCumulative = ActionCumulative()
    }
}

extension EmptyStateView: View {
    public var body: some View {
        if alignmentAxis == .vertical {
            VStack(alignment: .center, spacing: 0) {
                detailImage
                    .padding(.bottom, 16)
                
                title

                descriptionText
                    .padding(.top, 4)
                
                action
                    .padding(.top, 2)

            }
            .padding([.leading, .trailing], 16)
        } else {
            HStack(spacing: 0) {
                detailImage
                    .padding(.trailing, 16)
                
                VStack(spacing: 0) {
                    title

                    descriptionText
                        .padding(.top, 4)
                        .frame(maxWidth: .infinity)

                    action
                        .padding(.top, 2)
                }
            }
            .padding([.leading, .trailing], 16)
        }
    }
}
