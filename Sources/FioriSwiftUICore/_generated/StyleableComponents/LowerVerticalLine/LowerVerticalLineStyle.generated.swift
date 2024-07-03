// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol LowerVerticalLineStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: LowerVerticalLineConfiguration) -> Body
}

struct AnyLowerVerticalLineStyle: LowerVerticalLineStyle {
    let content: (LowerVerticalLineConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (LowerVerticalLineConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: LowerVerticalLineConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct LowerVerticalLineConfiguration {
    public let lowerVerticalLine: LowerVerticalLine

    public typealias LowerVerticalLine = ConfigurationViewWrapper
}
