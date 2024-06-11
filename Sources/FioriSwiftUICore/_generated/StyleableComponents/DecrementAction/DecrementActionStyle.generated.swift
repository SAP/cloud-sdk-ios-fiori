// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol DecrementActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: DecrementActionConfiguration) -> Body
}

struct AnyDecrementActionStyle: DecrementActionStyle {
    let content: (DecrementActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DecrementActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DecrementActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct DecrementActionConfiguration {
    public let decrementAction: DecrementAction

    public typealias DecrementAction = ConfigurationViewWrapper
}
