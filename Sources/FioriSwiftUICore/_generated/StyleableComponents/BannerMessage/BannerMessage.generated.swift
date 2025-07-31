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
    /// The icon and title's `HorizontalAlignment`. The default is `center`.
    let alignment: HorizontalAlignment
    /// Hide bottom separator or not. The default is false.
    let hideSeparator: Bool
    /// The icon and title's type. The default is `negative`.
    let messageType: BannerMultiMessageType
    /// Show detail link or not. The default is false. When showDetailLink is true, and click the link will perform to popup the detail sheet.
    let showDetailLink: Bool

    @Environment(\.bannerMessageStyle) var style

    var componentIdentifier: String = BannerMessage.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                @ViewBuilder closeAction: () -> any View = { FioriButton { _ in Image(fioriName: "fiori.decline") } },
                @ViewBuilder topDivider: () -> any View = { Rectangle().fill(Color.clear) },
                bannerTapAction: (() -> Void)? = nil,
                alignment: HorizontalAlignment = .center,
                hideSeparator: Bool = false,
                messageType: BannerMultiMessageType = .negative,
                showDetailLink: Bool = false,
                componentIdentifier: String? = BannerMessage.identifier)
    {
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.closeAction = CloseAction(closeAction: closeAction, componentIdentifier: componentIdentifier)
        self.topDivider = TopDivider(topDivider: topDivider, componentIdentifier: componentIdentifier)
        self.bannerTapAction = bannerTapAction
        self.alignment = alignment
        self.hideSeparator = hideSeparator
        self.messageType = messageType
        self.showDetailLink = showDetailLink
        self.componentIdentifier = componentIdentifier ?? BannerMessage.identifier
    }
}

public extension BannerMessage {
    static let identifier = "fiori_bannermessage_component"
}

public extension BannerMessage {
    init(icon: Image? = nil,
         title: AttributedString,
         closeAction: FioriButton? = FioriButton { _ in Image(fioriName: "fiori.decline") },
         @ViewBuilder topDivider: () -> any View = { Rectangle().fill(Color.clear) },
         bannerTapAction: (() -> Void)? = nil,
         alignment: HorizontalAlignment = .center,
         hideSeparator: Bool = false,
         messageType: BannerMultiMessageType = .negative,
         showDetailLink: Bool = false)
    {
        self.init(icon: { icon }, title: { Text(title) }, closeAction: { closeAction }, topDivider: topDivider, bannerTapAction: bannerTapAction, alignment: alignment, hideSeparator: hideSeparator, messageType: messageType, showDetailLink: showDetailLink)
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
        self.alignment = configuration.alignment
        self.hideSeparator = configuration.hideSeparator
        self.messageType = configuration.messageType
        self.showDetailLink = configuration.showDetailLink
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension BannerMessage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), title: .init(self.title), closeAction: .init(self.closeAction), topDivider: .init(self.topDivider), bannerTapAction: self.bannerTapAction, alignment: self.alignment, hideSeparator: self.hideSeparator, messageType: self.messageType, showDetailLink: self.showDetailLink)).typeErased
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
        BannerMessage(.init(componentIdentifier: self.componentIdentifier, icon: .init(self.icon), title: .init(self.title), closeAction: .init(self.closeAction), topDivider: .init(self.topDivider), bannerTapAction: self.bannerTapAction, alignment: self.alignment, hideSeparator: self.hideSeparator, messageType: self.messageType, showDetailLink: self.showDetailLink))
            .shouldApplyDefaultStyle(false)
            .bannerMessageStyle(BannerMessageFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
