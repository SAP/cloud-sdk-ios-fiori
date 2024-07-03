// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TimelineTimeStackStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TimelineTimeStackConfiguration) -> Body
}

struct AnyTimelineTimeStackStyle: TimelineTimeStackStyle {
    let content: (TimelineTimeStackConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TimelineTimeStackConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TimelineTimeStackConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TimelineTimeStackConfiguration {
    public let timestampLabel: TimestampLabel
    public let secondaryTimestampLabel: SecondaryTimestampLabel
    public let secondaryTimestampImage: SecondaryTimestampImage

    public typealias TimestampLabel = ConfigurationViewWrapper
    public typealias SecondaryTimestampLabel = ConfigurationViewWrapper
    public typealias SecondaryTimestampImage = ConfigurationViewWrapper
}

public struct TimelineTimeStackFioriStyle: TimelineTimeStackStyle {
    public func makeBody(_ configuration: TimelineTimeStackConfiguration) -> some View {
        TimelineTimeStack(configuration)
            .timestampLabelStyle(TimestampLabelFioriStyle(timelineTimeStackConfiguration: configuration))
            .secondaryTimestampLabelStyle(SecondaryTimestampLabelFioriStyle(timelineTimeStackConfiguration: configuration))
            .secondaryTimestampImageStyle(SecondaryTimestampImageFioriStyle(timelineTimeStackConfiguration: configuration))
    }
}
