// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct UserConsentPage {
    let title: any View
    let bodyText: any View
    let action: any View

    @Environment(\.userConsentPageStyle) var style

    var componentIdentifier: String = UserConsentPage.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder bodyText: () -> any View = { EmptyView() },
                @ViewBuilder action: () -> any View = { EmptyView() },
                componentIdentifier: String? = UserConsentPage.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.bodyText = BodyText(bodyText: bodyText, componentIdentifier: componentIdentifier)
        self.action = Action(action: action, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? UserConsentPage.identifier
    }
}

public extension UserConsentPage {
    static let identifier = "fiori_userconsentpage_component"
}

public extension UserConsentPage {
    init(title: AttributedString,
         bodyText: AttributedString? = nil,
         action: FioriButton? = nil)
    {
        self.init(title: { Text(title) }, bodyText: { OptionalText(bodyText) }, action: { action })
    }
}

public extension UserConsentPage {
    init(_ configuration: UserConsentPageConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: UserConsentPageConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.bodyText = configuration.bodyText
        self.action = configuration.action
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension UserConsentPage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), bodyText: .init(self.bodyText), action: .init(self.action))).typeErased
                .transformEnvironment(\.userConsentPageStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension UserConsentPage {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        UserConsentPage(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), bodyText: .init(self.bodyText), action: .init(self.action)))
            .shouldApplyDefaultStyle(false)
            .userConsentPageStyle(UserConsentPageFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
