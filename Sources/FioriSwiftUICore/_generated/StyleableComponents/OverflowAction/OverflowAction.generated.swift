// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct OverflowAction {
    let overflowAction: any View

    @Environment(\.overflowActionStyle) var style

    var componentIdentifier: String = OverflowAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder overflowAction: () -> any View = { FioriButton { _ in Image(systemName: "ellipsis") } },
                componentIdentifier: String? = OverflowAction.identifier)
    {
        self.overflowAction = overflowAction()
        self.componentIdentifier = componentIdentifier ?? OverflowAction.identifier
    }
}

public extension OverflowAction {
    static let identifier = "fiori_overflowaction_component"
}

public extension OverflowAction {
    init(overflowAction: FioriButton? = FioriButton { _ in Image(systemName: "ellipsis") },
         componentIdentifier: String? = OverflowAction.identifier)
    {
        self.init(overflowAction: { overflowAction }, componentIdentifier: componentIdentifier)
    }
}

public extension OverflowAction {
    init(_ configuration: OverflowActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: OverflowActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.overflowAction = configuration.overflowAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension OverflowAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, overflowAction: .init(self.overflowAction))).typeErased
                .transformEnvironment(\.overflowActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension OverflowAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        OverflowAction(.init(componentIdentifier: self.componentIdentifier, overflowAction: .init(self.overflowAction)))
            .shouldApplyDefaultStyle(false)
            .overflowActionStyle(.fiori)
            .typeErased
    }
}
