// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

/// `KeyValueItem` provides a customizable activity item with a key and a value.
///
/// ## Usage
/// ```swift
/// KeyValueItem(key: {
///         Text("key 1")
///     }, value: {
///         Text("value 1")
///     }, axis: .vertical)
/// ```
public struct KeyValueItem {
    let key: any View
    let value: any View
    let mandatoryFieldIndicator: any View
    let isRequired: Bool
    /// The `ControlState` of the form view. The default is `normal`
    let controlState: ControlState
    /// The error message of the form view.
    let errorMessage: AttributedString?
    let axis: Axis

    @Environment(\.keyValueItemStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder key: () -> any View,
                @ViewBuilder value: () -> any View = { EmptyView() },
                @ViewBuilder mandatoryFieldIndicator: () -> any View = { Text("*") },
                isRequired: Bool = false,
                controlState: ControlState = .normal,
                errorMessage: AttributedString? = nil,
                axis: Axis = .horizontal)
    {
        self.key = Key(key: key)
        self.value = Value(value: value)
        self.mandatoryFieldIndicator = MandatoryFieldIndicator(mandatoryFieldIndicator: mandatoryFieldIndicator)
        self.isRequired = isRequired
        self.controlState = controlState
        self.errorMessage = errorMessage
        self.axis = axis
    }
}

public extension KeyValueItem {
    init(key: AttributedString,
         value: AttributedString? = nil,
         mandatoryFieldIndicator: TextOrIcon? = .text("*"),
         isRequired: Bool = false,
         controlState: ControlState = .normal,
         errorMessage: AttributedString? = nil,
         axis: Axis = .horizontal)
    {
        self.init(key: { Text(key) }, value: { OptionalText(value) }, mandatoryFieldIndicator: { TextOrIconView(mandatoryFieldIndicator) }, isRequired: isRequired, controlState: controlState, errorMessage: errorMessage, axis: axis)
    }
}

public extension KeyValueItem {
    init(_ configuration: KeyValueItemConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: KeyValueItemConfiguration, shouldApplyDefaultStyle: Bool) {
        self.key = configuration.key
        self.value = configuration.value
        self.mandatoryFieldIndicator = configuration.mandatoryFieldIndicator
        self.isRequired = configuration.isRequired
        self.controlState = configuration.controlState
        self.errorMessage = configuration.errorMessage
        self.axis = configuration.axis
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension KeyValueItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(key: .init(self.key), value: .init(self.value), mandatoryFieldIndicator: .init(self.mandatoryFieldIndicator), isRequired: self.isRequired, controlState: self.controlState, errorMessage: self.errorMessage, axis: self.axis)).typeErased
                .transformEnvironment(\.keyValueItemStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension KeyValueItem {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        KeyValueItem(.init(key: .init(self.key), value: .init(self.value), mandatoryFieldIndicator: .init(self.mandatoryFieldIndicator), isRequired: self.isRequired, controlState: self.controlState, errorMessage: self.errorMessage, axis: self.axis))
            .shouldApplyDefaultStyle(false)
            .keyValueItemStyle(KeyValueItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
