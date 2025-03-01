import SwiftUI

extension Fiori {
    enum _EmptyStateView {
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
                    .frame(width: 160, height: 160, alignment: .center)
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

extension _EmptyStateView: View {
    public var body: some View {
        VStack(alignment: .center) {
            detailImage
                .padding(.bottom, 6)
            
            title
                .padding(.bottom, 2)
            descriptionText
                .padding(.bottom, 2)
            
            action
                .padding(.top, 4)
        }
    }
}
