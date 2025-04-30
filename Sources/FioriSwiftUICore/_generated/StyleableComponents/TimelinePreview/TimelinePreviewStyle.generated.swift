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
    public var componentIdentifier: String = "fiori_timelinepreview_component"
    public let optionalTitle: OptionalTitle
    public let action: Action
    public let separator: Separator
    @Binding public var items: [any TimelinePreviewItemModel]
    public let isSeparatorHidden: Bool

    public typealias OptionalTitle = ConfigurationViewWrapper
    public typealias Action = ConfigurationViewWrapper
    public typealias Separator = ConfigurationViewWrapper
}

extension TimelinePreviewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct TimelinePreviewFioriStyle: TimelinePreviewStyle {
    public func makeBody(_ configuration: TimelinePreviewConfiguration) -> some View {
        TimelinePreview(configuration)
            .optionalTitleStyle(OptionalTitleFioriStyle(timelinePreviewConfiguration: configuration))
            .actionStyle(ActionFioriStyle(timelinePreviewConfiguration: configuration))
            .separatorStyle(SeparatorFioriStyle(timelinePreviewConfiguration: configuration))
    }
}
