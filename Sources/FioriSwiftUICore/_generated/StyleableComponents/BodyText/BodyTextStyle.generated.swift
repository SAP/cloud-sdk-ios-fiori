// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol BodyTextStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: BodyTextConfiguration) -> Body
}

struct AnyBodyTextStyle: BodyTextStyle {
    let content: (BodyTextConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (BodyTextConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: BodyTextConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct BodyTextConfiguration {
    public let bodyText: BodyText

    public typealias BodyText = ConfigurationViewWrapper
}
