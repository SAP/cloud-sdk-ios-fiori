// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TimelineMarkerMainStackStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TimelineMarkerMainStackConfiguration) -> Body
}

struct AnyTimelineMarkerMainStackStyle: TimelineMarkerMainStackStyle {
    let content: (TimelineMarkerMainStackConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TimelineMarkerMainStackConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TimelineMarkerMainStackConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TimelineMarkerMainStackConfiguration {
    public let title: Title

    public typealias Title = ConfigurationViewWrapper
}

public struct TimelineMarkerMainStackFioriStyle: TimelineMarkerMainStackStyle {
    public func makeBody(_ configuration: TimelineMarkerMainStackConfiguration) -> some View {
        TimelineMarkerMainStack(configuration)
            .titleStyle(TitleFioriStyle(timelineMarkerMainStackConfiguration: configuration))
    }
}
