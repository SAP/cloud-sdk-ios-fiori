// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol KeyValueItemStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: KeyValueItemConfiguration) -> Body
}

struct AnyKeyValueItemStyle: KeyValueItemStyle {
    let content: (KeyValueItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (KeyValueItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: KeyValueItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct KeyValueItemConfiguration {
    public var componentIdentifier: String = "fiori_keyvalueitem_component"
    public let key: Key
    public let value: Value
    public let controlState: ControlState
    public let errorMessage: AttributedString?
    public let axis: Axis

    public typealias Key = ConfigurationViewWrapper
    public typealias Value = ConfigurationViewWrapper
}

extension KeyValueItemConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct KeyValueItemFioriStyle: KeyValueItemStyle {
    public func makeBody(_ configuration: KeyValueItemConfiguration) -> some View {
        KeyValueItem(configuration)
            .keyStyle(KeyFioriStyle(keyValueItemConfiguration: configuration))
            .valueStyle(ValueFioriStyle(keyValueItemConfiguration: configuration))
            .formViewStyle(FormViewFioriStyle(keyValueItemConfiguration: configuration))
    }
}
