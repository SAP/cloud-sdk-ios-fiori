// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol StepperViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: StepperViewConfiguration) -> Body
}

struct AnyStepperViewStyle: StepperViewStyle {
    let content: (StepperViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (StepperViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct StepperViewConfiguration {
    public let contentIdentifier = "FioriStepperView_content"
    public let titleIdentifier = "FioriStepperView_title"
    public let decrementActionIdentifier = "FioriStepperView_decrementAction"
    public let textInputFieldIdentifier = "FioriStepperView_textInputField"
    public let incrementActionIdentifier = "FioriStepperView_incrementAction"
    public let iconIdentifier = "FioriStepperView_icon"
    public let descriptionIdentifier = "FioriStepperView_description"
    public let stepperFieldIdentifier = "FioriStepperView_stepperField"
    public let informationViewIdentifier = "FioriStepperView_informationView"

    public let title: Title
    public let decrementAction: DecrementAction
    @Binding public var text: String
    public let incrementAction: IncrementAction
    public let step: Double
    public let stepRange: ClosedRange<Double>
    public let isDecimalSupported: Bool
    public let icon: Icon
    public let description: Description

    public typealias Title = ConfigurationViewWrapper
    public typealias DecrementAction = ConfigurationViewWrapper
    public typealias IncrementAction = ConfigurationViewWrapper
    public typealias Icon = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
}

public struct StepperViewFioriStyle: StepperViewStyle {
    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .titleStyle(TitleFioriStyle(stepperViewConfiguration: configuration))
            .decrementActionStyle(DecrementActionFioriStyle(stepperViewConfiguration: configuration))
            .textInputFieldStyle(TextInputFieldFioriStyle(stepperViewConfiguration: configuration))
            .incrementActionStyle(IncrementActionFioriStyle(stepperViewConfiguration: configuration))
            .iconStyle(IconFioriStyle(stepperViewConfiguration: configuration))
            .descriptionStyle(DescriptionFioriStyle(stepperViewConfiguration: configuration))
            .stepperFieldStyle(StepperFieldFioriStyle(stepperViewConfiguration: configuration))
            .informationViewStyle(InformationViewFioriStyle(stepperViewConfiguration: configuration))
    }
}

public struct StepperViewNSSStyle: StepperViewStyle {
    var data: NSSStyleData

    public func makeBody(_ configuration: StepperViewConfiguration) -> some View {
        StepperView(configuration)
            .titleStyle(TitleNSSStyle(stepperViewConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .decrementActionStyle(DecrementActionNSSStyle(stepperViewConfiguration: configuration, nssData: self.data.value(configuration.decrementActionIdentifier)))
            .textInputFieldStyle(TextInputFieldNSSStyle(stepperViewConfiguration: configuration, nssData: self.data.value(configuration.textInputFieldIdentifier)))
            .incrementActionStyle(IncrementActionNSSStyle(stepperViewConfiguration: configuration, nssData: self.data.value(configuration.incrementActionIdentifier)))
            .iconStyle(IconNSSStyle(stepperViewConfiguration: configuration, nssData: self.data.value(configuration.iconIdentifier)))
            .descriptionStyle(DescriptionNSSStyle(stepperViewConfiguration: configuration, nssData: self.data.value(configuration.descriptionIdentifier)))
            .stepperFieldStyle(StepperFieldNSSStyle(stepperViewConfiguration: configuration, nssData: self.data.value(configuration.stepperFieldIdentifier)))
            .informationViewStyle(InformationViewNSSStyle(stepperViewConfiguration: configuration, nssData: self.data.value(configuration.informationViewIdentifier)))
            .stepperViewStyle(ContentNSSStyle(stepperViewConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
