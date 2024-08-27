// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol OptionalTitleStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: OptionalTitleConfiguration) -> Body
}

struct AnyOptionalTitleStyle: OptionalTitleStyle {
    let content: (OptionalTitleConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (OptionalTitleConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: OptionalTitleConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct OptionalTitleConfiguration {
    public let optionalTitle: OptionalTitle

    public typealias OptionalTitle = ConfigurationViewWrapper
}
