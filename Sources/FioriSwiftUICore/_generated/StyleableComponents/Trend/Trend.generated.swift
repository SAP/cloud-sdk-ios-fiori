// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Trend {
    let trend: any View

    @Environment(\.trendStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder trend: () -> any View = { EmptyView() }) {
        self.trend = trend()
    }
}

public extension Trend {
    init(trend: AttributedString? = nil) {
        self.init(trend: { OptionalText(trend) })
    }
}

public extension Trend {
    init(_ configuration: TrendConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TrendConfiguration, shouldApplyDefaultStyle: Bool) {
        self.trend = configuration.trend
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension Trend: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(trend: .init(self.trend))).typeErased
                .transformEnvironment(\.trendStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Trend {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Trend(.init(trend: .init(self.trend)))
            .shouldApplyDefaultStyle(false)
            .trendStyle(.fiori)
            .typeErased
    }
}
