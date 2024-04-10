// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
    public let mediaImage: MediaImage
    public let description: Description

    public typealias MediaImage = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
}

public struct CardMediaFioriStyle: CardMediaStyle {
    public func makeBody(_ configuration: CardMediaConfiguration) -> some View {
        CardMedia(configuration)
            .mediaImageStyle(MediaImageFioriStyle(cardMediaConfiguration: configuration))
            .descriptionStyle(DescriptionFioriStyle(cardMediaConfiguration: configuration))
    }
}
