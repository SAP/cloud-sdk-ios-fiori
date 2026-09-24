// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol XmarkStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: XmarkConfiguration) -> Body
}

struct AnyXmarkStyle: XmarkStyle {
    let content: (XmarkConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (XmarkConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: XmarkConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct XmarkConfiguration {
    public var componentIdentifier: String = "fiori_xmark_component"
    public let xmark: Xmark

    public typealias Xmark = ConfigurationViewWrapper
}

extension XmarkConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct XmarkDefaultStyle: XmarkStyle {
    nonisolated init() {}

    func makeBody(_ configuration: XmarkConfiguration) -> some View {
        Xmark(configuration)
            .xmarkStyle(XmarkBaseStyle())
    }
}
