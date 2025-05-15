// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol OrderPickerStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: OrderPickerConfiguration) -> Body
}

struct AnyOrderPickerStyle: OrderPickerStyle {
    let content: (OrderPickerConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (OrderPickerConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: OrderPickerConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct OrderPickerConfiguration {
    public var componentIdentifier: String = "fiori_orderpicker_component"
    public let optionalTitle: OptionalTitle
    @Binding public var data: [OrderPickerItemModel]
    public let isAtLeastOneSelected: Bool
    public let onChangeHandler: ((OrderPickerItemModel.Change, [OrderPickerItemModel]) -> Void)?
    public let controlState: ControlState

    public typealias OptionalTitle = ConfigurationViewWrapper
}

extension OrderPickerConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct OrderPickerFioriStyle: OrderPickerStyle {
    public func makeBody(_ configuration: OrderPickerConfiguration) -> some View {
        OrderPicker(configuration)
            .optionalTitleStyle(OptionalTitleFioriStyle(orderPickerConfiguration: configuration))
    }
}
