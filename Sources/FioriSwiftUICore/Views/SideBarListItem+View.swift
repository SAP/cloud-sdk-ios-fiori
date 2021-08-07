import SwiftUI

extension Fiori {
    enum SideBarListItem {
        struct Title: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .lineLimit(1)
                    .font(.system(size: 17))
                    .truncationMode(.tail)
            }
        }
        
        struct Subtitle: ViewModifier {
            func body(content: Content) -> some View {
                content
                    .lineLimit(1)
                    .font(.system(size: 17))
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
            icon.foregroundColor(getIconColor())
            title.foregroundColor(getTitleColor())
            Spacer()
            subtitle.foregroundColor(getSubtitleColor())
            accessoryIcon.foregroundColor(getAccessoryIconColor())
        }.padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
    }
    
    private func getIconColor() -> Color {
        sideBarListItemConfigMode.isSelected ? .preferredColor(.primaryLabel, background: .lightConstant) : .preferredColor(.tintColor, display: .contrast)
    }
    
    private func getAccessoryIconColor() -> Color {
        sideBarListItemConfigMode.isSelected ? .preferredColor(.tertiaryLabel, background: .lightConstant) : .preferredColor(.tintColor, display: .contrast)
    }
    
    private func getTitleColor() -> Color {
        switch (sideBarListItemConfigMode.isSelected, sideBarListItemConfigMode.isHeaderContent) {
        case (_, true):
            return .preferredColor(.tertiaryLabel, display: .contrast)
        case (true, false):
            return .preferredColor(.primaryLabel, background: .lightConstant)
        case (false, false):
            return .preferredColor(.primaryLabel, display: .contrast)
        }
    }
    
    private func getSubtitleColor() -> Color {
        switch (sideBarListItemConfigMode.isSelected, sideBarListItemConfigMode.isHeaderContent) {
        case (_, true):
            return .preferredColor(.tertiaryLabel, display: .contrast)
        case (true, false):
            return .preferredColor(.tertiaryLabel, background: .lightConstant)
        case (false, false):
            return .preferredColor(.tertiaryLabel, display: .contrast)
        }
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
        get { self[SideBarListItemConfigMode] }
        set { self[SideBarListItemConfigMode] = newValue }
    }
}
