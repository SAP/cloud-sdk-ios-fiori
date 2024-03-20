// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct MoreActionOverflow {
    let moreActionOverflow: any View

    @Environment(\.moreActionOverflowStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder moreActionOverflow: () -> any View = { EmptyView() }) {
        self.moreActionOverflow = moreActionOverflow()
    }
}

public extension MoreActionOverflow {
    init(_ configuration: MoreActionOverflowConfiguration) {
        self.moreActionOverflow = configuration.moreActionOverflow
        self._shouldApplyDefaultStyle = false
    }
}

extension MoreActionOverflow: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(moreActionOverflow: .init(self.moreActionOverflow))).typeErased
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
        MoreActionOverflow(moreActionOverflow: { self.moreActionOverflow })
            .shouldApplyDefaultStyle(false)
            .moreActionOverflowStyle(.fiori)
            .typeErased
    }
}
