// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol ValueStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ValueConfiguration) -> Body
}

struct AnyValueStyle: ValueStyle {
    let content: (ValueConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ValueConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ValueConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ValueConfiguration {
    public let value: Value

    public typealias Value = ConfigurationViewWrapper
}
