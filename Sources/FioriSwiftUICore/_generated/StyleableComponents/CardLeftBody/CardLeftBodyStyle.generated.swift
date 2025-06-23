// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol CardLeftBodyStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: CardLeftBodyConfiguration) -> Body
}

struct AnyCardLeftBodyStyle: CardLeftBodyStyle {
    let content: (CardLeftBodyConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (CardLeftBodyConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: CardLeftBodyConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct CardLeftBodyConfiguration {
    public var componentIdentifier: String = "fiori_cardleftbody_component"
    public let mediaLeftImage: MediaLeftImage
    public let isIncludeFooter: Bool

    public typealias MediaLeftImage = ConfigurationViewWrapper
}

extension CardLeftBodyConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct CardLeftBodyFioriStyle: CardLeftBodyStyle {
    public func makeBody(_ configuration: CardLeftBodyConfiguration) -> some View {
        CardLeftBody(configuration)
    }
}
