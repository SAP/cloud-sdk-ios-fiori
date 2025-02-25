// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct ClearAction {
    let clearAction: any View

    @Environment(\.clearActionStyle) var style

    var componentIdentifier: String = ClearAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder clearAction: () -> any View = { FioriButton { _ in Text("Clear".localizedFioriString()) } },
                componentIdentifier: String? = ClearAction.identifier)
    {
        self.clearAction = clearAction()
        self.componentIdentifier = componentIdentifier ?? ClearAction.identifier
    }
}

public extension ClearAction {
    static let identifier = "fiori_clearaction_component"
}

public extension ClearAction {
    init(clearAction: FioriButton? = FioriButton { _ in Text("Clear".localizedFioriString()) }) {
        self.init(clearAction: { clearAction })
    }
}

public extension ClearAction {
    init(_ configuration: ClearActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ClearActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.clearAction = configuration.clearAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ClearAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, clearAction: .init(self.clearAction))).typeErased
                .transformEnvironment(\.clearActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ClearAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ClearAction(.init(componentIdentifier: self.componentIdentifier, clearAction: .init(self.clearAction)))
            .shouldApplyDefaultStyle(false)
            .clearActionStyle(.fiori)
            .typeErased
    }
}
