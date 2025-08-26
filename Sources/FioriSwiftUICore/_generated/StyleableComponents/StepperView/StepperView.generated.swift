// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct StepperView {
    let title: any View
    let decrementAction: any View
    @Binding var text: String
    var isSecureEnabled: Bool?
    var formatter: GenericTextFormatter?
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

    var componentIdentifier: String = StepperView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder decrementAction: () -> any View = { FioriButton { _ in FioriIcon.actions.less } },
                text: Binding<String>,
                isSecureEnabled: Bool? = false,
                formatter: GenericTextFormatter? = nil,
                @ViewBuilder incrementAction: () -> any View = { FioriButton { _ in FioriIcon.actions.add } },
                step: Double = 1,
                stepRange: ClosedRange<Double>,
                isDecimalSupported: Bool = false,
                @ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder description: () -> any View = { EmptyView() },
                componentIdentifier: String? = StepperView.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.decrementAction = DecrementAction(decrementAction: decrementAction, componentIdentifier: componentIdentifier)
        self._text = text
        self.isSecureEnabled = isSecureEnabled
        self.formatter = formatter
        self.incrementAction = IncrementAction(incrementAction: incrementAction, componentIdentifier: componentIdentifier)
        self.step = step
        self.stepRange = stepRange
        self.isDecimalSupported = isDecimalSupported
        self.icon = Icon(icon: icon, componentIdentifier: componentIdentifier)
        self.description = Description(description: description, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? StepperView.identifier
    }
}

public extension StepperView {
    static let identifier = "fiori_stepperview_component"
}

public extension StepperView {
    init(title: AttributedString,
         decrementAction: FioriButton? = FioriButton { _ in FioriIcon.actions.less },
         text: Binding<String>,
         isSecureEnabled: Bool? = false,
         formatter: GenericTextFormatter? = nil,
         incrementAction: FioriButton? = FioriButton { _ in FioriIcon.actions.add },
         step: Double = 1,
         stepRange: ClosedRange<Double>,
         isDecimalSupported: Bool = false,
         icon: Image? = nil,
         description: AttributedString? = nil)
    {
        self.init(title: { Text(title) }, decrementAction: { decrementAction }, text: text, isSecureEnabled: isSecureEnabled, formatter: formatter, incrementAction: { incrementAction }, step: step, stepRange: stepRange, isDecimalSupported: isDecimalSupported, icon: { icon }, description: { OptionalText(description) })
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
        self.isSecureEnabled = configuration.isSecureEnabled
        self.formatter = configuration.formatter
        self.incrementAction = configuration.incrementAction
        self.step = configuration.step
        self.stepRange = configuration.stepRange
        self.isDecimalSupported = configuration.isDecimalSupported
        self.icon = configuration.icon
        self.description = configuration.description
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension StepperView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), decrementAction: .init(self.decrementAction), text: self.$text, isSecureEnabled: self.isSecureEnabled, formatter: self.formatter, incrementAction: .init(self.incrementAction), step: self.step, stepRange: self.stepRange, isDecimalSupported: self.isDecimalSupported, icon: .init(self.icon), description: .init(self.description))).typeErased
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
        StepperView(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), decrementAction: .init(self.decrementAction), text: self.$text, isSecureEnabled: self.isSecureEnabled, formatter: self.formatter, incrementAction: .init(self.incrementAction), step: self.step, stepRange: self.stepRange, isDecimalSupported: self.isDecimalSupported, icon: .init(self.icon), description: .init(self.description)))
            .shouldApplyDefaultStyle(false)
            .stepperViewStyle(StepperViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
