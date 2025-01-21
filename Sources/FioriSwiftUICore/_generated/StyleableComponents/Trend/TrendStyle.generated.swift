// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TrendStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TrendConfiguration) -> Body
}

struct AnyTrendStyle: TrendStyle {
    let content: (TrendConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TrendConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TrendConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TrendConfiguration {
    public var componentIdentifier: String = "fiori_trend_component"
    public let trend: Trend

    public typealias Trend = ConfigurationViewWrapper
}

extension TrendConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
