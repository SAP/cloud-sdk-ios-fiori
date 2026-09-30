// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol FlexItemStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: FlexItemConfiguration) -> Body
}

struct AnyFlexItemStyle: FlexItemStyle {
    let content: (FlexItemConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (FlexItemConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: FlexItemConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct FlexItemConfiguration {
    public var componentIdentifier: String = "fiori_flexitem_component"
    public let flexItem: FlexItem

    public typealias FlexItem = ConfigurationViewWrapper
}

extension FlexItemConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct FlexItemDefaultStyle: FlexItemStyle {
    nonisolated init() {}

    func makeBody(_ configuration: FlexItemConfiguration) -> some View {
        FlexItem(configuration)
            .flexItemStyle(FlexItemBaseStyle())
    }
}
