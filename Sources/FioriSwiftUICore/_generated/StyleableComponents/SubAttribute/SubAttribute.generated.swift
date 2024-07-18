// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct SubAttribute {
    let subAttribute: any View

    @Environment(\.subAttributeStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder subAttribute: () -> any View = { EmptyView() }) {
        self.subAttribute = subAttribute()
    }
}

public extension SubAttribute {
    init(subAttribute: AttributedString? = nil) {
        self.init(subAttribute: { OptionalText(subAttribute) })
    }
}

public extension SubAttribute {
    init(_ configuration: SubAttributeConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SubAttributeConfiguration, shouldApplyDefaultStyle: Bool) {
        self.subAttribute = configuration.subAttribute
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension SubAttribute: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(subAttribute: .init(self.subAttribute))).typeErased
                .transformEnvironment(\.subAttributeStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SubAttribute {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SubAttribute(subAttribute: { self.subAttribute })
            .shouldApplyDefaultStyle(false)
            .subAttributeStyle(.fiori)
            .typeErased
    }
}
