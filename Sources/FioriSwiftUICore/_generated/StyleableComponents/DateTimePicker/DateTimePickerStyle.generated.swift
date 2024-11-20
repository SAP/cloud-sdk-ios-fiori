// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol DateTimePickerStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: DateTimePickerConfiguration) -> Body
}

struct AnyDateTimePickerStyle: DateTimePickerStyle {
    let content: (DateTimePickerConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DateTimePickerConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct DateTimePickerConfiguration {
    public let title: Title
    public let valueLabel: ValueLabel
    public let mandatoryFieldIndicator: MandatoryFieldIndicator
    public let isRequired: Bool
    public let controlState: ControlState
    public let errorMessage: AttributedString?
    @Binding public var selectedDate: Date
    public let pickerComponents: DatePicker.Components
    public let dateStyle: Date.FormatStyle.DateStyle
    public let timeStyle: Date.FormatStyle.TimeStyle
    public let noDateSelectedString: String?

    public typealias Title = ConfigurationViewWrapper
    public typealias ValueLabel = ConfigurationViewWrapper
    public typealias MandatoryFieldIndicator = ConfigurationViewWrapper
}

public struct DateTimePickerFioriStyle: DateTimePickerStyle {
    public func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
        DateTimePicker(configuration)
            .titleStyle(TitleFioriStyle(dateTimePickerConfiguration: configuration))
            .valueLabelStyle(ValueLabelFioriStyle(dateTimePickerConfiguration: configuration))
            .mandatoryFieldIndicatorStyle(MandatoryFieldIndicatorFioriStyle(dateTimePickerConfiguration: configuration))
            .formViewStyle(FormViewFioriStyle(dateTimePickerConfiguration: configuration))
    }
}
