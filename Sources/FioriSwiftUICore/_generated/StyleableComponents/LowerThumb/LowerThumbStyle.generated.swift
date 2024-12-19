// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol LowerThumbStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: LowerThumbConfiguration) -> Body
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
    public let lowerThumb: LowerThumb

    public typealias LowerThumb = ConfigurationViewWrapper
}
