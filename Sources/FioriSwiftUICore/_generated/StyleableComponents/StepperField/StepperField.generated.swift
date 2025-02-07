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
    let step: Double
    /// a range of values
    let stepRange: ClosedRange<Double>
    /// Indicates whether the stepper field  supports decimal values. Default is false.
    let isDecimalSupported: Bool

    @Environment(\.stepperFieldStyle) var style

    var componentIdentifier: String = StepperField.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder decrementAction: () -> any View = { FioriButton { _ in FioriIcon.actions.less } },
                text: Binding<String>,
                @ViewBuilder incrementAction: () -> any View = { FioriButton { _ in FioriIcon.actions.add } },
                step: Double = 1,
                stepRange: ClosedRange<Double>,
                isDecimalSupported: Bool = false,
                componentIdentifier: String? = StepperField.identifier)
    {
        self.decrementAction = DecrementAction(decrementAction: decrementAction, componentIdentifier: componentIdentifier)
        self._text = text
        self.incrementAction = IncrementAction(incrementAction: incrementAction, componentIdentifier: componentIdentifier)
        self.step = step
        self.stepRange = stepRange
        self.isDecimalSupported = isDecimalSupported
        self.componentIdentifier = componentIdentifier ?? StepperField.identifier
    }
}

public extension StepperField {
    static let identifier = "fiori_stepperfield_component"
}

public extension StepperField {
    init(decrementAction: FioriButton? = FioriButton { _ in FioriIcon.actions.less },
         text: Binding<String>,
         incrementAction: FioriButton? = FioriButton { _ in FioriIcon.actions.add },
         step: Double = 1,
         stepRange: ClosedRange<Double>,
         isDecimalSupported: Bool = false)
    {
        self.init(decrementAction: { decrementAction }, text: text, incrementAction: { incrementAction }, step: step, stepRange: stepRange, isDecimalSupported: isDecimalSupported)
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
        self.isDecimalSupported = configuration.isDecimalSupported
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension StepperField: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, decrementAction: .init(self.decrementAction), text: self.$text, incrementAction: .init(self.incrementAction), step: self.step, stepRange: self.stepRange, isDecimalSupported: self.isDecimalSupported)).typeErased
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
        StepperField(.init(componentIdentifier: self.componentIdentifier, decrementAction: .init(self.decrementAction), text: self.$text, incrementAction: .init(self.incrementAction), step: self.step, stepRange: self.stepRange, isDecimalSupported: self.isDecimalSupported))
            .shouldApplyDefaultStyle(false)
            .stepperFieldStyle(StepperFieldFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
