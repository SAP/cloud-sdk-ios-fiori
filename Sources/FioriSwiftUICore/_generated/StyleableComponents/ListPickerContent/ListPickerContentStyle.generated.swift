// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol ListPickerContentStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ListPickerContentConfiguration) -> Body
}

struct AnyListPickerContentStyle: ListPickerContentStyle {
    let content: (ListPickerContentConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ListPickerContentConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ListPickerContentConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ListPickerContentConfiguration {
    public let listPickerContent: ListPickerContent

    public typealias ListPickerContent = ConfigurationViewWrapper
}
