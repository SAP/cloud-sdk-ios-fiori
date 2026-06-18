// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol StepperFieldStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: StepperFieldConfiguration) -> Body
}

struct AnyStepperFieldStyle: StepperFieldStyle {
    let content: (StepperFieldConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (StepperFieldConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: StepperFieldConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct StepperFieldConfiguration {
    public var componentIdentifier: String = "fiori_stepperfield_component"
    public let decrementAction: DecrementAction
    @Binding public var text: String
    public let isSecureEnabled: Bool?
    public let formatter: FormattedStringEditing?
    public let incrementAction: IncrementAction
    public let step: Double
    public let stepRange: ClosedRange<Double>
    public let isDecimalSupported: Bool

    public typealias DecrementAction = ConfigurationViewWrapper
    public typealias IncrementAction = ConfigurationViewWrapper
}

extension StepperFieldConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct StepperFieldFioriStyle: StepperFieldStyle {
    public func makeBody(_ configuration: StepperFieldConfiguration) -> some View {
        StepperField(configuration)
            .decrementActionStyle(DecrementActionFioriStyle(stepperFieldConfiguration: configuration))
            .incrementActionStyle(IncrementActionFioriStyle(stepperFieldConfiguration: configuration))
            .textInputFieldStyle(TextInputFieldFioriStyle(stepperFieldConfiguration: configuration))
    }
}

struct StepperFieldDefaultStyle: StepperFieldStyle {
    nonisolated init() {}

    func makeBody(_ configuration: StepperFieldConfiguration) -> some View {
        StepperField(configuration)
            .stepperFieldStyle(StepperFieldFioriStyle())
            .modifier(StepperFieldStyleModifier(style: StepperFieldBaseStyle()))
    }
}
