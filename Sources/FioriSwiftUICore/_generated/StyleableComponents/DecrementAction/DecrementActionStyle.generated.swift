// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol DecrementActionStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: DecrementActionConfiguration) -> Body
}

struct AnyDecrementActionStyle: DecrementActionStyle {
    let content: (DecrementActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DecrementActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DecrementActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct DecrementActionConfiguration {
    public var componentIdentifier: String = "fiori_decrementaction_component"
    public let decrementAction: DecrementAction

    public typealias DecrementAction = ConfigurationViewWrapper
}

extension DecrementActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct DecrementActionDefaultStyle: DecrementActionStyle {
    nonisolated init() {}

    func makeBody(_ configuration: DecrementActionConfiguration) -> some View {
        DecrementAction(configuration)
            .decrementActionStyle(DecrementActionBaseStyle())
    }
}
