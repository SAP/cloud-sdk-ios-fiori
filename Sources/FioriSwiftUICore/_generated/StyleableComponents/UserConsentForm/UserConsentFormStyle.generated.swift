// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol UserConsentFormStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: UserConsentFormConfiguration) -> Body
}

struct AnyUserConsentFormStyle: UserConsentFormStyle {
    let content: (UserConsentFormConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (UserConsentFormConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: UserConsentFormConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct UserConsentFormConfiguration {
    public var componentIdentifier: String = "fiori_userconsentform_component"
    public let nextAction: NextAction
    public let cancelAction: CancelAction
    public let allowAction: AllowAction
    public let denyAction: DenyAction
    public let notNowAction: NotNowAction
    public let userConsentPages: UserConsentPages
    public let isRequired: Bool
    public let alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)?
    public let didAllow: (() -> Void)?
    public let didDeny: ((Bool) -> Void)?
    public let didCancel: (() -> Void)?

    public typealias NextAction = ConfigurationViewWrapper
    public typealias CancelAction = ConfigurationViewWrapper
    public typealias AllowAction = ConfigurationViewWrapper
    public typealias DenyAction = ConfigurationViewWrapper
    public typealias NotNowAction = ConfigurationViewWrapper
    public typealias UserConsentPages = any IndexedViewContainer
}

extension UserConsentFormConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct UserConsentFormFioriStyle: UserConsentFormStyle {
    public func makeBody(_ configuration: UserConsentFormConfiguration) -> some View {
        UserConsentForm(configuration)
            .nextActionStyle(NextActionFioriStyle(userConsentFormConfiguration: configuration))
            .cancelActionStyle(CancelActionFioriStyle(userConsentFormConfiguration: configuration))
            .allowActionStyle(AllowActionFioriStyle(userConsentFormConfiguration: configuration))
            .denyActionStyle(DenyActionFioriStyle(userConsentFormConfiguration: configuration))
            .notNowActionStyle(NotNowActionFioriStyle(userConsentFormConfiguration: configuration))
    }
}
