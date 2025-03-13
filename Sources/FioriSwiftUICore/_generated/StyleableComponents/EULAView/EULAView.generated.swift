// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `EULAView` is used to display the End User License Agreement, EULA.
/// ## Usage
/// ```swift
///        EULAView(title: "EULA",
///                 bodyText: "BodyText",
///                 didAgree: {
///            print("EULAView - didAgree")
///        },
///                 didDisagree: {
///            print("EULAView - didDisagree")
///        },
///                 didCancel: {
///            presentationMode.wrappedValue.dismiss()
///        })
/// ```
public struct EULAView {
    let title: any View
    let bodyText: any View
    let agreeAction: any View
    let disagreeAction: any View
    let cancelAction: any View
    let didAgree: (() -> Void)?
    let didDisagree: (() -> Void)?
    let didCancel: (() -> Void)?

    @Environment(\.eULAViewStyle) var style

    var componentIdentifier: String = EULAView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder bodyText: () -> any View = { EmptyView() },
                @ViewBuilder agreeAction: () -> any View = { FioriButton { _ in Text("Agree".localizedFioriString()) } },
                @ViewBuilder disagreeAction: () -> any View = { FioriButton { _ in Text("Disagree".localizedFioriString()) } },
                @ViewBuilder cancelAction: () -> any View = { FioriButton { _ in Text("Cancel".localizedFioriString()) } },
                didAgree: (() -> Void)? = nil,
                didDisagree: (() -> Void)? = nil,
                didCancel: (() -> Void)? = nil,
                componentIdentifier: String? = EULAView.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.bodyText = BodyText(bodyText: bodyText, componentIdentifier: componentIdentifier)
        self.agreeAction = AgreeAction(agreeAction: agreeAction, componentIdentifier: componentIdentifier)
        self.disagreeAction = DisagreeAction(disagreeAction: disagreeAction, componentIdentifier: componentIdentifier)
        self.cancelAction = CancelAction(cancelAction: cancelAction, componentIdentifier: componentIdentifier)
        self.didAgree = didAgree
        self.didDisagree = didDisagree
        self.didCancel = didCancel
        self.componentIdentifier = componentIdentifier ?? EULAView.identifier
    }
}

public extension EULAView {
    static let identifier = "fiori_eulaview_component"
}

public extension EULAView {
    init(title: AttributedString,
         bodyText: AttributedString? = nil,
         agreeAction: FioriButton? = FioriButton { _ in Text("Agree".localizedFioriString()) },
         disagreeAction: FioriButton? = FioriButton { _ in Text("Disagree".localizedFioriString()) },
         cancelAction: FioriButton? = FioriButton { _ in Text("Cancel".localizedFioriString()) },
         didAgree: (() -> Void)? = nil,
         didDisagree: (() -> Void)? = nil,
         didCancel: (() -> Void)? = nil)
    {
        self.init(title: { Text(title) }, bodyText: { OptionalText(bodyText) }, agreeAction: { agreeAction }, disagreeAction: { disagreeAction }, cancelAction: { cancelAction }, didAgree: didAgree, didDisagree: didDisagree, didCancel: didCancel)
    }
}

public extension EULAView {
    init(_ configuration: EULAViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: EULAViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.bodyText = configuration.bodyText
        self.agreeAction = configuration.agreeAction
        self.disagreeAction = configuration.disagreeAction
        self.cancelAction = configuration.cancelAction
        self.didAgree = configuration.didAgree
        self.didDisagree = configuration.didDisagree
        self.didCancel = configuration.didCancel
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension EULAView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), bodyText: .init(self.bodyText), agreeAction: .init(self.agreeAction), disagreeAction: .init(self.disagreeAction), cancelAction: .init(self.cancelAction), didAgree: self.didAgree, didDisagree: self.didDisagree, didCancel: self.didCancel)).typeErased
                .transformEnvironment(\.eULAViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension EULAView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        EULAView(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), bodyText: .init(self.bodyText), agreeAction: .init(self.agreeAction), disagreeAction: .init(self.disagreeAction), cancelAction: .init(self.cancelAction), didAgree: self.didAgree, didDisagree: self.didDisagree, didCancel: self.didCancel))
            .shouldApplyDefaultStyle(false)
            .eULAViewStyle(EULAViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
