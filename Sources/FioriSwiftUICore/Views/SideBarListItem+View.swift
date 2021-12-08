import SwiftUI

extension Fiori {
    enum SideBarListItem {
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
        }
        
        struct Subtitle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
        }

        struct Icon: ViewModifier {
            func body(content: Content) -> some View {
                content.padding(.trailing, 11)
            }
        }

        struct AccessoryIcon: ViewModifier {
            func body(content: Content) -> some View {
                content.padding(.leading, 11)
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
            icon.foregroundColor(.preferredColor(.primaryLabel))
            title
                .font(.system(size: 17, weight: getFontWeight(), design: .default))
                .foregroundColor(getColorStyle())
            Spacer()
            subtitle
                .font(.system(size: 17, weight: getFontWeight(), design: .default))
                .foregroundColor(.preferredColor(.tertiaryLabel))
            accessoryIcon.foregroundColor(.preferredColor(.tertiaryLabel))
        }
        .padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
        .cornerRadius(8, antialiased: true)
    }
    
    private func getFontWeight() -> Font.Weight {
        sideBarListItemConfigMode.isSelected ? .bold : .regular
    }
    
    private func getColorStyle() -> Color {
        sideBarListItemConfigMode.isHeaderContent ? .preferredColor(.tertiaryLabel) : .preferredColor(.primaryLabel)
    }
}

internal struct SideBarListItemConfig {
    var isSelected: Bool
    var isHeaderContent: Bool
}

struct SideBarListItemConfigMode: EnvironmentKey {
    internal static let defaultValue = SideBarListItemConfig(isSelected: false, isHeaderContent: false)
}

internal extension EnvironmentValues {
    var sideBarListItemConfigMode: SideBarListItemConfig {
        get { self[SideBarListItemConfigMode.self] }
        set { self[SideBarListItemConfigMode.self] = newValue }
    }
}
