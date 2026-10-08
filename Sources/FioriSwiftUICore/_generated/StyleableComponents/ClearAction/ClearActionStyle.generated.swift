// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol ClearActionStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: ClearActionConfiguration) -> Body
}

struct AnyClearActionStyle: ClearActionStyle {
    let content: (ClearActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ClearActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ClearActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ClearActionConfiguration {
    public var componentIdentifier: String = "fiori_clearaction_component"
    public let clearAction: ClearAction

    public typealias ClearAction = ConfigurationViewWrapper
}

extension ClearActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct ClearActionDefaultStyle: ClearActionStyle {
    nonisolated init() {}

    func makeBody(_ configuration: ClearActionConfiguration) -> some View {
        ClearAction(configuration)
            .clearActionStyle(ClearActionBaseStyle())
    }
}
