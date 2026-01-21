// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `ListPickerItem` is a view that provides a `NavigationLink` with a title and selected value(s). And `ListPickerDestination` is recommended to be used as its destination, for which selection, search filter and customized rows are supported.
///
/// Use it to present choices in a form where the selection UI lives in a separate destination view. The component supports:
/// - Single or multiple selection
/// - Flat, hierarchical, grouped, or object-based data
/// - Optional search and live change tracking in the destination
/// - Read-only, disabled, and normal states
/// - Custom title, value, and description content
///
/// Inputs
/// - title: ViewBuilder that renders the leading title.
/// - value: ViewBuilder that renders the current selection value (typically a summary). In read-only state, you can pass an AttributedString via the value parameter to render the selected value(s).
/// - description: ViewBuilder for an auxiliary description below the title/value.
/// - isRequired: Marks the field as mandatory and renders the indicator.
/// - controlState: .normal, .disabled, .readOnly.
/// - axis: Layout direction for the header (title/value/description). Defaults to .horizontal.
/// - destination: A builder that returns a ListPickerDestination configured with your data and bindings.
///
/// Behavior
/// - Tapping the row navigates to the destination list.
/// - When controlState is .readOnly, the component does not navigate and should show the current selection via the value slot.
/// - When controlState is .disabled, interactions are disabled.
///
/// ## Usage
/// ```swift
/// @State var state: ControlState = .normal
/// let data = ["first", "second", "third"]
/// var body: some View {
///     ListPickerItem(title: {
///         Text("title")
///     }, value: {
///         Text("value")
///     }, description: {
///         Text("Read-only field")
///     }, controlState: self.state
///     , axis: .vertical) {
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
/// @State var state: ControlState = .normal
/// struct ListPickerSection: ListPickerSectionModel {}
/// let data = [ListPickerSection(title: "Section 1", items: ["first", "second", "third"]),
///             ListPickerSection(title: "Section 2", items: ["apple", "banana", "orange"])]
/// var body: some View {
///     ListPickerItem(title: {
///         Text("title")
///     }, value: {
///         Text("value")
///     }, description: {
///         Text("Read-only field")
///     }, controlState: self.state
///     , axis: .vertical) {
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
/// /// Example: Read-only value using AttributedString
/// ```swift
///  @State private var selection: String? = "Second"
///  let readOnlyValue: AttributedString? = .init(selection ?? "No Selection")
///  ListPickerItem(title: "Title", value: readOnlyValue, description: "Read-only", controlState: .readOnly) {
///      EmptyView() // destination is ignored in read-only
///  }
/// ```
public struct ListPickerItem {
    let title: any View
    let value: any View
    let description: any View
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
                @ViewBuilder description: () -> any View = { EmptyView() },
                controlState: ControlState = .normal,
                errorMessage: AttributedString? = nil,
                axis: Axis = .horizontal,
                @ViewBuilder destination: () -> any View = { EmptyView() },
                componentIdentifier: String? = ListPickerItem.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.value = Value(value: value, componentIdentifier: componentIdentifier)
        self.description = Description(description: description, componentIdentifier: componentIdentifier)
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
         description: AttributedString? = nil,
         mandatoryFieldIndicator: TextOrIcon? = .text("*"),
         isRequired: Bool = false,
         controlState: ControlState = .normal,
         errorMessage: AttributedString? = nil,
         axis: Axis = .horizontal,
         @ViewBuilder destination: () -> any View = { EmptyView() })
    {
        self.init(title: {
            TextWithMandatoryFieldIndicator(text: title, isRequired: isRequired, mandatoryFieldIndicator: mandatoryFieldIndicator)
        }, value: { OptionalText(value) }, description: { OptionalText(description) }, controlState: controlState, errorMessage: errorMessage, axis: axis, destination: destination)
    }
}

public extension ListPickerItem {
    init(_ configuration: ListPickerItemConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ListPickerItemConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.value = configuration.value
        self.description = configuration.description
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
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), value: .init(self.value), description: .init(self.description), controlState: self.controlState, errorMessage: self.errorMessage, axis: self.axis, destination: .init(self.destination))).typeErased
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
        ListPickerItem(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), value: .init(self.value), description: .init(self.description), controlState: self.controlState, errorMessage: self.errorMessage, axis: self.axis, destination: .init(self.destination)))
            .shouldApplyDefaultStyle(false)
            .listPickerItemStyle(ListPickerItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
