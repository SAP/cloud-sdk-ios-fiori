// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AuthenticationStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AuthenticationConfiguration) -> Body
}

struct AnyAuthenticationStyle: AuthenticationStyle {
    let content: (AuthenticationConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AuthenticationConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AuthenticationConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AuthenticationConfiguration {
    public var componentIdentifier: String = "fiori_authentication_component"
    public let detailImage: DetailImage
    public let title: Title
    public let subtitle: Subtitle
    public let authInput: AuthInput
    public let signInAction: SignInAction
    public let isDisabled: Bool
    public let didSignIn: (() -> Void)?

    public typealias DetailImage = ConfigurationViewWrapper
    public typealias Title = ConfigurationViewWrapper
    public typealias Subtitle = ConfigurationViewWrapper
    public typealias AuthInput = ConfigurationViewWrapper
    public typealias SignInAction = ConfigurationViewWrapper
}

extension AuthenticationConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct AuthenticationFioriStyle: AuthenticationStyle {
    public func makeBody(_ configuration: AuthenticationConfiguration) -> some View {
        Authentication(configuration)
            .detailImageStyle(DetailImageFioriStyle(authenticationConfiguration: configuration))
            .titleStyle(TitleFioriStyle(authenticationConfiguration: configuration))
            .subtitleStyle(SubtitleFioriStyle(authenticationConfiguration: configuration))
            .authInputStyle(AuthInputFioriStyle(authenticationConfiguration: configuration))
            .signInActionStyle(SignInActionFioriStyle(authenticationConfiguration: configuration))
    }
}
