// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol StateLabelStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: StateLabelConfiguration) -> Body
}

struct AnyStateLabelStyle: StateLabelStyle {
    let content: (StateLabelConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (StateLabelConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: StateLabelConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct StateLabelConfiguration {
    public var componentIdentifier: String = "fiori_statelabel_component"
    public let stateLabel: StateLabel

    public typealias StateLabel = ConfigurationViewWrapper
}

extension StateLabelConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
