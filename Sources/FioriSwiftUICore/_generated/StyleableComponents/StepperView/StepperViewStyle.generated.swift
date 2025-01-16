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
    public var componentIdentifier: String = "fiori_stepperview_component"
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

public extension StepperViewConfiguration {
    var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    var titleIdentifier: String {
        self.componentIdentifier + "_title"
    }

    var decrementActionIdentifier: String {
        self.componentIdentifier + "_decrementAction"
    }

    var textInputFieldIdentifier: String {
        self.componentIdentifier + "_textInputField"
    }

    var incrementActionIdentifier: String {
        self.componentIdentifier + "_incrementAction"
    }

    var iconIdentifier: String {
        self.componentIdentifier + "_icon"
    }

    var descriptionIdentifier: String {
        self.componentIdentifier + "_description"
    }

    var stepperFieldIdentifier: String {
        self.componentIdentifier + "_stepperField"
    }

    var informationViewIdentifier: String {
        self.componentIdentifier + "_informationView"
    }
}

extension StepperViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
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
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

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
