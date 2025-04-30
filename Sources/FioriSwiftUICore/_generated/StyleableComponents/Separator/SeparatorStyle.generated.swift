// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol SeparatorStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SeparatorConfiguration) -> Body
}

struct AnySeparatorStyle: SeparatorStyle {
    let content: (SeparatorConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SeparatorConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SeparatorConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SeparatorConfiguration {
    public var componentIdentifier: String = "fiori_separator_component"
    public let separator: Separator

    public typealias Separator = ConfigurationViewWrapper
}

extension SeparatorConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
