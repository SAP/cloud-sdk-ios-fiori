// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol ValuePickerStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ValuePickerConfiguration) -> Body
}

struct AnyValuePickerStyle: ValuePickerStyle {
    let content: (ValuePickerConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ValuePickerConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ValuePickerConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ValuePickerConfiguration {
    public var componentIdentifier: String = "fiori_valuepicker_component"
    public let title: Title
    public let valueLabel: ValueLabel
    public let mandatoryFieldIndicator: MandatoryFieldIndicator
    public let isRequired: Bool
    public let options: [AttributedString]
    @Binding public var selectedIndex: Int
    public let isTrackingLiveChanges: Bool
    public let alwaysShowPicker: Bool
    public let controlState: ControlState

    public typealias Title = ConfigurationViewWrapper
    public typealias ValueLabel = ConfigurationViewWrapper
    public typealias MandatoryFieldIndicator = ConfigurationViewWrapper
}

extension ValuePickerConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct ValuePickerFioriStyle: ValuePickerStyle {
    public func makeBody(_ configuration: ValuePickerConfiguration) -> some View {
        ValuePicker(configuration)
            .titleStyle(TitleFioriStyle(valuePickerConfiguration: configuration))
            .valueLabelStyle(ValueLabelFioriStyle(valuePickerConfiguration: configuration))
            .mandatoryFieldIndicatorStyle(MandatoryFieldIndicatorFioriStyle(valuePickerConfiguration: configuration))
            .optionsStyle(OptionsFioriStyle(valuePickerConfiguration: configuration))
    }
}
