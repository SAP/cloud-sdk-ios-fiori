// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct CardMedia {
    let mediaImage: any View
    let description: any View

    @Environment(\.cardMediaStyle) var style

    var componentIdentifier: String = CardMedia.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder mediaImage: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() },
                componentIdentifier: String? = CardMedia.identifier)
    {
        self.mediaImage = MediaImage(mediaImage: mediaImage, componentIdentifier: componentIdentifier)
        self.description = Description(description: description, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? CardMedia.identifier
    }
}

public extension CardMedia {
    static let identifier = "fiori_cardmedia_component"
}

public extension CardMedia {
    init(mediaImage: Image? = nil,
         description: AttributedString? = nil,
         componentIdentifier: String? = CardMedia.identifier)
    {
        self.init(mediaImage: { OptionalImage(mediaImage) }, description: { OptionalText(description) }, componentIdentifier: componentIdentifier)
    }
}

public extension CardMedia {
    init(_ configuration: CardMediaConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: CardMediaConfiguration, shouldApplyDefaultStyle: Bool) {
        self.mediaImage = configuration.mediaImage
        self.description = configuration.description
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension CardMedia: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, mediaImage: .init(self.mediaImage), description: .init(self.description))).typeErased
                .transformEnvironment(\.cardMediaStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension CardMedia {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        CardMedia(.init(componentIdentifier: self.componentIdentifier, mediaImage: .init(self.mediaImage), description: .init(self.description)))
            .shouldApplyDefaultStyle(false)
            .cardMediaStyle(CardMediaFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
