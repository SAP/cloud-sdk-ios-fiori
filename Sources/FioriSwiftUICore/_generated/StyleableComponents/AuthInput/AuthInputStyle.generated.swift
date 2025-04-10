// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AuthInputStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AuthInputConfiguration) -> Body
}

struct AnyAuthInputStyle: AuthInputStyle {
    let content: (AuthInputConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AuthInputConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AuthInputConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AuthInputConfiguration {
    public var componentIdentifier: String = "fiori_authinput_component"
    public let authInput: AuthInput

    public typealias AuthInput = ConfigurationViewWrapper
}

extension AuthInputConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
