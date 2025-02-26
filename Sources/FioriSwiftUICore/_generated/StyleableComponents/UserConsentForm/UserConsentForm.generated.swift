// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct UserConsentForm {
    let nextAction: any View
    let cancelAction: any View
    let allowAction: any View
    let denyAction: any View
    let notNowAction: any View
    let userConsentPages: any IndexedViewContainer
    let isRequired: Bool
    let alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)?
    let didAllow: (() -> Void)?
    let didDeny: ((Bool) -> Void)?
    let didCancel: (() -> Void)?

    @Environment(\.userConsentFormStyle) var style

    var componentIdentifier: String = UserConsentForm.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder nextAction: () -> any View = { FioriButton { _ in Text("Next".localizedFioriString()) } },
                @ViewBuilder cancelAction: () -> any View = { FioriButton { _ in Text("Cancel".localizedFioriString()) } },
                @ViewBuilder allowAction: () -> any View = { FioriButton { _ in Text("Allow".localizedFioriString()) } },
                @ViewBuilder denyAction: () -> any View = { FioriButton { _ in Text("Deny".localizedFioriString()) } },
                @ViewBuilder notNowAction: () -> any View = { FioriButton { _ in Text("NotNow".localizedFioriString()) } },
                @IndexedViewBuilder userConsentPages: () -> any IndexedViewContainer = { EmptyView() },
                isRequired: Bool = true,
                alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
                didAllow: (() -> Void)? = nil,
                didDeny: ((Bool) -> Void)? = nil,
                didCancel: (() -> Void)? = nil,
                componentIdentifier: String? = UserConsentForm.identifier)
    {
        self.nextAction = NextAction(nextAction: nextAction, componentIdentifier: componentIdentifier)
        self.cancelAction = CancelAction(cancelAction: cancelAction, componentIdentifier: componentIdentifier)
        self.allowAction = AllowAction(allowAction: allowAction, componentIdentifier: componentIdentifier)
        self.denyAction = DenyAction(denyAction: denyAction, componentIdentifier: componentIdentifier)
        self.notNowAction = NotNowAction(notNowAction: notNowAction, componentIdentifier: componentIdentifier)
        self.userConsentPages = userConsentPages()
        self.isRequired = isRequired
        self.alertConfiguration = alertConfiguration
        self.didAllow = didAllow
        self.didDeny = didDeny
        self.didCancel = didCancel
        self.componentIdentifier = componentIdentifier ?? UserConsentForm.identifier
    }
}

public extension UserConsentForm {
    static let identifier = "fiori_userconsentform_component"
}

public extension UserConsentForm {
    init(nextAction: FioriButton? = FioriButton { _ in Text("Next".localizedFioriString()) },
         cancelAction: FioriButton? = FioriButton { _ in Text("Cancel".localizedFioriString()) },
         allowAction: FioriButton? = FioriButton { _ in Text("Allow".localizedFioriString()) },
         denyAction: FioriButton? = FioriButton { _ in Text("Deny".localizedFioriString()) },
         notNowAction: FioriButton? = FioriButton { _ in Text("NotNow".localizedFioriString()) },
         userConsentPages: [UserConsentPage] = [],
         isRequired: Bool = true,
         alertConfiguration: ((UserConsentAlertType) -> AlertConfiguration?)? = _UserConsentFormAlertConfigurationDefault,
         didAllow: (() -> Void)? = nil,
         didDeny: ((Bool) -> Void)? = nil,
         didCancel: (() -> Void)? = nil)
    {
        self.init(nextAction: { nextAction }, cancelAction: { cancelAction }, allowAction: { allowAction }, denyAction: { denyAction }, notNowAction: { notNowAction }, userConsentPages: { _UserConsentPagesContainer(userConsentPages) }, isRequired: isRequired, alertConfiguration: alertConfiguration, didAllow: didAllow, didDeny: didDeny, didCancel: didCancel)
    }
}

public extension UserConsentForm {
    init(_ configuration: UserConsentFormConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: UserConsentFormConfiguration, shouldApplyDefaultStyle: Bool) {
        self.nextAction = configuration.nextAction
        self.cancelAction = configuration.cancelAction
        self.allowAction = configuration.allowAction
        self.denyAction = configuration.denyAction
        self.notNowAction = configuration.notNowAction
        self.userConsentPages = configuration.userConsentPages
        self.isRequired = configuration.isRequired
        self.alertConfiguration = configuration.alertConfiguration
        self.didAllow = configuration.didAllow
        self.didDeny = configuration.didDeny
        self.didCancel = configuration.didCancel
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension UserConsentForm: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, nextAction: .init(self.nextAction), cancelAction: .init(self.cancelAction), allowAction: .init(self.allowAction), denyAction: .init(self.denyAction), notNowAction: .init(self.notNowAction), userConsentPages: self.userConsentPages, isRequired: self.isRequired, alertConfiguration: self.alertConfiguration, didAllow: self.didAllow, didDeny: self.didDeny, didCancel: self.didCancel)).typeErased
                .transformEnvironment(\.userConsentFormStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension UserConsentForm {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        UserConsentForm(.init(componentIdentifier: self.componentIdentifier, nextAction: .init(self.nextAction), cancelAction: .init(self.cancelAction), allowAction: .init(self.allowAction), denyAction: .init(self.denyAction), notNowAction: .init(self.notNowAction), userConsentPages: self.userConsentPages, isRequired: self.isRequired, alertConfiguration: self.alertConfiguration, didAllow: self.didAllow, didDeny: self.didDeny, didCancel: self.didCancel))
            .shouldApplyDefaultStyle(false)
            .userConsentFormStyle(UserConsentFormFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
