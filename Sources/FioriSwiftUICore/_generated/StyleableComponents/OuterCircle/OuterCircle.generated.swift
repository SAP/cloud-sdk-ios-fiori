// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct OuterCircle {
    let outerCircle: any View

    @Environment(\.outerCircleStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder outerCircle: () -> any View) {
        self.outerCircle = outerCircle()
    }
}

public extension OuterCircle {
    init(outerCircle: any Shape = Circle()) {
        self.init(outerCircle: { outerCircle })
    }
}

public extension OuterCircle {
    init(_ configuration: OuterCircleConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: OuterCircleConfiguration, shouldApplyDefaultStyle: Bool) {
        self.outerCircle = configuration.outerCircle
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension OuterCircle: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(outerCircle: .init(self.outerCircle))).typeErased
                .transformEnvironment(\.outerCircleStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension OuterCircle {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        OuterCircle(.init(outerCircle: .init(self.outerCircle)))
            .shouldApplyDefaultStyle(false)
            .outerCircleStyle(.fiori)
            .typeErased
    }
}
