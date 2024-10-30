// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct StepperView {
    let title: any View
    let decrementAction: any View
    @Binding var text: String
    let incrementAction: any View
    /// The step value
    let step: Double
    /// a range of values
    let stepRange: ClosedRange<Double>
    /// Indicates whether the stepper field  supports decimal values. Default is false.
    let isDecimalSupported: Bool
    let icon: any View
    let description: any View

    @Environment(\.stepperViewStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder decrementAction: () -> any View = { FioriButton { _ in FioriIcon.actions.less } },
                text: Binding<String>,
                @ViewBuilder incrementAction: () -> any View = { FioriButton { _ in FioriIcon.actions.add } },
                step: Double = 1,
                stepRange: ClosedRange<Double>,
                isDecimalSupported: Bool = false,
                @ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() })
    {
        self.title = Title { title() }
        self.decrementAction = DecrementAction { decrementAction() }
        self._text = text
        self.incrementAction = IncrementAction { incrementAction() }
        self.step = step
        self.stepRange = stepRange
        self.isDecimalSupported = isDecimalSupported
        self.icon = Icon(icon: icon)
        self.description = Description(description: description)
    }
}

public extension StepperView {
    init(title: AttributedString,
         decrementAction: FioriButton? = FioriButton { _ in FioriIcon.actions.less },
         text: Binding<String>,
         incrementAction: FioriButton? = FioriButton { _ in FioriIcon.actions.add },
         step: Double = 1,
         stepRange: ClosedRange<Double>,
         isDecimalSupported: Bool = false,
         icon: Image? = nil,
         description: AttributedString? = nil)
    {
        self.init(title: { Text(title) }, decrementAction: { decrementAction }, text: text, incrementAction: { incrementAction }, step: step, stepRange: stepRange, isDecimalSupported: isDecimalSupported, icon: { icon }, description: { OptionalText(description) })
    }
}

public extension StepperView {
    init(_ configuration: StepperViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: StepperViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.decrementAction = configuration.decrementAction
        self._text = configuration.$text
        self.incrementAction = configuration.incrementAction
        self.step = configuration.step
        self.stepRange = configuration.stepRange
        self.isDecimalSupported = configuration.isDecimalSupported
        self.icon = configuration.icon
        self.description = configuration.description
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension StepperView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(title: .init(self.title), decrementAction: .init(self.decrementAction), text: self.$text, incrementAction: .init(self.incrementAction), step: self.step, stepRange: self.stepRange, isDecimalSupported: self.isDecimalSupported, icon: .init(self.icon), description: .init(self.description))).typeErased
                .transformEnvironment(\.stepperViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension StepperView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        StepperView(.init(title: .init(self.title), decrementAction: .init(self.decrementAction), text: self.$text, incrementAction: .init(self.incrementAction), step: self.step, stepRange: self.stepRange, isDecimalSupported: self.isDecimalSupported, icon: .init(self.icon), description: .init(self.description)))
            .shouldApplyDefaultStyle(false)
            .stepperViewStyle(StepperViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
