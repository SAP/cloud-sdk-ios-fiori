// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AttributeStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AttributeConfiguration) -> Body
}

struct AnyAttributeStyle: AttributeStyle {
    let content: (AttributeConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AttributeConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AttributeConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AttributeConfiguration {
    public let attribute: Attribute

    public typealias Attribute = ConfigurationViewWrapper
}
