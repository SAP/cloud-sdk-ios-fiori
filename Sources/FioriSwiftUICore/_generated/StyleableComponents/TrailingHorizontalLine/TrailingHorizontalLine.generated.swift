// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct TrailingHorizontalLine {
    let trailingHorizontalLine: any View

    @Environment(\.trailingHorizontalLineStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder trailingHorizontalLine: () -> any View = { Rectangle().fill(Color.clear) }) {
        self.trailingHorizontalLine = trailingHorizontalLine()
    }
}

public extension TrailingHorizontalLine {
    init(_ configuration: TrailingHorizontalLineConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TrailingHorizontalLineConfiguration, shouldApplyDefaultStyle: Bool) {
        self.trailingHorizontalLine = configuration.trailingHorizontalLine
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension TrailingHorizontalLine: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(trailingHorizontalLine: .init(self.trailingHorizontalLine))).typeErased
                .transformEnvironment(\.trailingHorizontalLineStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension TrailingHorizontalLine {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        TrailingHorizontalLine(trailingHorizontalLine: { self.trailingHorizontalLine })
            .shouldApplyDefaultStyle(false)
            .trailingHorizontalLineStyle(.fiori)
            .typeErased
    }
}
