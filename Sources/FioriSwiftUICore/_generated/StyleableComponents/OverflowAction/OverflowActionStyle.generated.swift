// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol OverflowActionStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: OverflowActionConfiguration) -> Body
}

struct AnyOverflowActionStyle: OverflowActionStyle {
    let content: (OverflowActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (OverflowActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: OverflowActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct OverflowActionConfiguration {
    public var componentIdentifier: String = "fiori_overflowaction_component"
    public let overflowAction: OverflowAction

    public typealias OverflowAction = ConfigurationViewWrapper
}

extension OverflowActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct OverflowActionDefaultStyle: OverflowActionStyle {
    nonisolated init() {}

    func makeBody(_ configuration: OverflowActionConfiguration) -> some View {
        OverflowAction(configuration)
            .overflowActionStyle(OverflowActionBaseStyle())
    }
}
