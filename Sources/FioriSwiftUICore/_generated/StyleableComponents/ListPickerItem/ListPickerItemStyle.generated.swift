// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol ListPickerItemStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ListPickerItemConfiguration) -> Body
}

struct AnyListPickerItemStyle: ListPickerItemStyle {
    let content: (ListPickerItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ListPickerItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ListPickerItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ListPickerItemConfiguration {
    public let contentIdentifier = "FioriListPickerItem_content"
    public let titleIdentifier = "FioriListPickerItem_title"
    public let valueIdentifier = "FioriListPickerItem_value"
    public let mandatoryFieldIndicatorIdentifier = "FioriListPickerItem_mandatoryFieldIndicator"
    public let formViewIdentifier = "FioriListPickerItem_formView"

    public let title: Title
    public let value: Value
    public let mandatoryFieldIndicator: MandatoryFieldIndicator
    public let isRequired: Bool
    public let controlState: ControlState
    public let errorMessage: AttributedString?
    public let axis: Axis
    public let destination: Destination

    public typealias Title = ConfigurationViewWrapper
    public typealias Value = ConfigurationViewWrapper
    public typealias MandatoryFieldIndicator = ConfigurationViewWrapper
    public typealias Destination = ConfigurationViewWrapper
}

public struct ListPickerItemFioriStyle: ListPickerItemStyle {
    public func makeBody(_ configuration: ListPickerItemConfiguration) -> some View {
        ListPickerItem(configuration)
            .titleStyle(TitleFioriStyle(listPickerItemConfiguration: configuration))
            .valueStyle(ValueFioriStyle(listPickerItemConfiguration: configuration))
            .mandatoryFieldIndicatorStyle(MandatoryFieldIndicatorFioriStyle(listPickerItemConfiguration: configuration))
            .formViewStyle(FormViewFioriStyle(listPickerItemConfiguration: configuration))
    }
}

public struct ListPickerItemNSSStyle: ListPickerItemStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: ListPickerItemConfiguration) -> some View {
        ListPickerItem(configuration)
            .titleStyle(TitleNSSStyle(listPickerItemConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .valueStyle(ValueNSSStyle(listPickerItemConfiguration: configuration, nssData: self.data.value(configuration.valueIdentifier)))
            .mandatoryFieldIndicatorStyle(MandatoryFieldIndicatorNSSStyle(listPickerItemConfiguration: configuration, nssData: self.data.value(configuration.mandatoryFieldIndicatorIdentifier)))
            .formViewStyle(FormViewNSSStyle(listPickerItemConfiguration: configuration, nssData: self.data.value(configuration.formViewIdentifier)))
            .listPickerItemStyle(ContentNSSStyle(listPickerItemConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
