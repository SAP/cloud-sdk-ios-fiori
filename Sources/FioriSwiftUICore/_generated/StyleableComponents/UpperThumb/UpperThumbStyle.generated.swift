// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol UpperThumbStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: UpperThumbConfiguration) -> Body
}

struct AnyUpperThumbStyle: UpperThumbStyle {
    let content: (UpperThumbConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (UpperThumbConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: UpperThumbConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct UpperThumbConfiguration {
    public var componentIdentifier: String = "fiori_upperthumb_component"
    public let upperThumb: UpperThumb

    public typealias UpperThumb = ConfigurationViewWrapper
}

extension UpperThumbConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
