// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Trend {
    let trend: any View

    @Environment(\.trendStyle) var style

    var componentIdentifier: String = Trend.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder trend: () -> any View = { EmptyView() },
                componentIdentifier: String? = Trend.identifier)
    {
        self.trend = trend()
        self.componentIdentifier = componentIdentifier ?? Trend.identifier
    }
}

public extension Trend {
    static let identifier = "fiori_trend_component"
}

public extension Trend {
    init(trend: AttributedString? = nil,
         componentIdentifier: String? = Trend.identifier)
    {
        self.init(trend: { OptionalText(trend) }, componentIdentifier: componentIdentifier)
    }
}

public extension Trend {
    init(_ configuration: TrendConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TrendConfiguration, shouldApplyDefaultStyle: Bool) {
        self.trend = configuration.trend
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Trend: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, trend: .init(self.trend))).typeErased
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
        Trend(.init(componentIdentifier: self.componentIdentifier, trend: .init(self.trend)))
            .shouldApplyDefaultStyle(false)
            .trendStyle(.fiori)
            .typeErased
    }
}
