// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct CardLeftBody {
    let mediaLeftImage: any View
    let isIncludeFooter: Bool

    @Environment(\.cardLeftBodyStyle) var style

    var componentIdentifier: String = CardLeftBody.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder mediaLeftImage: () -> any View = { EmptyView() },
                isIncludeFooter: Bool = false,
                componentIdentifier: String? = CardLeftBody.identifier)
    {
        self.mediaLeftImage = mediaLeftImage()
        self.isIncludeFooter = isIncludeFooter
        self.componentIdentifier = componentIdentifier ?? CardLeftBody.identifier
    }
}

public extension CardLeftBody {
    static let identifier = "fiori_cardleftbody_component"
}

public extension CardLeftBody {
    init(mediaLeftImage: Image? = nil,
         isIncludeFooter: Bool = false)
    {
        self.init(mediaLeftImage: { OptionalImage(mediaLeftImage) }, isIncludeFooter: isIncludeFooter)
    }
}

public extension CardLeftBody {
    init(_ configuration: CardLeftBodyConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: CardLeftBodyConfiguration, shouldApplyDefaultStyle: Bool) {
        self.mediaLeftImage = configuration.mediaLeftImage
        self.isIncludeFooter = configuration.isIncludeFooter
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension CardLeftBody: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, mediaLeftImage: .init(self.mediaLeftImage), isIncludeFooter: self.isIncludeFooter)).typeErased
                .transformEnvironment(\.cardLeftBodyStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension CardLeftBody {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        CardLeftBody(.init(componentIdentifier: self.componentIdentifier, mediaLeftImage: .init(self.mediaLeftImage), isIncludeFooter: self.isIncludeFooter))
            .shouldApplyDefaultStyle(false)
            .cardLeftBodyStyle(CardLeftBodyFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
