// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct FormView {
    /// The `ControlState` of the form view. The default is `normal`
    let controlState: ControlState
    /// The error message of the form view.
    let errorMessage: AttributedString?

    @Environment(\.formViewStyle) var style

    var componentIdentifier: String = FormView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(controlState: ControlState = .normal,
                errorMessage: AttributedString? = nil,
                componentIdentifier: String? = FormView.identifier)
    {
        self.controlState = controlState
        self.errorMessage = errorMessage
        self.componentIdentifier = componentIdentifier ?? FormView.identifier
    }
}

public extension FormView {
    static let identifier = "fiori_formview_component"
}

public extension FormView {
    init(_ configuration: FormViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: FormViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.controlState = configuration.controlState
        self.errorMessage = configuration.errorMessage
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension FormView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, controlState: self.controlState, errorMessage: self.errorMessage)).typeErased
                .transformEnvironment(\.formViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension FormView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        FormView(.init(componentIdentifier: self.componentIdentifier, controlState: self.controlState, errorMessage: self.errorMessage))
            .shouldApplyDefaultStyle(false)
            .formViewStyle(FormViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
