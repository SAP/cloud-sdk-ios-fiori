// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct FormView {
    let controlState: ControlState?
    let errorMessage: AttributedString?

    @Environment(\.formViewStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(controlState: ControlState? = nil,
                errorMessage: AttributedString? = nil)
    {
        self.controlState = controlState
        self.errorMessage = errorMessage
    }
}

public extension FormView {
    init(_ configuration: FormViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: FormViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.controlState = configuration.controlState
        self.errorMessage = configuration.errorMessage
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension FormView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(controlState: self.controlState, errorMessage: self.errorMessage)).typeErased
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
        FormView(.init(controlState: self.controlState, errorMessage: self.errorMessage))
            .shouldApplyDefaultStyle(false)
            .formViewStyle(FormViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
