// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct NotNowAction {
    let notNowAction: any View

    @Environment(\.notNowActionStyle) var style

    var componentIdentifier: String = NotNowAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder notNowAction: () -> any View = { FioriButton { _ in Text("NotNow".localizedFioriString()) } },
                componentIdentifier: String? = NotNowAction.identifier)
    {
        self.notNowAction = notNowAction()
        self.componentIdentifier = componentIdentifier ?? NotNowAction.identifier
    }
}

public extension NotNowAction {
    static let identifier = "fiori_notnowaction_component"
}

public extension NotNowAction {
    init(notNowAction: FioriButton? = FioriButton { _ in Text("NotNow".localizedFioriString()) }) {
        self.init(notNowAction: { notNowAction })
    }
}

public extension NotNowAction {
    init(_ configuration: NotNowActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: NotNowActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.notNowAction = configuration.notNowAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension NotNowAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, notNowAction: .init(self.notNowAction))).typeErased
                .transformEnvironment(\.notNowActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension NotNowAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        NotNowAction(.init(componentIdentifier: self.componentIdentifier, notNowAction: .init(self.notNowAction)))
            .shouldApplyDefaultStyle(false)
            .notNowActionStyle(.fiori)
            .typeErased
    }
}
