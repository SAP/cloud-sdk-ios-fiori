// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol UserConsentViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: UserConsentViewConfiguration) -> Body
}

struct AnyUserConsentViewStyle: UserConsentViewStyle {
    let content: (UserConsentViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (UserConsentViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: UserConsentViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct UserConsentViewConfiguration {
    public var componentIdentifier: String = "fiori_userconsentview_component"
    public let userConsentForms: UserConsentForms
    public let didAllow: ((Int) -> Void)?
    public let didDeny: ((Int, Bool) -> Void)?
    public let didCancel: ((Int) -> Void)?
    public let didFinish: (([Int]) -> Void)?

    public typealias UserConsentForms = any IndexedViewContainer
}

extension UserConsentViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct UserConsentViewFioriStyle: UserConsentViewStyle {
    public func makeBody(_ configuration: UserConsentViewConfiguration) -> some View {
        UserConsentView(configuration)
    }
}
