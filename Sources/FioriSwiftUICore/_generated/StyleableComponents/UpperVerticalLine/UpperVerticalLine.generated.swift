// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct UpperVerticalLine {
    let upperVerticalLine: any View

    @Environment(\.upperVerticalLineStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder upperVerticalLine: () -> any View = { Rectangle().fill(Color.clear) }) {
        self.upperVerticalLine = upperVerticalLine()
    }
}

public extension UpperVerticalLine {
    init(_ configuration: UpperVerticalLineConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: UpperVerticalLineConfiguration, shouldApplyDefaultStyle: Bool) {
        self.upperVerticalLine = configuration.upperVerticalLine
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension UpperVerticalLine: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(upperVerticalLine: .init(self.upperVerticalLine))).typeErased
                .transformEnvironment(\.upperVerticalLineStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension UpperVerticalLine {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        UpperVerticalLine(upperVerticalLine: { self.upperVerticalLine })
            .shouldApplyDefaultStyle(false)
            .upperVerticalLineStyle(.fiori)
            .typeErased
    }
}
