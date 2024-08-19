// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct HeaderTitle {
    let headerTitle: any View

    @Environment(\.headerTitleStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder headerTitle: () -> any View) {
        self.headerTitle = headerTitle()
    }
}

public extension HeaderTitle {
    init(headerTitle: AttributedString) {
        self.init(headerTitle: { Text(headerTitle) })
    }
}

public extension HeaderTitle {
    init(_ configuration: HeaderTitleConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: HeaderTitleConfiguration, shouldApplyDefaultStyle: Bool) {
        self.headerTitle = configuration.headerTitle
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension HeaderTitle: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(headerTitle: .init(self.headerTitle))).typeErased
                .transformEnvironment(\.headerTitleStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension HeaderTitle {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        HeaderTitle(headerTitle: { self.headerTitle })
            .shouldApplyDefaultStyle(false)
            .headerTitleStyle(.fiori)
            .typeErased
    }
}
