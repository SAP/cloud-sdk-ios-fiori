// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol AttributeStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: AttributeConfiguration) -> Body
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
    public var componentIdentifier: String = "fiori_attribute_component"
    public let attribute: Attribute

    public typealias Attribute = ConfigurationViewWrapper
}

extension AttributeConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
