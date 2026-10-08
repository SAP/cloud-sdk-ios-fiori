// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol DescriptionStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: DescriptionConfiguration) -> Body
}

struct AnyDescriptionStyle: DescriptionStyle {
    let content: (DescriptionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DescriptionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DescriptionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct DescriptionConfiguration {
    public var componentIdentifier: String = "fiori_description_component"
    public let description: Description

    public typealias Description = ConfigurationViewWrapper
}

extension DescriptionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct DescriptionDefaultStyle: DescriptionStyle {
    nonisolated init() {}

    func makeBody(_ configuration: DescriptionConfiguration) -> some View {
        Description(configuration)
            .descriptionStyle(DescriptionBaseStyle())
    }
}
