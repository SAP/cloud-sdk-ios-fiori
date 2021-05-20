// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension SideBarListItem where AccessoryIcon == EmptyView {
    public init(
    @ViewBuilder icon: @escaping () -> Icon,
		@ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            icon: icon,
			title: title,
			subtitle: subtitle,
			accessoryIcon: { EmptyView() }
        )
    }
}

extension SideBarListItem where Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle,
		@ViewBuilder accessoryIcon: @escaping () -> AccessoryIcon
    ) {
        self.init(
            icon: { EmptyView() },
			title: title,
			subtitle: subtitle,
			accessoryIcon: accessoryIcon
        )
    }
}

extension SideBarListItem where Subtitle == EmptyView {
    public init(
    @ViewBuilder icon: @escaping () -> Icon,
		@ViewBuilder title: @escaping () -> Title,
		@ViewBuilder accessoryIcon: @escaping () -> AccessoryIcon
    ) {
        self.init(
            icon: icon,
			title: title,
			subtitle: { EmptyView() },
			accessoryIcon: accessoryIcon
        )
    }
}

extension SideBarListItem where AccessoryIcon == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder subtitle: @escaping () -> Subtitle
    ) {
        self.init(
            icon: { EmptyView() },
			title: title,
			subtitle: subtitle,
			accessoryIcon: { EmptyView() }
        )
    }
}

extension SideBarListItem where AccessoryIcon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder icon: @escaping () -> Icon,
		@ViewBuilder title: @escaping () -> Title
    ) {
        self.init(
            icon: icon,
			title: title,
			subtitle: { EmptyView() },
			accessoryIcon: { EmptyView() }
        )
    }
}

extension SideBarListItem where Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder accessoryIcon: @escaping () -> AccessoryIcon
    ) {
        self.init(
            icon: { EmptyView() },
			title: title,
			subtitle: { EmptyView() },
			accessoryIcon: accessoryIcon
        )
    }
}
