// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol SubAttributeStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: SubAttributeConfiguration) -> Body
}

struct AnySubAttributeStyle: SubAttributeStyle {
    let content: (SubAttributeConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SubAttributeConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SubAttributeConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SubAttributeConfiguration {
    public var componentIdentifier: String = "fiori_subattribute_component"
    public let subAttribute: SubAttribute

    public typealias SubAttribute = ConfigurationViewWrapper
}

extension SubAttributeConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct SubAttributeDefaultStyle: SubAttributeStyle {
    nonisolated init() {}

    func makeBody(_ configuration: SubAttributeConfiguration) -> some View {
        SubAttribute(configuration)
            .subAttributeStyle(SubAttributeBaseStyle())
    }
}
