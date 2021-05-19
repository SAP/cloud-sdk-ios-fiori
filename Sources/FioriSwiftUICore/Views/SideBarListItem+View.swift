import SwiftUI

extension Fiori {
    enum SideBarListItem {
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .lineLimit(1)
                    .font(.system(size: 17))
                    .truncationMode(.tail)
                    .foregroundColor(.white)
            }
        }
        
        struct Detail: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .lineLimit(1)
                    .font(.system(size: 17))
                    .truncationMode(.tail)
                    .foregroundColor(.preferredColor(.tertiaryLabel, display: .contrast))
            }
        }

        struct Icon: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .padding(.leading, 8)
                    .padding(.trailing, 11)
                    .foregroundColor(.preferredColor(.tintColor, display: .contrast))
            }
        }

        struct AccessoryIcon: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .padding(.leading, 8)
                    .padding(.trailing, 8)
                    .foregroundColor(.preferredColor(.tintColor, display: .contrast))
            }
        }
        
        typealias IconCumulative = EmptyModifier
        typealias TitleCumulative = EmptyModifier
        typealias DetailCumulative = EmptyModifier
        typealias AccessoryIconCumulative = EmptyModifier

        static let icon = Icon()
        static let title = Title()
        static let detail = Detail()
        static let accessoryIcon = AccessoryIcon()
        static let iconCumulative = IconCumulative()
        static let titleCumulative = TitleCumulative()
        static let detailCumulative = DetailCumulative()
        static let accessoryIconCumulative = IconCumulative()
    }
}

extension SideBarListItem: View {
    public var body: some View {
        HStack {
            if let icon = icon as? Image {
                icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
            } else {
                icon
                    .frame(width: 22, height: 22)
            }
            title
            Spacer()
            detail
            if let accessoryIcon = accessoryIcon as? Image {
                accessoryIcon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 22, height: 22)
            } else {
                accessoryIcon
                    .frame(width: 22, height: 22)
            }
        }
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
    }
}
