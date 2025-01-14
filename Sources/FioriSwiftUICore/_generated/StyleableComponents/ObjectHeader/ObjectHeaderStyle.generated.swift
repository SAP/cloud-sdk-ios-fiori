// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public let contentIdentifier = "FioriObjectHeader_content"
    public let titleIdentifier = "FioriObjectHeader_title"
    public let subtitleIdentifier = "FioriObjectHeader_subtitle"
    public let tagsIdentifier = "FioriObjectHeader_tags"
    public let bodyTextIdentifier = "FioriObjectHeader_bodyText"
    public let footnoteIdentifier = "FioriObjectHeader_footnote"
    public let descriptionTextIdentifier = "FioriObjectHeader_descriptionText"
    public let statusIdentifier = "FioriObjectHeader_status"
    public let substatusIdentifier = "FioriObjectHeader_substatus"
    public let detailImageIdentifier = "FioriObjectHeader_detailImage"
    public let detailContentIdentifier = "FioriObjectHeader_detailContent"

    public var componentIdentifier: String = "fiori_objectheader_component"
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

extension ObjectHeaderConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
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

public struct ObjectHeaderNSSStyle: ObjectHeaderStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: ObjectHeaderConfiguration) -> some View {
        ObjectHeader(configuration)
            .titleStyle(TitleNSSStyle(objectHeaderConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .subtitleStyle(SubtitleNSSStyle(objectHeaderConfiguration: configuration, nssData: self.data.value(configuration.subtitleIdentifier)))
            .tagsStyle(TagsNSSStyle(objectHeaderConfiguration: configuration, nssData: self.data.value(configuration.tagsIdentifier)))
            .bodyTextStyle(BodyTextNSSStyle(objectHeaderConfiguration: configuration, nssData: self.data.value(configuration.bodyTextIdentifier)))
            .footnoteStyle(FootnoteNSSStyle(objectHeaderConfiguration: configuration, nssData: self.data.value(configuration.footnoteIdentifier)))
            .descriptionTextStyle(DescriptionTextNSSStyle(objectHeaderConfiguration: configuration, nssData: self.data.value(configuration.descriptionTextIdentifier)))
            .statusStyle(StatusNSSStyle(objectHeaderConfiguration: configuration, nssData: self.data.value(configuration.statusIdentifier)))
            .substatusStyle(SubstatusNSSStyle(objectHeaderConfiguration: configuration, nssData: self.data.value(configuration.substatusIdentifier)))
            .detailImageStyle(DetailImageNSSStyle(objectHeaderConfiguration: configuration, nssData: self.data.value(configuration.detailImageIdentifier)))
            .detailContentStyle(DetailContentNSSStyle(objectHeaderConfiguration: configuration, nssData: self.data.value(configuration.detailContentIdentifier)))
            .objectHeaderStyle(ContentNSSStyle(objectHeaderConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
