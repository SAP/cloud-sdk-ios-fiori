// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Node {
    let node: any View

    @Environment(\.nodeStyle) var style

    var componentIdentifier: String = Node.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder node: () -> any View = { EmptyView() },
                componentIdentifier: String? = Node.identifier)
    {
        self.node = node()
        self.componentIdentifier = componentIdentifier ?? Node.identifier
    }
}

public extension Node {
    static let identifier = "fiori_node_component"
}

public extension Node {
    init(node: TextOrIcon? = nil,
         componentIdentifier: String? = Node.identifier)
    {
        self.init(node: { TextOrIconView(node) }, componentIdentifier: componentIdentifier)
    }
}

public extension Node {
    init(_ configuration: NodeConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: NodeConfiguration, shouldApplyDefaultStyle: Bool) {
        self.node = configuration.node
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Node: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, node: .init(self.node))).typeErased
                .transformEnvironment(\.nodeStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Node {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Node(.init(componentIdentifier: self.componentIdentifier, node: .init(self.node)))
            .shouldApplyDefaultStyle(false)
            .nodeStyle(.fiori)
            .typeErased
    }
}
