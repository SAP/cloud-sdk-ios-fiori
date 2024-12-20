// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TrailingAccessoryStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TrailingAccessoryConfiguration) -> Body
}

struct AnyTrailingAccessoryStyle: TrailingAccessoryStyle {
    let content: (TrailingAccessoryConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TrailingAccessoryConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TrailingAccessoryConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TrailingAccessoryConfiguration {
    public let trailingAccessory: TrailingAccessory

    public typealias TrailingAccessory = ConfigurationViewWrapper
}
