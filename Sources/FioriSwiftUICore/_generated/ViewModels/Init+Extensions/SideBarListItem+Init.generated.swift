// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension SideBarListItem where Icon == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder accessoryIcon: () -> AccessoryIcon
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
    @ViewBuilder icon: () -> Icon,
		@ViewBuilder title: () -> Title,
		@ViewBuilder accessoryIcon: () -> AccessoryIcon
    ) {
        self.init(
            icon: icon,
			title: title,
			subtitle: { EmptyView() },
			accessoryIcon: accessoryIcon
        )
    }
}

extension SideBarListItem where AccessoryIcon == EmptyView {
    public init(
    @ViewBuilder icon: () -> Icon,
		@ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle
    ) {
        self.init(
            icon: icon,
			title: title,
			subtitle: subtitle,
			accessoryIcon: { EmptyView() }
        )
    }
}

extension SideBarListItem where Icon == EmptyView, Subtitle == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder accessoryIcon: () -> AccessoryIcon
    ) {
        self.init(
            icon: { EmptyView() },
			title: title,
			subtitle: { EmptyView() },
			accessoryIcon: accessoryIcon
        )
    }
}

extension SideBarListItem where Icon == EmptyView, AccessoryIcon == EmptyView {
    public init(
    @ViewBuilder title: () -> Title,
		@ViewBuilder subtitle: () -> Subtitle
    ) {
        self.init(
            icon: { EmptyView() },
			title: title,
			subtitle: subtitle,
			accessoryIcon: { EmptyView() }
        )
    }
}

extension SideBarListItem where Subtitle == EmptyView, AccessoryIcon == EmptyView {
    public init(
    @ViewBuilder icon: () -> Icon,
		@ViewBuilder title: () -> Title
    ) {
        self.init(
            icon: icon,
			title: title,
			subtitle: { EmptyView() },
			accessoryIcon: { EmptyView() }
        )
    }
}

extension SideBarListItem where Icon == EmptyView, Subtitle == EmptyView, AccessoryIcon == EmptyView {
    public init(
    @ViewBuilder title: () -> Title
    ) {
        self.init(
            icon: { EmptyView() },
			title: title,
			subtitle: { EmptyView() },
			accessoryIcon: { EmptyView() }
        )
    }
}
