// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol DisagreeActionStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: DisagreeActionConfiguration) -> Body
}

struct AnyDisagreeActionStyle: DisagreeActionStyle {
    let content: (DisagreeActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DisagreeActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DisagreeActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct DisagreeActionConfiguration {
    public var componentIdentifier: String = "fiori_disagreeaction_component"
    public let disagreeAction: DisagreeAction

    public typealias DisagreeAction = ConfigurationViewWrapper
}

extension DisagreeActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
