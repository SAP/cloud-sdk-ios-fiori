// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol StepperFieldStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: StepperFieldConfiguration) -> Body
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
    public let contentIdentifier = "FioriStepperField_content"
    public let decrementActionIdentifier = "FioriStepperField_decrementAction"
    public let textInputFieldIdentifier = "FioriStepperField_textInputField"
    public let incrementActionIdentifier = "FioriStepperField_incrementAction"

    public var componentIdentifier: String = "fiori_stepperfield_component"
    public let decrementAction: DecrementAction
    @Binding public var text: String
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
            .textInputFieldStyle(TextInputFieldFioriStyle(stepperFieldConfiguration: configuration))
            .incrementActionStyle(IncrementActionFioriStyle(stepperFieldConfiguration: configuration))
    }
}

public struct StepperFieldNSSStyle: StepperFieldStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: StepperFieldConfiguration) -> some View {
        StepperField(configuration)
            .decrementActionStyle(DecrementActionNSSStyle(stepperFieldConfiguration: configuration, nssData: self.data.value(configuration.decrementActionIdentifier)))
            .textInputFieldStyle(TextInputFieldNSSStyle(stepperFieldConfiguration: configuration, nssData: self.data.value(configuration.textInputFieldIdentifier)))
            .incrementActionStyle(IncrementActionNSSStyle(stepperFieldConfiguration: configuration, nssData: self.data.value(configuration.incrementActionIdentifier)))
            .stepperFieldStyle(ContentNSSStyle(stepperFieldConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
