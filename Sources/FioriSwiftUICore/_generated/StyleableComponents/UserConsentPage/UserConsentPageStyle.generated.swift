// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol UserConsentPageStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: UserConsentPageConfiguration) -> Body
}

struct AnyUserConsentPageStyle: UserConsentPageStyle {
    let content: (UserConsentPageConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (UserConsentPageConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: UserConsentPageConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct UserConsentPageConfiguration {
    public var componentIdentifier: String = "fiori_userconsentpage_component"
    public let title: Title
    public let bodyText: BodyText
    public let action: Action

    public typealias Title = ConfigurationViewWrapper
    public typealias BodyText = ConfigurationViewWrapper
    public typealias Action = ConfigurationViewWrapper
}

extension UserConsentPageConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct UserConsentPageFioriStyle: UserConsentPageStyle {
    public func makeBody(_ configuration: UserConsentPageConfiguration) -> some View {
        UserConsentPage(configuration)
            .titleStyle(TitleFioriStyle(userConsentPageConfiguration: configuration))
            .bodyTextStyle(BodyTextFioriStyle(userConsentPageConfiguration: configuration))
            .actionStyle(ActionFioriStyle(userConsentPageConfiguration: configuration))
    }
}
