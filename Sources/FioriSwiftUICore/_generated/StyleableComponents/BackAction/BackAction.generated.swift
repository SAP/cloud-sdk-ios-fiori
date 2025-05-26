// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct BackAction {
    let backAction: any View

    @Environment(\.backActionStyle) var style

    var componentIdentifier: String = BackAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder backAction: () -> any View = { FioriButton._backButton },
                componentIdentifier: String? = BackAction.identifier)
    {
        self.backAction = backAction()
        self.componentIdentifier = componentIdentifier ?? BackAction.identifier
    }
}

public extension BackAction {
    static let identifier = "fiori_backaction_component"
}

public extension BackAction {
    init(backAction: FioriButton? = FioriButton._backButton) {
        self.init(backAction: { backAction })
    }
}

public extension BackAction {
    init(_ configuration: BackActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: BackActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.backAction = configuration.backAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension BackAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, backAction: .init(self.backAction))).typeErased
                .transformEnvironment(\.backActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension BackAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        BackAction(.init(componentIdentifier: self.componentIdentifier, backAction: .init(self.backAction)))
            .shouldApplyDefaultStyle(false)
            .backActionStyle(.fiori)
            .typeErased
    }
}
