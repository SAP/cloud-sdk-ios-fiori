// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol CardMediaStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: CardMediaConfiguration) -> Body
}

struct AnyCardMediaStyle: CardMediaStyle {
    let content: (CardMediaConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (CardMediaConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: CardMediaConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct CardMediaConfiguration {
    public var componentIdentifier: String = "fiori_cardmedia_component"
    public let mediaImage: MediaImage
    public let description: Description

    public typealias MediaImage = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
}

public extension CardMediaConfiguration {
    var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    var mediaImageIdentifier: String {
        self.componentIdentifier + "_mediaImage"
    }

    var descriptionIdentifier: String {
        self.componentIdentifier + "_description"
    }
}

extension CardMediaConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct CardMediaFioriStyle: CardMediaStyle {
    public func makeBody(_ configuration: CardMediaConfiguration) -> some View {
        CardMedia(configuration)
            .mediaImageStyle(MediaImageFioriStyle(cardMediaConfiguration: configuration))
            .descriptionStyle(DescriptionFioriStyle(cardMediaConfiguration: configuration))
    }
}

public struct CardMediaNSSStyle: CardMediaStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: CardMediaConfiguration) -> some View {
        CardMedia(configuration)
            .mediaImageStyle(MediaImageNSSStyle(cardMediaConfiguration: configuration, nssData: self.data.value(configuration.mediaImageIdentifier)))
            .descriptionStyle(DescriptionNSSStyle(cardMediaConfiguration: configuration, nssData: self.data.value(configuration.descriptionIdentifier)))
            .cardMediaStyle(ContentNSSStyle(cardMediaConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
