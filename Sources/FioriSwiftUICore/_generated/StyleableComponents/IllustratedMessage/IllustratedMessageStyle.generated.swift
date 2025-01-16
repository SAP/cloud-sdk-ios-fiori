// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol IllustratedMessageStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: IllustratedMessageConfiguration) -> Body
}

struct AnyIllustratedMessageStyle: IllustratedMessageStyle {
    let content: (IllustratedMessageConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (IllustratedMessageConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct IllustratedMessageConfiguration {
    public var componentIdentifier: String = "fiori_illustratedmessage_component"
    public let detailImage: DetailImage
    public let title: Title
    public let description: Description
    public let action: Action
    public let secondaryAction: SecondaryAction
    public let detailImageSize: IllustratedMessage.DetailImageSize?
    public let isActionVerticallyAligned: Bool
    public let contentAlignment: HorizontalAlignment

    public typealias DetailImage = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
    public typealias Action = ConfigurationViewWrapper
    public typealias SecondaryAction = ConfigurationViewWrapper
}

public extension IllustratedMessageConfiguration {
    var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    var detailImageIdentifier: String {
        self.componentIdentifier + "_detailImage"
    }

    var titleIdentifier: String {
        self.componentIdentifier + "_title"
    }

    var descriptionIdentifier: String {
        self.componentIdentifier + "_description"
    }

    var actionIdentifier: String {
        self.componentIdentifier + "_action"
    }

    var secondaryActionIdentifier: String {
        self.componentIdentifier + "_secondaryAction"
    }
}

extension IllustratedMessageConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct IllustratedMessageFioriStyle: IllustratedMessageStyle {
    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        IllustratedMessage(configuration)
            .detailImageStyle(DetailImageFioriStyle(illustratedMessageConfiguration: configuration))
            .titleStyle(TitleFioriStyle(illustratedMessageConfiguration: configuration))
            .descriptionStyle(DescriptionFioriStyle(illustratedMessageConfiguration: configuration))
            .actionStyle(ActionFioriStyle(illustratedMessageConfiguration: configuration))
            .secondaryActionStyle(SecondaryActionFioriStyle(illustratedMessageConfiguration: configuration))
    }
}

public struct IllustratedMessageNSSStyle: IllustratedMessageStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: IllustratedMessageConfiguration) -> some View {
        IllustratedMessage(configuration)
            .detailImageStyle(DetailImageNSSStyle(illustratedMessageConfiguration: configuration, nssData: self.data.value(configuration.detailImageIdentifier)))
            .titleStyle(TitleNSSStyle(illustratedMessageConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .descriptionStyle(DescriptionNSSStyle(illustratedMessageConfiguration: configuration, nssData: self.data.value(configuration.descriptionIdentifier)))
            .actionStyle(ActionNSSStyle(illustratedMessageConfiguration: configuration, nssData: self.data.value(configuration.actionIdentifier)))
            .secondaryActionStyle(SecondaryActionNSSStyle(illustratedMessageConfiguration: configuration, nssData: self.data.value(configuration.secondaryActionIdentifier)))
            .illustratedMessageStyle(ContentNSSStyle(illustratedMessageConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
