// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol SignInActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SignInActionConfiguration) -> Body
}

struct AnySignInActionStyle: SignInActionStyle {
    let content: (SignInActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SignInActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SignInActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SignInActionConfiguration {
    public var componentIdentifier: String = "fiori_signinaction_component"
    public let signInAction: SignInAction

    public typealias SignInAction = ConfigurationViewWrapper
}

extension SignInActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
