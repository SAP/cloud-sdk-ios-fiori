// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol PlaceholderStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: PlaceholderConfiguration) -> Body
}

struct AnyPlaceholderStyle: PlaceholderStyle {
    let content: (PlaceholderConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (PlaceholderConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: PlaceholderConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct PlaceholderConfiguration {
    public let placeholderIdentifier = "FioriPlaceholder_placeholder"

    public var componentIdentifier: String = "fiori_placeholder_component"
    public let placeholder: Placeholder

    public typealias Placeholder = ConfigurationViewWrapper
}

extension PlaceholderConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
