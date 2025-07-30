// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct SubmitAction {
    let submitAction: any View

    @Environment(\.submitActionStyle) var style

    var componentIdentifier: String = SubmitAction.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder submitAction: () -> any View = { EmptyView() },
                componentIdentifier: String? = SubmitAction.identifier)
    {
        self.submitAction = submitAction()
        self.componentIdentifier = componentIdentifier ?? SubmitAction.identifier
    }
}

public extension SubmitAction {
    static let identifier = "fiori_submitaction_component"
}

public extension SubmitAction {
    init(submitAction: FioriButton? = nil) {
        self.init(submitAction: { submitAction })
    }
}

public extension SubmitAction {
    init(_ configuration: SubmitActionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SubmitActionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.submitAction = configuration.submitAction
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension SubmitAction: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, submitAction: .init(self.submitAction))).typeErased
                .transformEnvironment(\.submitActionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SubmitAction {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SubmitAction(.init(componentIdentifier: self.componentIdentifier, submitAction: .init(self.submitAction)))
            .shouldApplyDefaultStyle(false)
            .submitActionStyle(.fiori)
            .typeErased
    }
}
