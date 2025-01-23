// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
