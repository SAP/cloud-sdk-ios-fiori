// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TrendImageStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TrendImageConfiguration) -> Body
}

struct AnyTrendImageStyle: TrendImageStyle {
    let content: (TrendImageConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TrendImageConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TrendImageConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TrendImageConfiguration {
    public let trendImage: TrendImage

    public typealias TrendImage = ConfigurationViewWrapper
}
