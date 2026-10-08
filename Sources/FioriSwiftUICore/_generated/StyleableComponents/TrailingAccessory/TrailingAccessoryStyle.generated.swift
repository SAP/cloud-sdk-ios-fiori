// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol TrailingAccessoryStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: TrailingAccessoryConfiguration) -> Body
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
    public var componentIdentifier: String = "fiori_trailingaccessory_component"
    public let trailingAccessory: TrailingAccessory

    public typealias TrailingAccessory = ConfigurationViewWrapper
}

extension TrailingAccessoryConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct TrailingAccessoryDefaultStyle: TrailingAccessoryStyle {
    nonisolated init() {}

    func makeBody(_ configuration: TrailingAccessoryConfiguration) -> some View {
        TrailingAccessory(configuration)
            .trailingAccessoryStyle(TrailingAccessoryBaseStyle())
    }
}
