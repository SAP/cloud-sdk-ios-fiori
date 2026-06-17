// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol LowerThumbStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: LowerThumbConfiguration) -> Body
}

struct AnyLowerThumbStyle: LowerThumbStyle {
    let content: (LowerThumbConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (LowerThumbConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: LowerThumbConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct LowerThumbConfiguration {
    public var componentIdentifier: String = "fiori_lowerthumb_component"
    public let lowerThumb: LowerThumb

    public typealias LowerThumb = ConfigurationViewWrapper
}

extension LowerThumbConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
