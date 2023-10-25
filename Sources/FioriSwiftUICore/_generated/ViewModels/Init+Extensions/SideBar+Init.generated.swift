// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

@available(iOS 14, *)
extension SideBar where Subtitle == EmptyView {
    public init(
    @ViewBuilder footer: () -> Footer,
		@ViewBuilder detail: () -> Detail
    ) {
        self.init(
            subtitle: { EmptyView() },
			footer: footer,
			detail: detail
        )
    }
}

@available(iOS 14, *)
extension SideBar where Footer == EmptyView {
    public init(
    @ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder detail: () -> Detail
    ) {
        self.init(
            subtitle: subtitle,
			footer: { EmptyView() },
			detail: detail
        )
    }
}

@available(iOS 14, *)
extension SideBar where Detail == EmptyView {
    public init(
    @ViewBuilder subtitle: () -> Subtitle,
		@ViewBuilder footer: () -> Footer
    ) {
        self.init(
            subtitle: subtitle,
			footer: footer,
			detail: { EmptyView() }
        )
    }
}

@available(iOS 14, *)
extension SideBar where Subtitle == EmptyView, Footer == EmptyView {
    public init(
    @ViewBuilder detail: () -> Detail
    ) {
        self.init(
            subtitle: { EmptyView() },
			footer: { EmptyView() },
			detail: detail
        )
    }
}

@available(iOS 14, *)
extension SideBar where Subtitle == EmptyView, Detail == EmptyView {
    public init(
    @ViewBuilder footer: () -> Footer
    ) {
        self.init(
            subtitle: { EmptyView() },
			footer: footer,
			detail: { EmptyView() }
        )
    }
}

@available(iOS 14, *)
extension SideBar where Footer == EmptyView, Detail == EmptyView {
    public init(
    @ViewBuilder subtitle: () -> Subtitle
    ) {
        self.init(
            subtitle: subtitle,
			footer: { EmptyView() },
			detail: { EmptyView() }
        )
    }
}

@available(iOS 14, *)
extension SideBar where Subtitle == EmptyView, Footer == EmptyView, Detail == EmptyView {
    public init(
    
    ) {
        self.init(
            subtitle: { EmptyView() },
			footer: { EmptyView() },
			detail: { EmptyView() }
        )
    }
}
