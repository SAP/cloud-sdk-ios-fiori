// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TimelinePreviewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TimelinePreviewConfiguration) -> Body
}

struct AnyTimelinePreviewStyle: TimelinePreviewStyle {
    let content: (TimelinePreviewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TimelinePreviewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TimelinePreviewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TimelinePreviewConfiguration {
    public let title: Title
    public let action: Action
    @Binding public var data: [TimelinePreviewItemModel]
    public let showHeader: Bool

    public typealias Title = ConfigurationViewWrapper
    public typealias Action = ConfigurationViewWrapper
}

public struct TimelinePreviewFioriStyle: TimelinePreviewStyle {
    public func makeBody(_ configuration: TimelinePreviewConfiguration) -> some View {
        TimelinePreview(configuration)
            .titleStyle(TitleFioriStyle(timelinePreviewConfiguration: configuration))
            .actionStyle(ActionFioriStyle(timelinePreviewConfiguration: configuration))
    }
}
