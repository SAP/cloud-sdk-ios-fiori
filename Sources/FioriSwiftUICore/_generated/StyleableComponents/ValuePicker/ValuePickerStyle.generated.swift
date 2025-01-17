// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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

public extension ValuePickerConfiguration {
    var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    var titleIdentifier: String {
        self.componentIdentifier + "_title"
    }

    var valueLabelIdentifier: String {
        self.componentIdentifier + "_valueLabel"
    }

    var mandatoryFieldIndicatorIdentifier: String {
        self.componentIdentifier + "_mandatoryFieldIndicator"
    }

    var optionsIdentifier: String {
        self.componentIdentifier + "_options"
    }
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

public struct ValuePickerNSSStyle: ValuePickerStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: ValuePickerConfiguration) -> some View {
        ValuePicker(configuration)
            .titleStyle(TitleNSSStyle(valuePickerConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .valueLabelStyle(ValueLabelNSSStyle(valuePickerConfiguration: configuration, nssData: self.data.value(configuration.valueLabelIdentifier)))
            .mandatoryFieldIndicatorStyle(MandatoryFieldIndicatorNSSStyle(valuePickerConfiguration: configuration, nssData: self.data.value(configuration.mandatoryFieldIndicatorIdentifier)))
            .optionsStyle(OptionsNSSStyle(valuePickerConfiguration: configuration, nssData: self.data.value(configuration.optionsIdentifier)))
            .valuePickerStyle(ContentNSSStyle(valuePickerConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
