// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct DoneAction {
    let doneAction: any View

    @Environment(\.doneActionStyle) var style

    var componentIdentifier: String = DoneAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder doneAction: () -> any View = { FioriButton { _ in Text("Done".localizedFioriString()) } },
                componentIdentifier: String? = DoneAction.identifier)
    {
        self.doneAction = doneAction()
        self.componentIdentifier = componentIdentifier ?? DoneAction.identifier
    }
}

public extension DoneAction {
    static let identifier = "fiori_doneaction_component"
}

public extension DoneAction {
    init(doneAction: FioriButton? = FioriButton { _ in Text("Done".localizedFioriString()) }) {
        self.init(doneAction: { doneAction })
    }
}

public extension DoneAction {
    init(_ configuration: DoneActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: DoneActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.doneAction = configuration.doneAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension DoneAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, doneAction: .init(self.doneAction))).typeErased
                .transformEnvironment(\.doneActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension DoneAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        DoneAction(.init(componentIdentifier: self.componentIdentifier, doneAction: .init(self.doneAction)))
            .shouldApplyDefaultStyle(false)
            .doneActionStyle(.fiori)
            .typeErased
    }
}
