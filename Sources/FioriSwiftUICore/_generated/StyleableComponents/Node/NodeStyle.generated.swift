// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol NodeStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: NodeConfiguration) -> Body
}

struct AnyNodeStyle: NodeStyle {
    let content: (NodeConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (NodeConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: NodeConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct NodeConfiguration {
    public var componentIdentifier: String = "fiori_node_component"
    public let node: Node

    public typealias Node = ConfigurationViewWrapper
}

public extension NodeConfiguration {
    var nodeIdentifier: String {
        self.componentIdentifier + "_node"
    }
}

extension NodeConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
