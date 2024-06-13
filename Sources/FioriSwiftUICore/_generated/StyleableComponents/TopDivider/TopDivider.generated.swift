// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TopDivider {
    let topDivider: any View

    @Environment(\.topDividerStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder topDivider: () -> any View = { Rectangle().fill(Color.clear) }) {
        self.topDivider = topDivider()
    }
}

public extension TopDivider {
    init(_ configuration: TopDividerConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TopDividerConfiguration, shouldApplyDefaultStyle: Bool) {
        self.topDivider = configuration.topDivider
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TopDivider: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(topDivider: .init(self.topDivider))).typeErased
                .transformEnvironment(\.topDividerStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TopDivider {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TopDivider(topDivider: { self.topDivider })
            .shouldApplyDefaultStyle(false)
            .topDividerStyle(.fiori)
            .typeErased
    }
}
