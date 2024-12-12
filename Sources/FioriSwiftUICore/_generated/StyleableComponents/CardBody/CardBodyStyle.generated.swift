// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol CardBodyStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: CardBodyConfiguration) -> Body
}

struct AnyCardBodyStyle: CardBodyStyle {
    let content: (CardBodyConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (CardBodyConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: CardBodyConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct CardBodyConfiguration {
    public let cardBodyIdentifier = "FioriCardBody_cardBody"

    public let cardBody: CardBody

    public typealias CardBody = ConfigurationViewWrapper
}
