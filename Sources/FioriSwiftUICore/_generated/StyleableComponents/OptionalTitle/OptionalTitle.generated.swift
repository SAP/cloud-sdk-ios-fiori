// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct OptionalTitle {
    let optionalTitle: any View

    @Environment(\.optionalTitleStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder optionalTitle: () -> any View = { EmptyView() }) {
        self.optionalTitle = optionalTitle()
    }
}

public extension OptionalTitle {
    init(optionalTitle: AttributedString?) {
        self.init(optionalTitle: { OptionalText(optionalTitle) })
    }
}

public extension OptionalTitle {
    init(_ configuration: OptionalTitleConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: OptionalTitleConfiguration, shouldApplyDefaultStyle: Bool) {
        self.optionalTitle = configuration.optionalTitle
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension OptionalTitle: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(optionalTitle: .init(self.optionalTitle))).typeErased
                .transformEnvironment(\.optionalTitleStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension OptionalTitle {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        OptionalTitle(.init(optionalTitle: .init(self.optionalTitle)))
            .shouldApplyDefaultStyle(false)
            .optionalTitleStyle(.fiori)
            .typeErased
    }
}
