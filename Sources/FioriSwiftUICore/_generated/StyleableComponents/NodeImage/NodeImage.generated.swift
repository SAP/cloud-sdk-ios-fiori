// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct NodeImage {
    let nodeImage: any View

    @Environment(\.nodeImageStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder nodeImage: () -> any View) {
        self.nodeImage = nodeImage()
    }
}

public extension NodeImage {
    init(nodeImage: TimelineNodeType) {
        self.init(nodeImage: { TimelineNodesView(nodeImage) })
    }
}

public extension NodeImage {
    init(_ configuration: NodeImageConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: NodeImageConfiguration, shouldApplyDefaultStyle: Bool) {
        self.nodeImage = configuration.nodeImage
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension NodeImage: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(nodeImage: .init(self.nodeImage))).typeErased
                .transformEnvironment(\.nodeImageStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension NodeImage {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        NodeImage(nodeImage: { self.nodeImage })
            .shouldApplyDefaultStyle(false)
            .nodeImageStyle(.fiori)
            .typeErased
    }
}
