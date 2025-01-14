// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `ListPickerItem` is a view that provides a `NavigationLink` with a title and selected value(s). And `ListPickerDestination` is recommended to be used as its destination, for which selection, search filter and customized rows are supported.
/// ## Usage
/// ```swift
/// let data = ["first", "second", "third"]
/// var body: some View {
///     ListPickerItem(title: {
///         Text("title")
///     }, value: {
///         Text("value")
///     }, axis: .vertical) {
///         ListPickerDestination(data,
///                               id: \.self,
///                               selection: $selection,
///                               isTrackingLiveChanges: true,
///                               searchFilter: { f, s in f.contains(s) }, rowContent: {
///             Text($0)
///         })
///     }
/// }
///
/// // If you want grouped different sections, the protocol `ListPickerSectionModel` is need be implemented for your element of data.
///
/// struct ListPickerSection: ListPickerSectionModel {}
/// let data = [ListPickerSection(title: "Section 1", items: ["first", "second", "third"]),
///             ListPickerSection(title: "Section 2", items: ["apple", "banana", "orange"])]
/// var body: some View {
///     ListPickerItem(title: {
///         Text("title")
///     }, value: {
///         Text("value")
///     }, axis: .vertical) {
///         ListPickerDestination(data,
///                               id: \.self,
///                               selection: $selection,
///                               isTrackingLiveChanges: true,
///                               searchFilter: { f, s in f.contains(s) }, rowContent: {
///             Text($0)
///         })
///     }
/// }
/// ```
public struct ListPickerItem {
    let title: any View
    let value: any View
    let mandatoryFieldIndicator: any View
    let isRequired: Bool
    /// The `ControlState` of the form view. The default is `normal`
    let controlState: ControlState
    /// The error message of the form view.
    let errorMessage: AttributedString?
    let axis: Axis
    let destination: any View

    @Environment(\.listPickerItemStyle) var style

    var componentIdentifier: String = ListPickerItem.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder value: () -> any View = { EmptyView() },
                @ViewBuilder mandatoryFieldIndicator: () -> any View = { Text("*") },
                isRequired: Bool = false,
                controlState: ControlState = .normal,
                errorMessage: AttributedString? = nil,
                axis: Axis = .horizontal,
                @ViewBuilder destination: () -> any View = { EmptyView() },
                componentIdentifier: String? = ListPickerItem.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.value = Value(value: value, componentIdentifier: componentIdentifier)
        self.mandatoryFieldIndicator = MandatoryFieldIndicator(mandatoryFieldIndicator: mandatoryFieldIndicator, componentIdentifier: componentIdentifier)
        self.isRequired = isRequired
        self.controlState = controlState
        self.errorMessage = errorMessage
        self.axis = axis
        self.destination = destination()
        self.componentIdentifier = componentIdentifier ?? ListPickerItem.identifier
    }
}

public extension ListPickerItem {
    static let identifier = "fiori_listpickeritem_component"
}

public extension ListPickerItem {
    init(title: AttributedString,
         value: AttributedString? = nil,
         mandatoryFieldIndicator: TextOrIcon? = .text("*"),
         isRequired: Bool = false,
         controlState: ControlState = .normal,
         errorMessage: AttributedString? = nil,
         axis: Axis = .horizontal,
         @ViewBuilder destination: () -> any View = { EmptyView() })
    {
        self.init(title: { Text(title) }, value: { OptionalText(value) }, mandatoryFieldIndicator: { TextOrIconView(mandatoryFieldIndicator) }, isRequired: isRequired, controlState: controlState, errorMessage: errorMessage, axis: axis, destination: destination)
    }
}

public extension ListPickerItem {
    init(_ configuration: ListPickerItemConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ListPickerItemConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.value = configuration.value
        self.mandatoryFieldIndicator = configuration.mandatoryFieldIndicator
        self.isRequired = configuration.isRequired
        self.controlState = configuration.controlState
        self.errorMessage = configuration.errorMessage
        self.axis = configuration.axis
        self.destination = configuration.destination
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ListPickerItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), value: .init(self.value), mandatoryFieldIndicator: .init(self.mandatoryFieldIndicator), isRequired: self.isRequired, controlState: self.controlState, errorMessage: self.errorMessage, axis: self.axis, destination: .init(self.destination))).typeErased
                .transformEnvironment(\.listPickerItemStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ListPickerItem {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ListPickerItem(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), value: .init(self.value), mandatoryFieldIndicator: .init(self.mandatoryFieldIndicator), isRequired: self.isRequired, controlState: self.controlState, errorMessage: self.errorMessage, axis: self.axis, destination: .init(self.destination)))
            .shouldApplyDefaultStyle(false)
            .listPickerItemStyle(ListPickerItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
