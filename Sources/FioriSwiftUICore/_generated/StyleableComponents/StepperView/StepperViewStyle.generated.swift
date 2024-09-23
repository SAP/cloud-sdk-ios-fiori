// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
    public let title: Title
    public let decrementAction: DecrementAction
    @Binding public var text: String
    public let incrementAction: IncrementAction
    public let step: Int
    public let stepRange: ClosedRange<Int>
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
