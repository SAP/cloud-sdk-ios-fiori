// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `ValuePicker`  provides a title and value label with Fiori styling and a wheel-style `Picker`.
/// ## Usage
/// ```swift
/// let valueOptions :[AttributedString] = ["1", "20", "300"]
/// @State var selectedIndex: Int = 0
/// @State var isRequired = false
/// @State var stateIndex: Int = 0
/// @State var isTrackingLiveChanges = true
/// @State var showsErrorMessage = false
/// ```
public struct ValuePicker {
    let title: any View
    let valueLabel: any View
    let mandatoryFieldIndicator: any View
    let isRequired: Bool
    let options: [AttributedString]
    /// The index for the selected value in the valueOptions.
    @Binding var selectedIndex: Int
    /// When `isTrackingLiveChanges` is true, the value will be shown every time a selection is made. If it is set to false, the value will only be displayed when the value picker is collapsed. The default setting is true.
    var isTrackingLiveChanges: Bool
    /// This property indicates whether the picker is to always be displayed. The default is false.
    var alwaysShowPicker: Bool
    /// The `ControlState` of the  view. Currently, `.disabled`, `.normal` and `.readOnly` are supported. The default is `normal`.
    let controlState: ControlState

    @Environment(\.valuePickerStyle) var style

    var componentIdentifier: String = ValuePicker.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder valueLabel: () -> any View = { EmptyView() },
                @ViewBuilder mandatoryFieldIndicator: () -> any View = { Text("*") },
                isRequired: Bool = false,
                options: [AttributedString] = [],
                selectedIndex: Binding<Int>,
                isTrackingLiveChanges: Bool = true,
                alwaysShowPicker: Bool = false,
                controlState: ControlState = .normal,
                componentIdentifier: String? = ValuePicker.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.valueLabel = ValueLabel(valueLabel: valueLabel, componentIdentifier: componentIdentifier)
        self.mandatoryFieldIndicator = MandatoryFieldIndicator(mandatoryFieldIndicator: mandatoryFieldIndicator, componentIdentifier: componentIdentifier)
        self.isRequired = isRequired
        self.options = options
        self._selectedIndex = selectedIndex
        self.isTrackingLiveChanges = isTrackingLiveChanges
        self.alwaysShowPicker = alwaysShowPicker
        self.controlState = controlState
        self.componentIdentifier = componentIdentifier ?? ValuePicker.identifier
    }
}

public extension ValuePicker {
    static let identifier = "fiori_valuepicker_component"
}

public extension ValuePicker {
    init(title: AttributedString,
         valueLabel: AttributedString? = nil,
         mandatoryFieldIndicator: TextOrIcon? = .text("*"),
         isRequired: Bool = false,
         options: [AttributedString] = [],
         selectedIndex: Binding<Int>,
         isTrackingLiveChanges: Bool = true,
         alwaysShowPicker: Bool = false,
         controlState: ControlState = .normal)
    {
        self.init(title: { Text(title) }, valueLabel: { OptionalText(valueLabel) }, mandatoryFieldIndicator: { TextOrIconView(mandatoryFieldIndicator) }, isRequired: isRequired, options: options, selectedIndex: selectedIndex, isTrackingLiveChanges: isTrackingLiveChanges, alwaysShowPicker: alwaysShowPicker, controlState: controlState)
    }
}

public extension ValuePicker {
    init(_ configuration: ValuePickerConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ValuePickerConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.valueLabel = configuration.valueLabel
        self.mandatoryFieldIndicator = configuration.mandatoryFieldIndicator
        self.isRequired = configuration.isRequired
        self.options = configuration.options
        self._selectedIndex = configuration.$selectedIndex
        self.isTrackingLiveChanges = configuration.isTrackingLiveChanges
        self.alwaysShowPicker = configuration.alwaysShowPicker
        self.controlState = configuration.controlState
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension ValuePicker: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), valueLabel: .init(self.valueLabel), mandatoryFieldIndicator: .init(self.mandatoryFieldIndicator), isRequired: self.isRequired, options: self.options, selectedIndex: self.$selectedIndex, isTrackingLiveChanges: self.isTrackingLiveChanges, alwaysShowPicker: self.alwaysShowPicker, controlState: self.controlState)).typeErased
                .transformEnvironment(\.valuePickerStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension ValuePicker {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        ValuePicker(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), valueLabel: .init(self.valueLabel), mandatoryFieldIndicator: .init(self.mandatoryFieldIndicator), isRequired: self.isRequired, options: self.options, selectedIndex: self.$selectedIndex, isTrackingLiveChanges: self.isTrackingLiveChanges, alwaysShowPicker: self.alwaysShowPicker, controlState: self.controlState))
            .shouldApplyDefaultStyle(false)
            .valuePickerStyle(ValuePickerFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
