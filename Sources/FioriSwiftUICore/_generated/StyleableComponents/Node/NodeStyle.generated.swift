// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol NodeStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: NodeConfiguration) -> Body
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

extension NodeConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct NodeDefaultStyle: NodeStyle {
    nonisolated init() {}

    func makeBody(_ configuration: NodeConfiguration) -> some View {
        Node(configuration)
            .nodeStyle(NodeBaseStyle())
    }
}
