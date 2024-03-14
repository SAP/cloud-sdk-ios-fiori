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
        
        typealias Icon = EmptyModifier
        typealias AccessoryIcon = EmptyModifier
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
        Group {
            if sizeCategory.isAccessibilityCategory {
                VStack {
                    HStack(spacing: 11) {
                        icon
                            .foregroundColor(.preferredColor(.primaryLabel))
                            .frame(width: 22 * scale, height: 22 * scale)
                        title
                            .font(Font.fiori(forTextStyle: .subheadline).weight(sideBarListItemConfigMode.isSelected ? Font.Weight.bold : Font.Weight.regular))
                            .foregroundColor(self.getColorStyle())
                        Spacer()
                    }
                    
                    HStack(spacing: 11) {
                        Spacer()
                        subtitle
                            .font(Font.fiori(forTextStyle: .subheadline).weight(sideBarListItemConfigMode.isSelected ? Font.Weight.bold : Font.Weight.regular))
                            .foregroundColor(.preferredColor(.tertiaryLabel))
                        accessoryIcon
                            .foregroundColor(.preferredColor(.tertiaryLabel))
                            .frame(width: 22 * scale, height: 22 * scale)
                    }
                }
            } else {
                HStack(spacing: 11) {
                    icon
                        .foregroundColor(.preferredColor(.primaryLabel))
                        .frame(width: 22 * scale, height: 22 * scale)
                    title
                        .font(Font.fiori(forTextStyle: .subheadline).weight(sideBarListItemConfigMode.isSelected ? Font.Weight.bold : Font.Weight.regular))
                        .foregroundColor(self.getColorStyle())
                    Spacer()
                    subtitle
                        .font(Font.fiori(forTextStyle: .subheadline).weight(sideBarListItemConfigMode.isSelected ? Font.Weight.bold : Font.Weight.regular))
                        .foregroundColor(.preferredColor(.tertiaryLabel))
                    accessoryIcon
                        .foregroundColor(.preferredColor(.tertiaryLabel))
                        .frame(width: 22 * scale, height: 22 * scale)
                }
            }
        }
        .padding(EdgeInsets(top: 11, leading: 11, bottom: 11, trailing: 11))
        .cornerRadius(8, antialiased: true)
    }
    
    private func getColorStyle() -> Color {
        sideBarListItemConfigMode.isHeaderContent ? .preferredColor(.tertiaryLabel) : .preferredColor(.primaryLabel)
    }
}

struct SideBarListItemConfig {
    var isSelected: Bool
    var isHeaderContent: Bool
}

struct SideBarListItemConfigMode: EnvironmentKey {
    static let defaultValue = SideBarListItemConfig(isSelected: false, isHeaderContent: false)
}

extension EnvironmentValues {
    var sideBarListItemConfigMode: SideBarListItemConfig {
        get { self[SideBarListItemConfigMode.self] }
        set { self[SideBarListItemConfigMode.self] = newValue }
    }
}
