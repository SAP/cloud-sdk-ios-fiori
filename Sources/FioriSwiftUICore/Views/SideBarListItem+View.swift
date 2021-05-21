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
        
        struct Subtitle: ViewModifier {
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
                    .foregroundColor(.preferredColor(.tintColor, display: .contrast))
                    .padding(.trailing, 11)
            }
        }

        struct AccessoryIcon: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .foregroundColor(.preferredColor(.tintColor, display: .contrast))
                    .padding(.leading, 11)
            }
        }
        
        typealias IconCumulative = EmptyModifier
        typealias TitleCumulative = EmptyModifier
        typealias SubtitleCumulative = EmptyModifier
        typealias AccessoryIconCumulative = EmptyModifier

        static let icon = Icon()
        static let title = Title()
        static let subtitle = Subtitle()
        static let accessoryIcon = AccessoryIcon()
        static let iconCumulative = IconCumulative()
        static let titleCumulative = TitleCumulative()
        static let subtitleCumulative = SubtitleCumulative()
        static let accessoryIconCumulative = IconCumulative()
    }
}

extension SideBarListItem: View {
    public var body: some View {
        HStack(spacing: 0) {
            icon
            title
            Spacer()
            subtitle
            accessoryIcon
        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
    }
}
