// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol DateRangePickerStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: DateRangePickerConfiguration) -> Body
}

struct AnyDateRangePickerStyle: DateRangePickerStyle {
    let content: (DateRangePickerConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DateRangePickerConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DateRangePickerConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct DateRangePickerConfiguration {
    public var componentIdentifier: String = "fiori_daterangepicker_component"
    public let title: Title
    public let valueLabel: ValueLabel
    public let controlState: ControlState
    public let errorMessage: AttributedString?
    public let range: Range<Date>?
    @Binding public var selectedRange: ClosedRange<Date>?
    public let rangeFormatter: DateFormatter?
    public let noRangeSelectedString: String?
    @Binding public var pickerVisible: Bool

    public typealias Title = ConfigurationViewWrapper
    public typealias ValueLabel = ConfigurationViewWrapper
}

extension DateRangePickerConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct DateRangePickerFioriStyle: DateRangePickerStyle {
    public func makeBody(_ configuration: DateRangePickerConfiguration) -> some View {
        DateRangePicker(configuration)
            .titleStyle(TitleFioriStyle(dateRangePickerConfiguration: configuration))
            .valueLabelStyle(ValueLabelFioriStyle(dateRangePickerConfiguration: configuration))
            .formViewStyle(FormViewFioriStyle(dateRangePickerConfiguration: configuration))
    }
}
