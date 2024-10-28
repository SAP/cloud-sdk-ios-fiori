// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol ListPickerItemStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ListPickerItemConfiguration) -> Body
}

struct AnyListPickerItemStyle: ListPickerItemStyle {
    let content: (ListPickerItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ListPickerItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ListPickerItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ListPickerItemConfiguration {
    public let title: Title
    public let value: Value
    public let axis: Axis
    public let destination: Destination

    public typealias Title = ConfigurationViewWrapper
    public typealias Value = ConfigurationViewWrapper
    public typealias Destination = ConfigurationViewWrapper
}

public struct ListPickerItemFioriStyle: ListPickerItemStyle {
    public func makeBody(_ configuration: ListPickerItemConfiguration) -> some View {
        ListPickerItem(configuration)
            .titleStyle(TitleFioriStyle(listPickerItemConfiguration: configuration))
            .valueStyle(ValueFioriStyle(listPickerItemConfiguration: configuration))
    }
}
