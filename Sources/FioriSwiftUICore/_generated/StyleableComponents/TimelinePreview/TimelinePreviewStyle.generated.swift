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
    public let headerTitle: HeaderTitle
    public let seeAllAction: SeeAllAction
    @Binding public var data: [TimelinePreviewItemModel]

    public typealias HeaderTitle = ConfigurationViewWrapper
    public typealias SeeAllAction = ConfigurationViewWrapper
}

public struct TimelinePreviewFioriStyle: TimelinePreviewStyle {
    public func makeBody(_ configuration: TimelinePreviewConfiguration) -> some View {
        TimelinePreview(configuration)
            .headerTitleStyle(HeaderTitleFioriStyle(timelinePreviewConfiguration: configuration))
            .seeAllActionStyle(SeeAllActionFioriStyle(timelinePreviewConfiguration: configuration))
    }
}
