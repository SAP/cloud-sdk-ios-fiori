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
    /// The `ControlState` of the form view. The default is `normal`
    let controlState: ControlState
    /// The error message of the form view.
    let errorMessage: AttributedString?
    let axis: Axis

    @Environment(\.keyValueItemStyle) var style

    var componentIdentifier: String = KeyValueItem.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder key: () -> any View,
                @ViewBuilder value: () -> any View = { EmptyView() },
                controlState: ControlState = .normal,
                errorMessage: AttributedString? = nil,
                axis: Axis = .horizontal,
                componentIdentifier: String? = KeyValueItem.identifier)
    {
        self.key = Key(key: key, componentIdentifier: componentIdentifier)
        self.value = Value(value: value, componentIdentifier: componentIdentifier)
        self.controlState = controlState
        self.errorMessage = errorMessage
        self.axis = axis
        self.componentIdentifier = componentIdentifier ?? KeyValueItem.identifier
    }
}

public extension KeyValueItem {
    static let identifier = "fiori_keyvalueitem_component"
}

public extension KeyValueItem {
    init(key: AttributedString,
         value: AttributedString? = nil,
         controlState: ControlState = .normal,
         errorMessage: AttributedString? = nil,
         axis: Axis = .horizontal)
    {
        self.init(key: { Text(key) }, value: { OptionalText(value) }, controlState: controlState, errorMessage: errorMessage, axis: axis)
    }
}

public extension KeyValueItem {
    init(_ configuration: KeyValueItemConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: KeyValueItemConfiguration, shouldApplyDefaultStyle: Bool) {
        self.key = configuration.key
        self.value = configuration.value
        self.controlState = configuration.controlState
        self.errorMessage = configuration.errorMessage
        self.axis = configuration.axis
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension KeyValueItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, key: .init(self.key), value: .init(self.value), controlState: self.controlState, errorMessage: self.errorMessage, axis: self.axis)).typeErased
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
        KeyValueItem(.init(componentIdentifier: self.componentIdentifier, key: .init(self.key), value: .init(self.value), controlState: self.controlState, errorMessage: self.errorMessage, axis: self.axis))
            .shouldApplyDefaultStyle(false)
            .keyValueItemStyle(KeyValueItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
