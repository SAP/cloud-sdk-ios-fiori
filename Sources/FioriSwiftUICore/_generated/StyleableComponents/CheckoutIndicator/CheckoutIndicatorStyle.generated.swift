// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol CheckoutIndicatorStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: CheckoutIndicatorConfiguration) -> Body
}

struct AnyCheckoutIndicatorStyle: CheckoutIndicatorStyle {
    let content: (CheckoutIndicatorConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (CheckoutIndicatorConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: CheckoutIndicatorConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct CheckoutIndicatorConfiguration {
    @Binding public var displayState: DisplayState
}
