// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct DeselectAllAction {
    let deselectAllAction: any View

    @Environment(\.deselectAllActionStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder deselectAllAction: () -> any View = { FioriButton { _ in Text("Deselect All".localizedFioriString()) } }) {
        self.deselectAllAction = deselectAllAction()
    }
}

public extension DeselectAllAction {
    init(deselectAllAction: FioriButton? = FioriButton { _ in Text("Deselect All".localizedFioriString()) }) {
        self.init(deselectAllAction: { deselectAllAction })
    }
}

public extension DeselectAllAction {
    init(_ configuration: DeselectAllActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: DeselectAllActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.deselectAllAction = configuration.deselectAllAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension DeselectAllAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(deselectAllAction: .init(self.deselectAllAction))).typeErased
                .transformEnvironment(\.deselectAllActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension DeselectAllAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        DeselectAllAction(.init(deselectAllAction: .init(self.deselectAllAction)))
            .shouldApplyDefaultStyle(false)
            .deselectAllActionStyle(.fiori)
            .typeErased
    }
}
