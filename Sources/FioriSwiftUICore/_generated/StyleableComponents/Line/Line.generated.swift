// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Line {
    let line: any View

    @Environment(\.lineStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder line: () -> any View = { Rectangle() }) {
        self.line = line()
    }
}

public extension Line {
    init(_ configuration: LineConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: LineConfiguration, shouldApplyDefaultStyle: Bool) {
        self.line = configuration.line
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension Line: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(line: .init(self.line))).typeErased
                .transformEnvironment(\.lineStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Line {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Line(.init(line: .init(self.line)))
            .shouldApplyDefaultStyle(false)
            .lineStyle(.fiori)
            .typeErased
    }
}
