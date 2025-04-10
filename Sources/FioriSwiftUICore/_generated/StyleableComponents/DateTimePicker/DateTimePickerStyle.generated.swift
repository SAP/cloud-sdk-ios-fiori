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
    public var componentIdentifier: String = "fiori_datetimepicker_component"
    public let title: Title
    public let valueLabel: ValueLabel
    public let controlState: ControlState
    public let errorMessage: AttributedString?
    @Binding public var selectedDate: Date
    public let pickerComponents: DatePicker.Components
    public let dateStyle: Date.FormatStyle.DateStyle
    public let timeStyle: Date.FormatStyle.TimeStyle
    public let noDateSelectedString: String?

    public typealias Title = ConfigurationViewWrapper
    public typealias ValueLabel = ConfigurationViewWrapper
}

extension DateTimePickerConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct DateTimePickerFioriStyle: DateTimePickerStyle {
    public func makeBody(_ configuration: DateTimePickerConfiguration) -> some View {
        DateTimePicker(configuration)
            .titleStyle(TitleFioriStyle(dateTimePickerConfiguration: configuration))
            .valueLabelStyle(ValueLabelFioriStyle(dateTimePickerConfiguration: configuration))
            .formViewStyle(FormViewFioriStyle(dateTimePickerConfiguration: configuration))
    }
}
