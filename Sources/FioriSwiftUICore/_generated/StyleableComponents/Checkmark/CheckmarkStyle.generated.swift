// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol CheckmarkStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: CheckmarkConfiguration) -> Body
}

struct AnyCheckmarkStyle: CheckmarkStyle {
    let content: (CheckmarkConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (CheckmarkConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: CheckmarkConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct CheckmarkConfiguration {
    public var componentIdentifier: String = "fiori_checkmark_component"
    public let checkmark: Checkmark

    public typealias Checkmark = ConfigurationViewWrapper
}

extension CheckmarkConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
