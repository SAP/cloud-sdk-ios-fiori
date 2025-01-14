// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol ListPickerDestinationStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ListPickerDestinationConfiguration) -> Body
}

struct AnyListPickerDestinationStyle: ListPickerDestinationStyle {
    let content: (ListPickerDestinationConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ListPickerDestinationConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ListPickerDestinationConfiguration {
    public let contentIdentifier = "FioriListPickerDestination_content"
    public let cancelActionIdentifier = "FioriListPickerDestination_cancelAction"
    public let applyActionIdentifier = "FioriListPickerDestination_applyAction"
    public let selectedEntriesSectionTitleIdentifier = "FioriListPickerDestination_selectedEntriesSectionTitle"
    public let selectAllActionIdentifier = "FioriListPickerDestination_selectAllAction"
    public let deselectAllActionIdentifier = "FioriListPickerDestination_deselectAllAction"
    public let allEntriesSectionTitleIdentifier = "FioriListPickerDestination_allEntriesSectionTitle"
    public let listPickerContentIdentifier = "FioriListPickerDestination_listPickerContent"

    public var componentIdentifier: String = "fiori_listpickerdestination_component"
    public let cancelAction: CancelAction
    public let applyAction: ApplyAction
    public let selectedEntriesSectionTitle: SelectedEntriesSectionTitle
    public let selectAllAction: SelectAllAction
    public let deselectAllAction: DeselectAllAction
    public let allEntriesSectionTitle: AllEntriesSectionTitle
    public let listPickerContent: ListPickerContent

    public typealias CancelAction = ConfigurationViewWrapper
    public typealias ApplyAction = ConfigurationViewWrapper
    public typealias SelectedEntriesSectionTitle = ConfigurationViewWrapper
    public typealias SelectAllAction = ConfigurationViewWrapper
    public typealias DeselectAllAction = ConfigurationViewWrapper
    public typealias AllEntriesSectionTitle = ConfigurationViewWrapper
    public typealias ListPickerContent = ConfigurationViewWrapper
}

extension ListPickerDestinationConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct ListPickerDestinationFioriStyle: ListPickerDestinationStyle {
    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        ListPickerDestination(configuration)
            .cancelActionStyle(CancelActionFioriStyle(listPickerDestinationConfiguration: configuration))
            .applyActionStyle(ApplyActionFioriStyle(listPickerDestinationConfiguration: configuration))
            .selectedEntriesSectionTitleStyle(SelectedEntriesSectionTitleFioriStyle(listPickerDestinationConfiguration: configuration))
            .selectAllActionStyle(SelectAllActionFioriStyle(listPickerDestinationConfiguration: configuration))
            .deselectAllActionStyle(DeselectAllActionFioriStyle(listPickerDestinationConfiguration: configuration))
            .allEntriesSectionTitleStyle(AllEntriesSectionTitleFioriStyle(listPickerDestinationConfiguration: configuration))
            .listPickerContentStyle(ListPickerContentFioriStyle(listPickerDestinationConfiguration: configuration))
    }
}

public struct ListPickerDestinationNSSStyle: ListPickerDestinationStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: ListPickerDestinationConfiguration) -> some View {
        ListPickerDestination(configuration)
            .cancelActionStyle(CancelActionNSSStyle(listPickerDestinationConfiguration: configuration, nssData: self.data.value(configuration.cancelActionIdentifier)))
            .applyActionStyle(ApplyActionNSSStyle(listPickerDestinationConfiguration: configuration, nssData: self.data.value(configuration.applyActionIdentifier)))
            .selectedEntriesSectionTitleStyle(SelectedEntriesSectionTitleNSSStyle(listPickerDestinationConfiguration: configuration, nssData: self.data.value(configuration.selectedEntriesSectionTitleIdentifier)))
            .selectAllActionStyle(SelectAllActionNSSStyle(listPickerDestinationConfiguration: configuration, nssData: self.data.value(configuration.selectAllActionIdentifier)))
            .deselectAllActionStyle(DeselectAllActionNSSStyle(listPickerDestinationConfiguration: configuration, nssData: self.data.value(configuration.deselectAllActionIdentifier)))
            .allEntriesSectionTitleStyle(AllEntriesSectionTitleNSSStyle(listPickerDestinationConfiguration: configuration, nssData: self.data.value(configuration.allEntriesSectionTitleIdentifier)))
            .listPickerContentStyle(ListPickerContentNSSStyle(listPickerDestinationConfiguration: configuration, nssData: self.data.value(configuration.listPickerContentIdentifier)))
            .listPickerDestinationStyle(ContentNSSStyle(listPickerDestinationConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
