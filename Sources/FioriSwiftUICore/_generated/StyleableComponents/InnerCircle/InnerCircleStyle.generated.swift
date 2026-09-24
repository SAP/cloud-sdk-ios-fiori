// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol InnerCircleStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: InnerCircleConfiguration) -> Body
}

struct AnyInnerCircleStyle: InnerCircleStyle {
    let content: (InnerCircleConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (InnerCircleConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: InnerCircleConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct InnerCircleConfiguration {
    public var componentIdentifier: String = "fiori_innercircle_component"
    public let innerCircle: InnerCircle

    public typealias InnerCircle = ConfigurationViewWrapper
}

extension InnerCircleConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct InnerCircleDefaultStyle: InnerCircleStyle {
    nonisolated init() {}

    func makeBody(_ configuration: InnerCircleConfiguration) -> some View {
        InnerCircle(configuration)
            .innerCircleStyle(InnerCircleBaseStyle())
    }
}
