import SwiftUI

extension Fiori {
    enum EmptyStateView {
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .font(Font.fiori(forTextStyle: .body).weight(.medium))
                    .foregroundColor(Color.preferredColor(.primaryLabel))
                    .lineLimit(1)
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
        
        struct Action: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .buttonStyle(StatefulButtonStyle())
            }
        }
        
        typealias ActionCumulative = EmptyModifier
        
        static let title = Title()
        static let descriptionText = DescriptionText()
        static let action = Action()
        static let titleCumulative = TitleCumulative()
        static let descriptionTextCumulative = DescriptionTextCumulative()
        static let actionCumulative = ActionCumulative()
    }
}

extension EmptyStateView: View {
    public var body: some View {
        if let _image {
            _image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 160, height: 160)
                .background(Color.gray)
                .padding(.bottom, 8)
        }
        
        title
            .padding(.bottom, 2)
        descriptionText
            .padding(.bottom, 2)
        
        action
            .padding(.top, 6)
    }
}
