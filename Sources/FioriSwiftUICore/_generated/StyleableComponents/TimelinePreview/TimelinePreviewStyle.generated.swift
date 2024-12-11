// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public let contentIdentifier = "FioriTimelinePreview_content"
    public let optionalTitleIdentifier = "FioriTimelinePreview_optionalTitle"
    public let actionIdentifier = "FioriTimelinePreview_action"

    public let optionalTitle: OptionalTitle
    public let action: Action
    @Binding public var items: [any TimelinePreviewItemModel]

    public typealias OptionalTitle = ConfigurationViewWrapper
    public typealias Action = ConfigurationViewWrapper
}

public struct TimelinePreviewFioriStyle: TimelinePreviewStyle {
    public func makeBody(_ configuration: TimelinePreviewConfiguration) -> some View {
        TimelinePreview(configuration)
            .optionalTitleStyle(OptionalTitleFioriStyle(timelinePreviewConfiguration: configuration))
            .actionStyle(ActionFioriStyle(timelinePreviewConfiguration: configuration))
    }
}

public struct TimelinePreviewNSSStyle: TimelinePreviewStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: TimelinePreviewConfiguration) -> some View {
        TimelinePreview(configuration)
            .optionalTitleStyle(OptionalTitleNSSStyle(timelinePreviewConfiguration: configuration, nssData: self.data.value(configuration.optionalTitleIdentifier)))
            .actionStyle(ActionNSSStyle(timelinePreviewConfiguration: configuration, nssData: self.data.value(configuration.actionIdentifier)))
            .timelinePreviewStyle(ContentNSSStyle(timelinePreviewConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
