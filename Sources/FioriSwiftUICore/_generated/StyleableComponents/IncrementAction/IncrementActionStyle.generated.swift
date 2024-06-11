// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol IncrementActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: IncrementActionConfiguration) -> Body
}

struct AnyIncrementActionStyle: IncrementActionStyle {
    let content: (IncrementActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (IncrementActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: IncrementActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct IncrementActionConfiguration {
    public let incrementAction: IncrementAction

    public typealias IncrementAction = ConfigurationViewWrapper
}
