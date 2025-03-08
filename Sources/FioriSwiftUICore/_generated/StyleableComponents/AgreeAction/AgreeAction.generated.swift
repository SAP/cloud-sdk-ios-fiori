// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct AgreeAction {
    let agreeAction: any View

    @Environment(\.agreeActionStyle) var style

    var componentIdentifier: String = AgreeAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder agreeAction: () -> any View = { FioriButton { _ in Text("Agree".localizedFioriString()) } },
                componentIdentifier: String? = AgreeAction.identifier)
    {
        self.agreeAction = agreeAction()
        self.componentIdentifier = componentIdentifier ?? AgreeAction.identifier
    }
}

public extension AgreeAction {
    static let identifier = "fiori_agreeaction_component"
}

public extension AgreeAction {
    init(agreeAction: FioriButton? = FioriButton { _ in Text("Agree".localizedFioriString()) }) {
        self.init(agreeAction: { agreeAction })
    }
}

public extension AgreeAction {
    init(_ configuration: AgreeActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AgreeActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.agreeAction = configuration.agreeAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AgreeAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, agreeAction: .init(self.agreeAction))).typeErased
                .transformEnvironment(\.agreeActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AgreeAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AgreeAction(.init(componentIdentifier: self.componentIdentifier, agreeAction: .init(self.agreeAction)))
            .shouldApplyDefaultStyle(false)
            .agreeActionStyle(.fiori)
            .typeErased
    }
}
