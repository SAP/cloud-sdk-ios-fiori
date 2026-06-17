// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol DenyActionStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: DenyActionConfiguration) -> Body
}

struct AnyDenyActionStyle: DenyActionStyle {
    let content: (DenyActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DenyActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DenyActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct DenyActionConfiguration {
    public var componentIdentifier: String = "fiori_denyaction_component"
    public let denyAction: DenyAction

    public typealias DenyAction = ConfigurationViewWrapper
}

extension DenyActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
