// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct BannerMessage {
    let icon: any View
    let title: any View
    let closeAction: any View
    let topDivider: any View
    /// The action to be performed when the banner is tapped.
    let bannerTapAction: (() -> Void)?

    @Environment(\.bannerMessageStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                @ViewBuilder closeAction: () -> any View = { FioriButton { _ in Image(systemName: "xmark") } },
                @ViewBuilder topDivider: () -> any View = { Rectangle().fill(Color.clear) },
                bannerTapAction: (() -> Void)? = nil)
    {
        self.icon = Icon { icon() }
        self.title = Title { title() }
        self.closeAction = CloseAction { closeAction() }
        self.topDivider = TopDivider { topDivider() }
        self.bannerTapAction = bannerTapAction
    }
}

public extension BannerMessage {
    init(icon: Image? = nil,
         title: AttributedString,
         closeAction: FioriButton? = FioriButton { _ in Image(systemName: "xmark") },
         @ViewBuilder topDivider: () -> any View = { Rectangle().fill(Color.clear) },
         bannerTapAction: (() -> Void)? = nil)
    {
        self.init(icon: { icon }, title: { Text(title) }, closeAction: { closeAction }, topDivider: topDivider, bannerTapAction: bannerTapAction)
    }
}

public extension BannerMessage {
    init(_ configuration: BannerMessageConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: BannerMessageConfiguration, shouldApplyDefaultStyle: Bool) {
        self.icon = configuration.icon
        self.title = configuration.title
        self.closeAction = configuration.closeAction
        self.topDivider = configuration.topDivider
        self.bannerTapAction = configuration.bannerTapAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension BannerMessage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(icon: .init(self.icon), title: .init(self.title), closeAction: .init(self.closeAction), topDivider: .init(self.topDivider), bannerTapAction: self.bannerTapAction)).typeErased
                .transformEnvironment(\.bannerMessageStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension BannerMessage {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        BannerMessage(.init(icon: .init(self.icon), title: .init(self.title), closeAction: .init(self.closeAction), topDivider: .init(self.topDivider), bannerTapAction: self.bannerTapAction))
            .shouldApplyDefaultStyle(false)
            .bannerMessageStyle(BannerMessageFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
