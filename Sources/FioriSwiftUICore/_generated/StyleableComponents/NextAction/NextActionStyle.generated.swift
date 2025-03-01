// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol NextActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: NextActionConfiguration) -> Body
}

struct AnyNextActionStyle: NextActionStyle {
    let content: (NextActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (NextActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: NextActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct NextActionConfiguration {
    public var componentIdentifier: String = "fiori_nextaction_component"
    public let nextAction: NextAction

    public typealias NextAction = ConfigurationViewWrapper
}

extension NextActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
