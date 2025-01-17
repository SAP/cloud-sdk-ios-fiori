// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct CloseAction {
    let closeAction: any View

    @Environment(\.closeActionStyle) var style

    var componentIdentifier: String = CloseAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder closeAction: () -> any View = { FioriButton { _ in Image(systemName: "xmark") } },
                componentIdentifier: String? = CloseAction.identifier)
    {
        self.closeAction = closeAction()
        self.componentIdentifier = componentIdentifier ?? CloseAction.identifier
    }
}

public extension CloseAction {
    static let identifier = "fiori_closeaction_component"
}

public extension CloseAction {
    init(closeAction: FioriButton? = FioriButton { _ in Image(systemName: "xmark") },
         componentIdentifier: String? = CloseAction.identifier)
    {
        self.init(closeAction: { closeAction }, componentIdentifier: componentIdentifier)
    }
}

public extension CloseAction {
    init(_ configuration: CloseActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: CloseActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.closeAction = configuration.closeAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension CloseAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, closeAction: .init(self.closeAction))).typeErased
                .transformEnvironment(\.closeActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension CloseAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        CloseAction(.init(componentIdentifier: self.componentIdentifier, closeAction: .init(self.closeAction)))
            .shouldApplyDefaultStyle(false)
            .closeActionStyle(.fiori)
            .typeErased
    }
}
