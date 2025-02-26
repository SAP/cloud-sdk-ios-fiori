// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `UserConsentView` is used to display a series of user consent screens modally during the process of onboarding.
/// ## Usage
/// ```swift
/// UserConsentView {
///     UserConsentForm(userConsentPages: {
///                    UserConsentPage {
///                        Text("Form 0 Page 0")
///                    } bodyText: {
///                        Text("detailText")
///                    } action: {
///                        Button {
///                        } label: {
///                            Text("Learn more about privacy")
///                        }
///                    }
///                    UserConsentPage {
///                        Text("Form 0 Page 1")
///                    } bodyText: {
///                        Text("detailText")
///                    } action: {
///                        Button {
///                        } label: {
///                            Text("Learn more about privacy")
///                        }
///                    }
///                },
///                didAllow: { print("UserConsentForm - didAllow") }
///     )
///     UserConsentForm(userConsentPages: {
///                    UserConsentPage {
///                        Text("Form 1 Page 0")
///                    } bodyText: {
///                        Text("detailText")
///                    } action: {
///                        Button {
///                        } label: {
///                         Text("Learn more about Data Privacy")
///                        }
///                     }
///                 },
///                 isRequired: false,
///                 didAllow: { print("UserConsentForm - didAllow") })
/// } didAllow: {
///     print("UserConsentView - didAllow: index: \($0)")
/// } didDeny: {
///     print("UserConsentView - didDeny: index: \($0), isRequired: \($1)")
/// } didCancel: { _ in
///     print("UserConsentView - didCancel")
/// } didFinish: { _ in
///     presentationMode.wrappedValue.dismiss()
/// }
/// ```
public struct UserConsentView {
    let userConsentForms: any IndexedViewContainer
    let didAllow: ((Int) -> Void)?
    let didDeny: ((Int, Bool) -> Void)?
    let didCancel: ((Int) -> Void)?
    let didFinish: (([Int]) -> Void)?

    @Environment(\.userConsentViewStyle) var style

    var componentIdentifier: String = UserConsentView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@IndexedViewBuilder userConsentForms: () -> any IndexedViewContainer = { EmptyView() },
                didAllow: ((Int) -> Void)? = nil,
                didDeny: ((Int, Bool) -> Void)? = nil,
                didCancel: ((Int) -> Void)? = nil,
                didFinish: (([Int]) -> Void)? = nil,
                componentIdentifier: String? = UserConsentView.identifier)
    {
        self.userConsentForms = userConsentForms()
        self.didAllow = didAllow
        self.didDeny = didDeny
        self.didCancel = didCancel
        self.didFinish = didFinish
        self.componentIdentifier = componentIdentifier ?? UserConsentView.identifier
    }
}

public extension UserConsentView {
    static let identifier = "fiori_userconsentview_component"
}

public extension UserConsentView {
    init(userConsentForms: [UserConsentForm] = [],
         didAllow: ((Int) -> Void)? = nil,
         didDeny: ((Int, Bool) -> Void)? = nil,
         didCancel: ((Int) -> Void)? = nil,
         didFinish: (([Int]) -> Void)? = nil)
    {
        self.init(userConsentForms: { _UserConsentFormsContainer(userConsentForms) }, didAllow: didAllow, didDeny: didDeny, didCancel: didCancel, didFinish: didFinish)
    }
}

public extension UserConsentView {
    init(_ configuration: UserConsentViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: UserConsentViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.userConsentForms = configuration.userConsentForms
        self.didAllow = configuration.didAllow
        self.didDeny = configuration.didDeny
        self.didCancel = configuration.didCancel
        self.didFinish = configuration.didFinish
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension UserConsentView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, userConsentForms: self.userConsentForms, didAllow: self.didAllow, didDeny: self.didDeny, didCancel: self.didCancel, didFinish: self.didFinish)).typeErased
                .transformEnvironment(\.userConsentViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension UserConsentView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        UserConsentView(.init(componentIdentifier: self.componentIdentifier, userConsentForms: self.userConsentForms, didAllow: self.didAllow, didDeny: self.didDeny, didCancel: self.didCancel, didFinish: self.didFinish))
            .shouldApplyDefaultStyle(false)
            .userConsentViewStyle(UserConsentViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
