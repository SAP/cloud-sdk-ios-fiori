// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AgreeActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AgreeActionConfiguration) -> Body
}

struct AnyAgreeActionStyle: AgreeActionStyle {
    let content: (AgreeActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AgreeActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AgreeActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AgreeActionConfiguration {
    public var componentIdentifier: String = "fiori_agreeaction_component"
    public let agreeAction: AgreeAction

    public typealias AgreeAction = ConfigurationViewWrapper
}

extension AgreeActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
