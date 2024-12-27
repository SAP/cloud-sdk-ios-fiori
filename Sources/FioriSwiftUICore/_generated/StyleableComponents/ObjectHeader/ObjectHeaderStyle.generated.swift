// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol ObjectHeaderStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ObjectHeaderConfiguration) -> Body
}

struct AnyObjectHeaderStyle: ObjectHeaderStyle {
    let content: (ObjectHeaderConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ObjectHeaderConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ObjectHeaderConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ObjectHeaderConfiguration {
    public let title: Title
    public let subtitle: Subtitle
    public let tags: Tags
    public let bodyText: BodyText
    public let footnote: Footnote
    public let descriptionText: DescriptionText
    public let status: Status
    public let substatus: Substatus
    public let detailImage: DetailImage
    public let detailContent: DetailContent

    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias Tags = ConfigurationViewWrapper
    public typealias BodyText = ConfigurationViewWrapper
    public typealias Footnote = ConfigurationViewWrapper
    public typealias DescriptionText = ConfigurationViewWrapper
    public typealias Status = ConfigurationViewWrapper
    public typealias Substatus = ConfigurationViewWrapper
    public typealias DetailImage = ConfigurationViewWrapper
    public typealias DetailContent = ConfigurationViewWrapper
}

public struct ObjectHeaderFioriStyle: ObjectHeaderStyle {
    public func makeBody(_ configuration: ObjectHeaderConfiguration) -> some View {
        ObjectHeader(configuration)
            .titleStyle(TitleFioriStyle(objectHeaderConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(objectHeaderConfiguration: configuration))
            .tagsStyle(TagsFioriStyle(objectHeaderConfiguration: configuration))
            .bodyTextStyle(BodyTextFioriStyle(objectHeaderConfiguration: configuration))
            .footnoteStyle(FootnoteFioriStyle(objectHeaderConfiguration: configuration))
            .descriptionTextStyle(DescriptionTextFioriStyle(objectHeaderConfiguration: configuration))
            .statusStyle(StatusFioriStyle(objectHeaderConfiguration: configuration))
            .substatusStyle(SubstatusFioriStyle(objectHeaderConfiguration: configuration))
            .detailImageStyle(DetailImageFioriStyle(objectHeaderConfiguration: configuration))
            .detailContentStyle(DetailContentFioriStyle(objectHeaderConfiguration: configuration))
    }
}
