import SwiftUI

extension Fiori {
    enum SideBarListSectionHeader {
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .lineLimit(1)
                    .font(.system(size: 17.0))
                    .truncationMode(.tail)
                    .foregroundColor(.preferredColor(.quarternaryLabel, display: .contrast))
                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
            }
        }
        
        typealias TitleCumulative = EmptyModifier

        static let title = Title()
        static let titleCumulative = TitleCumulative()
    }
}

extension SideBarListSectionHeader: View {
    public var body: some View {
        title
    }
}
