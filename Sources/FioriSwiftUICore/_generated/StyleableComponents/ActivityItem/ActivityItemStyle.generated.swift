// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol ActivityItemStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ActivityItemConfiguration) -> Body
}

struct AnyActivityItemStyle: ActivityItemStyle {
    let content: (ActivityItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ActivityItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ActivityItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ActivityItemConfiguration {
    public var componentIdentifier: String = "fiori_activityitem_component"
    public let icon: Icon
    public let subtitle: Subtitle
    public let layout: ActivityItemLayout

    public typealias Icon = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
}

public extension ActivityItemConfiguration {
    var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    var iconIdentifier: String {
        self.componentIdentifier + "_icon"
    }

    var subtitleIdentifier: String {
        self.componentIdentifier + "_subtitle"
    }
}

extension ActivityItemConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct ActivityItemFioriStyle: ActivityItemStyle {
    public func makeBody(_ configuration: ActivityItemConfiguration) -> some View {
        ActivityItem(configuration)
            .iconStyle(IconFioriStyle(activityItemConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(activityItemConfiguration: configuration))
    }
}

public struct ActivityItemNSSStyle: ActivityItemStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: ActivityItemConfiguration) -> some View {
        ActivityItem(configuration)
            .iconStyle(IconNSSStyle(activityItemConfiguration: configuration, nssData: self.data.value(configuration.iconIdentifier)))
            .subtitleStyle(SubtitleNSSStyle(activityItemConfiguration: configuration, nssData: self.data.value(configuration.subtitleIdentifier)))
            .activityItemStyle(ContentNSSStyle(activityItemConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
