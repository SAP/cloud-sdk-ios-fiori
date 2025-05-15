// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct OrderPicker {
    let optionalTitle: any View
    /// The data for the list that will be displayed in order picker
    @Binding var data: [OrderPickerItemModel]
    /// Whether At least one sort criterion should be selected
    let isAtLeastOneSelected: Bool
    /// Optional handler, be performed when the selected value changes.
    let onChangeHandler: ((OrderPickerItemModel.Change, [OrderPickerItemModel]) -> Void)?
    /// The `ControlState` of the  view. Currently, `.disabled`, `.normal` and `.readOnly` are supported. The default is `normal`.
    let controlState: ControlState

    @Environment(\.orderPickerStyle) var style

    var componentIdentifier: String = OrderPicker.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder optionalTitle: () -> any View = { EmptyView() },
                data: Binding<[OrderPickerItemModel]>,
                isAtLeastOneSelected: Bool = true,
                onChangeHandler: ((OrderPickerItemModel.Change, [OrderPickerItemModel]) -> Void)? = nil,
                controlState: ControlState = .normal,
                componentIdentifier: String? = OrderPicker.identifier)
    {
        self.optionalTitle = OptionalTitle(optionalTitle: optionalTitle, componentIdentifier: componentIdentifier)
        self._data = data
        self.isAtLeastOneSelected = isAtLeastOneSelected
        self.onChangeHandler = onChangeHandler
        self.controlState = controlState
        self.componentIdentifier = componentIdentifier ?? OrderPicker.identifier
    }
}

public extension OrderPicker {
    static let identifier = "fiori_orderpicker_component"
}

public extension OrderPicker {
    init(optionalTitle: AttributedString?,
         data: Binding<[OrderPickerItemModel]>,
         isAtLeastOneSelected: Bool = true,
         onChangeHandler: ((OrderPickerItemModel.Change, [OrderPickerItemModel]) -> Void)? = nil,
         controlState: ControlState = .normal)
    {
        self.init(optionalTitle: { OptionalText(optionalTitle) }, data: data, isAtLeastOneSelected: isAtLeastOneSelected, onChangeHandler: onChangeHandler, controlState: controlState)
    }
}

public extension OrderPicker {
    init(_ configuration: OrderPickerConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: OrderPickerConfiguration, shouldApplyDefaultStyle: Bool) {
        self.optionalTitle = configuration.optionalTitle
        self._data = configuration.$data
        self.isAtLeastOneSelected = configuration.isAtLeastOneSelected
        self.onChangeHandler = configuration.onChangeHandler
        self.controlState = configuration.controlState
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension OrderPicker: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, optionalTitle: .init(self.optionalTitle), data: self.$data, isAtLeastOneSelected: self.isAtLeastOneSelected, onChangeHandler: self.onChangeHandler, controlState: self.controlState)).typeErased
                .transformEnvironment(\.orderPickerStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension OrderPicker {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        OrderPicker(.init(componentIdentifier: self.componentIdentifier, optionalTitle: .init(self.optionalTitle), data: self.$data, isAtLeastOneSelected: self.isAtLeastOneSelected, onChangeHandler: self.onChangeHandler, controlState: self.controlState))
            .shouldApplyDefaultStyle(false)
            .orderPickerStyle(OrderPickerFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
