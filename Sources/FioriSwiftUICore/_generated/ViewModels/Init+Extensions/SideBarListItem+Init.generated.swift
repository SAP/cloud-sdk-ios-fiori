// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

extension SideBarListItem where AccessoryIcon == EmptyView {
    public init(
    @ViewBuilder icon: @escaping () -> Icon,
		@ViewBuilder title: @escaping () -> Title,
		@ViewBuilder detail: @escaping () -> Detail
    ) {
        self.init(
            icon: icon,
			title: title,
			detail: detail,
			accessoryIcon: { EmptyView() }
        )
    }
}

extension SideBarListItem where Detail == EmptyView {
    public init(
    @ViewBuilder icon: @escaping () -> Icon,
		@ViewBuilder title: @escaping () -> Title,
		@ViewBuilder accessoryIcon: @escaping () -> AccessoryIcon
    ) {
        self.init(
            icon: icon,
			title: title,
			detail: { EmptyView() },
			accessoryIcon: accessoryIcon
        )
    }
}

extension SideBarListItem where Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder detail: @escaping () -> Detail,
		@ViewBuilder accessoryIcon: @escaping () -> AccessoryIcon
    ) {
        self.init(
            icon: { EmptyView() },
			title: title,
			detail: detail,
			accessoryIcon: accessoryIcon
        )
    }
}

extension SideBarListItem where AccessoryIcon == EmptyView, Detail == EmptyView {
    public init(
    @ViewBuilder icon: @escaping () -> Icon,
		@ViewBuilder title: @escaping () -> Title
    ) {
        self.init(
            icon: icon,
			title: title,
			detail: { EmptyView() },
			accessoryIcon: { EmptyView() }
        )
    }
}

extension SideBarListItem where AccessoryIcon == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder detail: @escaping () -> Detail
    ) {
        self.init(
            icon: { EmptyView() },
			title: title,
			detail: detail,
			accessoryIcon: { EmptyView() }
        )
    }
}

extension SideBarListItem where Detail == EmptyView, Icon == EmptyView {
    public init(
    @ViewBuilder title: @escaping () -> Title,
		@ViewBuilder accessoryIcon: @escaping () -> AccessoryIcon
    ) {
        self.init(
            icon: { EmptyView() },
			title: title,
			detail: { EmptyView() },
			accessoryIcon: accessoryIcon
        )
    }
}
