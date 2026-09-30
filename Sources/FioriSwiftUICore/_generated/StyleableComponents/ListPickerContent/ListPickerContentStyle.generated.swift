// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol ListPickerContentStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: ListPickerContentConfiguration) -> Body
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
    public var componentIdentifier: String = "fiori_listpickercontent_component"
    public let listPickerContent: ListPickerContent

    public typealias ListPickerContent = ConfigurationViewWrapper
}

extension ListPickerContentConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct ListPickerContentDefaultStyle: ListPickerContentStyle {
    nonisolated init() {}

    func makeBody(_ configuration: ListPickerContentConfiguration) -> some View {
        ListPickerContent(configuration)
            .listPickerContentStyle(ListPickerContentBaseStyle())
    }
}
