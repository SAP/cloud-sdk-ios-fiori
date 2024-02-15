// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Counter {
    let counter: any View

    @Environment(\.counterStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder counter: () -> any View = { EmptyView() }) {
        self.counter = counter()
    }
}

public extension Counter {
    init(counter: AttributedString? = nil) {
        self.init(counter: { OptionalText(counter) })
    }
}

public extension Counter {
    init(_ configuration: CounterConfiguration) {
        self.counter = configuration.counter
        self._shouldApplyDefaultStyle = false
    }
}

extension Counter: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(counter: .init(self.counter))).typeErased
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
        Counter(counter: { self.counter })
            .shouldApplyDefaultStyle(false)
            .counterStyle(.fiori)
            .typeErased
    }
}
