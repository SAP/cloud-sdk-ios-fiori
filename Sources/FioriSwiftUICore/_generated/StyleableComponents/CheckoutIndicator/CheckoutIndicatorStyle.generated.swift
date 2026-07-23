// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol CheckoutIndicatorStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: CheckoutIndicatorConfiguration) -> Body
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
    public var componentIdentifier: String = "fiori_checkoutindicator_component"
    @Binding public var displayState: DisplayState
}

extension CheckoutIndicatorConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct CheckoutIndicatorDefaultStyle: CheckoutIndicatorStyle {
    nonisolated init() {}

    func makeBody(_ configuration: CheckoutIndicatorConfiguration) -> some View {
        CheckoutIndicator(configuration)
            .checkoutIndicatorStyle(CheckoutIndicatorBaseStyle())
    }
}
