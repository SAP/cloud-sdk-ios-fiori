// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct MoreActionOverflow {
    let moreActionOverflow: any View

    @Environment(\.moreActionOverflowStyle) var style

    var componentIdentifier: String = MoreActionOverflow.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder moreActionOverflow: () -> any View = { EmptyView() },
                componentIdentifier: String? = MoreActionOverflow.identifier)
    {
        self.moreActionOverflow = moreActionOverflow()
        self.componentIdentifier = componentIdentifier ?? MoreActionOverflow.identifier
    }
}

public extension MoreActionOverflow {
    static let identifier = "fiori_moreactionoverflow_component"
}

public extension MoreActionOverflow {
    init(_ configuration: MoreActionOverflowConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: MoreActionOverflowConfiguration, shouldApplyDefaultStyle: Bool) {
        self.moreActionOverflow = configuration.moreActionOverflow
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension MoreActionOverflow: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, moreActionOverflow: .init(self.moreActionOverflow))).typeErased
                .transformEnvironment(\.moreActionOverflowStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension MoreActionOverflow {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        MoreActionOverflow(.init(componentIdentifier: self.componentIdentifier, moreActionOverflow: .init(self.moreActionOverflow)))
            .shouldApplyDefaultStyle(false)
            .moreActionOverflowStyle(.fiori)
            .typeErased
    }
}
