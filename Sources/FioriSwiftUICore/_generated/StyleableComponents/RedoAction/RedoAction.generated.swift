// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct RedoAction {
    let redoAction: any View

    @Environment(\.redoActionStyle) var style

    var componentIdentifier: String = RedoAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder redoAction: () -> any View = { FioriButton._redoButton },
                componentIdentifier: String? = RedoAction.identifier)
    {
        self.redoAction = redoAction()
        self.componentIdentifier = componentIdentifier ?? RedoAction.identifier
    }
}

public extension RedoAction {
    static let identifier = "fiori_redoaction_component"
}

public extension RedoAction {
    init(redoAction: FioriButton? = FioriButton._redoButton) {
        self.init(redoAction: { redoAction })
    }
}

public extension RedoAction {
    init(_ configuration: RedoActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: RedoActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.redoAction = configuration.redoAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension RedoAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, redoAction: .init(self.redoAction))).typeErased
                .transformEnvironment(\.redoActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension RedoAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        RedoAction(.init(componentIdentifier: self.componentIdentifier, redoAction: .init(self.redoAction)))
            .shouldApplyDefaultStyle(false)
            .redoActionStyle(.fiori)
            .typeErased
    }
}
