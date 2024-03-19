// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct CardMedia {
    let mediaImage: any View
    let description: any View

    @Environment(\.cardMediaStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder mediaImage: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() })
    {
        self.mediaImage = MediaImage { mediaImage() }
        self.description = Description { description() }
    }
}

public extension CardMedia {
    init(mediaImage: Image? = nil,
         description: AttributedString? = nil)
    {
        self.init(mediaImage: { mediaImage }, description: { OptionalText(description) })
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
    }
}

extension CardMedia: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(mediaImage: .init(self.mediaImage), description: .init(self.description))).typeErased
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
        CardMedia(.init(mediaImage: .init(self.mediaImage), description: .init(self.description)))
            .shouldApplyDefaultStyle(false)
            .cardMediaStyle(CardMediaFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
