// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TrailingHorizontalLineStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TrailingHorizontalLineConfiguration) -> Body
}

struct AnyTrailingHorizontalLineStyle: TrailingHorizontalLineStyle {
    let content: (TrailingHorizontalLineConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TrailingHorizontalLineConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TrailingHorizontalLineConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TrailingHorizontalLineConfiguration {
    public let trailingHorizontalLine: TrailingHorizontalLine

    public typealias TrailingHorizontalLine = ConfigurationViewWrapper
}
