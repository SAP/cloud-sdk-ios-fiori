// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
