// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct NowIndicatorNode {
    let nowIndicatorNode: any View

    @Environment(\.nowIndicatorNodeStyle) var style

    var componentIdentifier: String = NowIndicatorNode.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder nowIndicatorNode: () -> any View = { Image(systemName: "circle.fill") },
                componentIdentifier: String? = NowIndicatorNode.identifier)
    {
        self.nowIndicatorNode = nowIndicatorNode()
        self.componentIdentifier = componentIdentifier ?? NowIndicatorNode.identifier
    }
}

public extension NowIndicatorNode {
    static let identifier = "fiori_nowindicatornode_component"
}

public extension NowIndicatorNode {
    init(_ configuration: NowIndicatorNodeConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: NowIndicatorNodeConfiguration, shouldApplyDefaultStyle: Bool) {
        self.nowIndicatorNode = configuration.nowIndicatorNode
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension NowIndicatorNode: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, nowIndicatorNode: .init(self.nowIndicatorNode))).typeErased
                .transformEnvironment(\.nowIndicatorNodeStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension NowIndicatorNode {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        NowIndicatorNode(.init(componentIdentifier: self.componentIdentifier, nowIndicatorNode: .init(self.nowIndicatorNode)))
            .shouldApplyDefaultStyle(false)
            .nowIndicatorNodeStyle(.fiori)
            .typeErased
    }
}
