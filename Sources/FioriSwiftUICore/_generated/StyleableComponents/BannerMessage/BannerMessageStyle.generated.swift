// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol BannerMessageStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: BannerMessageConfiguration) -> Body
}

struct AnyBannerMessageStyle: BannerMessageStyle {
    let content: (BannerMessageConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (BannerMessageConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct BannerMessageConfiguration {
    public let contentIdentifier = "FioriBannerMessage_content"
    public let iconIdentifier = "FioriBannerMessage_icon"
    public let titleIdentifier = "FioriBannerMessage_title"
    public let closeActionIdentifier = "FioriBannerMessage_closeAction"
    public let topDividerIdentifier = "FioriBannerMessage_topDivider"

    public var componentIdentifier: String = "fiori_bannermessage_component"
    public let icon: Icon
    public let title: Title
    public let closeAction: CloseAction
    public let topDivider: TopDivider
    public let bannerTapAction: (() -> Void)?
    public let alignment: HorizontalAlignment
    public let hideSeparator: Bool
    public let messageType: BannerMultiMessageType
    public let showDetailLink: Bool

    public typealias Icon = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
    public typealias CloseAction = ConfigurationViewWrapper
    public typealias TopDivider = ConfigurationViewWrapper
}

extension BannerMessageConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct BannerMessageFioriStyle: BannerMessageStyle {
    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .iconStyle(IconFioriStyle(bannerMessageConfiguration: configuration))
            .titleStyle(TitleFioriStyle(bannerMessageConfiguration: configuration))
            .closeActionStyle(CloseActionFioriStyle(bannerMessageConfiguration: configuration))
            .topDividerStyle(TopDividerFioriStyle(bannerMessageConfiguration: configuration))
    }
}

public struct BannerMessageNSSStyle: BannerMessageStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: BannerMessageConfiguration) -> some View {
        BannerMessage(configuration)
            .iconStyle(IconNSSStyle(bannerMessageConfiguration: configuration, nssData: self.data.value(configuration.iconIdentifier)))
            .titleStyle(TitleNSSStyle(bannerMessageConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .closeActionStyle(CloseActionNSSStyle(bannerMessageConfiguration: configuration, nssData: self.data.value(configuration.closeActionIdentifier)))
            .topDividerStyle(TopDividerNSSStyle(bannerMessageConfiguration: configuration, nssData: self.data.value(configuration.topDividerIdentifier)))
            .bannerMessageStyle(ContentNSSStyle(bannerMessageConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
