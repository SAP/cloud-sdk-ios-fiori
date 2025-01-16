// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Counter {
    let counter: any View

    @Environment(\.counterStyle) var style

    var componentIdentifier: String = Counter.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder counter: () -> any View = { EmptyView() },
                componentIdentifier: String? = Counter.identifier)
    {
        self.counter = counter()
        self.componentIdentifier = componentIdentifier ?? Counter.identifier
    }
}

public extension Counter {
    static let identifier = "fiori_counter_component"
}

public extension Counter {
    init(counter: AttributedString? = nil,
         componentIdentifier: String? = Counter.identifier)
    {
        self.init(counter: { OptionalText(counter) }, componentIdentifier: componentIdentifier)
    }
}

public extension Counter {
    init(_ configuration: CounterConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: CounterConfiguration, shouldApplyDefaultStyle: Bool) {
        self.counter = configuration.counter
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Counter: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, counter: .init(self.counter))).typeErased
                .transformEnvironment(\.counterStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Counter {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Counter(.init(componentIdentifier: self.componentIdentifier, counter: .init(self.counter)))
            .shouldApplyDefaultStyle(false)
            .counterStyle(.fiori)
            .typeErased
    }
}
