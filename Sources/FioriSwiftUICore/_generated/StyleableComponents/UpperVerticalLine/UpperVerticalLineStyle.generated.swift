// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol UpperVerticalLineStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: UpperVerticalLineConfiguration) -> Body
}

struct AnyUpperVerticalLineStyle: UpperVerticalLineStyle {
    let content: (UpperVerticalLineConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (UpperVerticalLineConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: UpperVerticalLineConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct UpperVerticalLineConfiguration {
    public let upperVerticalLine: UpperVerticalLine

    public typealias UpperVerticalLine = ConfigurationViewWrapper
}
