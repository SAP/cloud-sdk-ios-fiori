// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct ResetAction {
    let resetAction: any View

    @Environment(\.resetActionStyle) var style

    var componentIdentifier: String = ResetAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder resetAction: () -> any View = { FioriButton { _ in Text("Reset".localizedFioriString()) } },
                componentIdentifier: String? = ResetAction.identifier)
    {
        self.resetAction = resetAction()
        self.componentIdentifier = componentIdentifier ?? ResetAction.identifier
    }
}

public extension ResetAction {
    static let identifier = "fiori_resetaction_component"
}

public extension ResetAction {
    init(resetAction: FioriButton? = FioriButton { _ in Text("Reset".localizedFioriString()) }) {
        self.init(resetAction: { resetAction })
    }
}

public extension ResetAction {
    init(_ configuration: ResetActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ResetActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.resetAction = configuration.resetAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ResetAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, resetAction: .init(self.resetAction))).typeErased
                .transformEnvironment(\.resetActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ResetAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ResetAction(.init(componentIdentifier: self.componentIdentifier, resetAction: .init(self.resetAction)))
            .shouldApplyDefaultStyle(false)
            .resetActionStyle(.fiori)
            .typeErased
    }
}
