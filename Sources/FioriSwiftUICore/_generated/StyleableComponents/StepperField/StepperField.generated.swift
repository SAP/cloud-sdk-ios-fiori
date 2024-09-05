// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct StepperField {
    let decrementAction: any View
    @Binding var text: String
    let incrementAction: any View
    /// The step value
    let step: Int?
    /// a range of values
    let stepRange: ClosedRange<Int>

    @Environment(\.stepperFieldStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder decrementAction: () -> any View = { FioriButton { _ in FioriIcon.actions.less } },
                text: Binding<String>,
                @ViewBuilder incrementAction: () -> any View = { FioriButton { _ in FioriIcon.actions.add } },
                step: Int? = nil,
                stepRange: ClosedRange<Int>)
    {
        self.decrementAction = DecrementAction(decrementAction: decrementAction)
        self._text = text
        self.incrementAction = IncrementAction(incrementAction: incrementAction)
        self.step = step
        self.stepRange = stepRange
    }
}

public extension StepperField {
    init(decrementAction: FioriButton? = FioriButton { _ in FioriIcon.actions.less },
         text: Binding<String>,
         incrementAction: FioriButton? = FioriButton { _ in FioriIcon.actions.add },
         step: Int? = nil,
         stepRange: ClosedRange<Int>)
    {
        self.init(decrementAction: { decrementAction }, text: text, incrementAction: { incrementAction }, step: step, stepRange: stepRange)
    }
}

public extension StepperField {
    init(_ configuration: StepperFieldConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: StepperFieldConfiguration, shouldApplyDefaultStyle: Bool) {
        self.decrementAction = configuration.decrementAction
        self._text = configuration.$text
        self.incrementAction = configuration.incrementAction
        self.step = configuration.step
        self.stepRange = configuration.stepRange
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension StepperField: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(decrementAction: .init(self.decrementAction), text: self.$text, incrementAction: .init(self.incrementAction), step: self.step, stepRange: self.stepRange)).typeErased
                .transformEnvironment(\.stepperFieldStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension StepperField {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        StepperField(.init(decrementAction: .init(self.decrementAction), text: self.$text, incrementAction: .init(self.incrementAction), step: self.step, stepRange: self.stepRange))
            .shouldApplyDefaultStyle(false)
            .stepperFieldStyle(StepperFieldFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
