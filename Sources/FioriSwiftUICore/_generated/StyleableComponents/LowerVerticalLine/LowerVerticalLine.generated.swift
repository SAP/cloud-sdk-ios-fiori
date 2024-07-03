// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct LowerVerticalLine {
    let lowerVerticalLine: any View

    @Environment(\.lowerVerticalLineStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder lowerVerticalLine: () -> any View = { Rectangle().fill(Color.clear) }) {
        self.lowerVerticalLine = lowerVerticalLine()
    }
}

public extension LowerVerticalLine {
    init(_ configuration: LowerVerticalLineConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: LowerVerticalLineConfiguration, shouldApplyDefaultStyle: Bool) {
        self.lowerVerticalLine = configuration.lowerVerticalLine
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension LowerVerticalLine: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(lowerVerticalLine: .init(self.lowerVerticalLine))).typeErased
                .transformEnvironment(\.lowerVerticalLineStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension LowerVerticalLine {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        LowerVerticalLine(lowerVerticalLine: { self.lowerVerticalLine })
            .shouldApplyDefaultStyle(false)
            .lowerVerticalLineStyle(.fiori)
            .typeErased
    }
}
