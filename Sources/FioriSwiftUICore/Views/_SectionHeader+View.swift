import SwiftUI

// TODO: - Implement Fiori style definitions

extension Fiori {
    enum _SectionHeader {
//        typealias Title = EmptyModifier
        typealias Attribute = EmptyModifier
        typealias AttributeCumulative = EmptyModifier

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
        
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content.font(.fiori(forTextStyle: .headline)).foregroundColor(.preferredColor(.primaryLabel))
            }
        }

        typealias TitleCumulative = EmptyModifier

        static let title = Title()
        static let attribute = Attribute()
        static let titleCumulative = TitleCumulative()
        static let attributeCumulative = AttributeCumulative()
    }
}

// TODO: - Implement SectionHeader View body

extension _SectionHeader: View {
    public var body: some View {
        HStack {
            title
            Spacer()
            HStack {
                attribute
                    .multilineTextAlignment(.trailing)
//                action
            }
        }
    }
}
