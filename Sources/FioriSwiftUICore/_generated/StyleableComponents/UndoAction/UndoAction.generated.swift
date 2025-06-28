// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct UndoAction {
    let undoAction: any View

    @Environment(\.undoActionStyle) var style

    var componentIdentifier: String = UndoAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder undoAction: () -> any View = { FioriButton._undoButton },
                componentIdentifier: String? = UndoAction.identifier)
    {
        self.undoAction = undoAction()
        self.componentIdentifier = componentIdentifier ?? UndoAction.identifier
    }
}

public extension UndoAction {
    static let identifier = "fiori_undoaction_component"
}

public extension UndoAction {
    init(undoAction: FioriButton? = FioriButton._undoButton) {
        self.init(undoAction: { undoAction })
    }
}

public extension UndoAction {
    init(_ configuration: UndoActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: UndoActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.undoAction = configuration.undoAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension UndoAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, undoAction: .init(self.undoAction))).typeErased
                .transformEnvironment(\.undoActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension UndoAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        UndoAction(.init(componentIdentifier: self.componentIdentifier, undoAction: .init(self.undoAction)))
            .shouldApplyDefaultStyle(false)
            .undoActionStyle(.fiori)
            .typeErased
    }
}
