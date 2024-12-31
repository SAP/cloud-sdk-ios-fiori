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
    public let key: Key
    public let value: Value
    public let mandatoryFieldIndicator: MandatoryFieldIndicator
    public let isRequired: Bool
    public let controlState: ControlState
    public let errorMessage: AttributedString?
    public let axis: Axis

    public typealias Key = ConfigurationViewWrapper
    public typealias Value = ConfigurationViewWrapper
    public typealias MandatoryFieldIndicator = ConfigurationViewWrapper
}

public struct KeyValueItemFioriStyle: KeyValueItemStyle {
    public func makeBody(_ configuration: KeyValueItemConfiguration) -> some View {
        KeyValueItem(configuration)
            .keyStyle(KeyFioriStyle(keyValueItemConfiguration: configuration))
            .valueStyle(ValueFioriStyle(keyValueItemConfiguration: configuration))
            .mandatoryFieldIndicatorStyle(MandatoryFieldIndicatorFioriStyle(keyValueItemConfiguration: configuration))
            .formViewStyle(FormViewFioriStyle(keyValueItemConfiguration: configuration))
    }
}
