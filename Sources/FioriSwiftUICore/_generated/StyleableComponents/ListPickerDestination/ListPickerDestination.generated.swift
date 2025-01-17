// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `ListPickerDestination` is a view that provides a customizable list for `ListPickerItem` with selection, search filter and  rows.
///
public struct ListPickerDestination {
    let cancelAction: any View
    let applyAction: any View
    let selectedEntriesSectionTitle: any View
    let selectAllAction: any View
    let deselectAllAction: any View
    let allEntriesSectionTitle: any View
    let listPickerContent: any View

    @Environment(\.listPickerDestinationStyle) var style

    var componentIdentifier: String = ListPickerDestination.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder cancelAction: () -> any View = { FioriButton { _ in Text("Cancel".localizedFioriString()) } },
                @ViewBuilder applyAction: () -> any View = { FioriButton { _ in Text("Apply".localizedFioriString()) } },
                @ViewBuilder selectedEntriesSectionTitle: () -> any View = { Text("Selected".localizedFioriString()) },
                @ViewBuilder selectAllAction: () -> any View = { FioriButton { _ in Text("Select All".localizedFioriString()) } },
                @ViewBuilder deselectAllAction: () -> any View = { FioriButton { _ in Text("Deselect All".localizedFioriString()) } },
                @ViewBuilder allEntriesSectionTitle: () -> any View = { Text("All".localizedFioriString()) },
                @ViewBuilder listPickerContent: () -> any View = { EmptyView() },
                componentIdentifier: String? = ListPickerDestination.identifier)
    {
        self.cancelAction = CancelAction(cancelAction: cancelAction, componentIdentifier: componentIdentifier)
        self.applyAction = ApplyAction(applyAction: applyAction, componentIdentifier: componentIdentifier)
        self.selectedEntriesSectionTitle = SelectedEntriesSectionTitle(selectedEntriesSectionTitle: selectedEntriesSectionTitle, componentIdentifier: componentIdentifier)
        self.selectAllAction = SelectAllAction(selectAllAction: selectAllAction, componentIdentifier: componentIdentifier)
        self.deselectAllAction = DeselectAllAction(deselectAllAction: deselectAllAction, componentIdentifier: componentIdentifier)
        self.allEntriesSectionTitle = AllEntriesSectionTitle(allEntriesSectionTitle: allEntriesSectionTitle, componentIdentifier: componentIdentifier)
        self.listPickerContent = ListPickerContent(listPickerContent: listPickerContent, componentIdentifier: componentIdentifier)
        self.componentIdentifier = componentIdentifier ?? ListPickerDestination.identifier
    }
}

public extension ListPickerDestination {
    static let identifier = "fiori_listpickerdestination_component"
}

public extension ListPickerDestination {
    init(cancelAction: FioriButton? = FioriButton { _ in Text("Cancel".localizedFioriString()) },
         applyAction: FioriButton? = FioriButton { _ in Text("Apply".localizedFioriString()) },
         selectedEntriesSectionTitle: AttributedString? = AttributedString("Selected".localizedFioriString()),
         selectAllAction: FioriButton? = FioriButton { _ in Text("Select All".localizedFioriString()) },
         deselectAllAction: FioriButton? = FioriButton { _ in Text("Deselect All".localizedFioriString()) },
         allEntriesSectionTitle: AttributedString? = AttributedString("All".localizedFioriString()),
         @ViewBuilder listPickerContent: () -> any View = { EmptyView() },
         componentIdentifier: String? = ListPickerDestination.identifier)
    {
        self.init(cancelAction: { cancelAction }, applyAction: { applyAction }, selectedEntriesSectionTitle: { OptionalText(selectedEntriesSectionTitle) }, selectAllAction: { selectAllAction }, deselectAllAction: { deselectAllAction }, allEntriesSectionTitle: { OptionalText(allEntriesSectionTitle) }, listPickerContent: listPickerContent, componentIdentifier: componentIdentifier)
    }
}

public extension ListPickerDestination {
    init(_ configuration: ListPickerDestinationConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ListPickerDestinationConfiguration, shouldApplyDefaultStyle: Bool) {
        self.cancelAction = configuration.cancelAction
        self.applyAction = configuration.applyAction
        self.selectedEntriesSectionTitle = configuration.selectedEntriesSectionTitle
        self.selectAllAction = configuration.selectAllAction
        self.deselectAllAction = configuration.deselectAllAction
        self.allEntriesSectionTitle = configuration.allEntriesSectionTitle
        self.listPickerContent = configuration.listPickerContent
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ListPickerDestination: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, cancelAction: .init(self.cancelAction), applyAction: .init(self.applyAction), selectedEntriesSectionTitle: .init(self.selectedEntriesSectionTitle), selectAllAction: .init(self.selectAllAction), deselectAllAction: .init(self.deselectAllAction), allEntriesSectionTitle: .init(self.allEntriesSectionTitle), listPickerContent: .init(self.listPickerContent))).typeErased
                .transformEnvironment(\.listPickerDestinationStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ListPickerDestination {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ListPickerDestination(.init(componentIdentifier: self.componentIdentifier, cancelAction: .init(self.cancelAction), applyAction: .init(self.applyAction), selectedEntriesSectionTitle: .init(self.selectedEntriesSectionTitle), selectAllAction: .init(self.selectAllAction), deselectAllAction: .init(self.deselectAllAction), allEntriesSectionTitle: .init(self.allEntriesSectionTitle), listPickerContent: .init(self.listPickerContent)))
            .shouldApplyDefaultStyle(false)
            .listPickerDestinationStyle(ListPickerDestinationFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
