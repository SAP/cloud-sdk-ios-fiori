// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct SecondaryAction {
    let secondaryAction: any View

    @Environment(\.secondaryActionStyle) var style

    var componentIdentifier: String = SecondaryAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder secondaryAction: () -> any View = { EmptyView() },
                componentIdentifier: String? = SecondaryAction.identifier)
    {
        self.secondaryAction = secondaryAction()
        self.componentIdentifier = componentIdentifier ?? SecondaryAction.identifier
    }
}

public extension SecondaryAction {
    static let identifier = "fiori_secondaryaction_component"
}

public extension SecondaryAction {
    init(secondaryAction: FioriButton? = nil,
         componentIdentifier: String? = SecondaryAction.identifier)
    {
        self.init(secondaryAction: { secondaryAction }, componentIdentifier: componentIdentifier)
    }
}

public extension SecondaryAction {
    init(_ configuration: SecondaryActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SecondaryActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.secondaryAction = configuration.secondaryAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension SecondaryAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, secondaryAction: .init(self.secondaryAction))).typeErased
                .transformEnvironment(\.secondaryActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SecondaryAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SecondaryAction(.init(componentIdentifier: self.componentIdentifier, secondaryAction: .init(self.secondaryAction)))
            .shouldApplyDefaultStyle(false)
            .secondaryActionStyle(.fiori)
            .typeErased
    }
}
