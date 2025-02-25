// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol KeyStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: KeyConfiguration) -> Body
}

struct AnyKeyStyle: KeyStyle {
    let content: (KeyConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (KeyConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: KeyConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct KeyConfiguration {
    public var componentIdentifier: String = "fiori_key_component"
    public let key: Key

    public typealias Key = ConfigurationViewWrapper
}

extension KeyConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
