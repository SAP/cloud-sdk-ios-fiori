// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Attribute {
    let attribute: any View

    @Environment(\.attributeStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder attribute: () -> any View = { EmptyView() }) {
        self.attribute = attribute()
    }
}

public extension Attribute {
    init(attribute: AttributedString? = nil) {
        self.init(attribute: { OptionalText(attribute) })
    }
}

public extension Attribute {
    init(_ configuration: AttributeConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AttributeConfiguration, shouldApplyDefaultStyle: Bool) {
        self.attribute = configuration.attribute
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension Attribute: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(attribute: .init(self.attribute))).typeErased
                .transformEnvironment(\.attributeStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Attribute {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Attribute(attribute: { self.attribute })
            .shouldApplyDefaultStyle(false)
            .attributeStyle(.fiori)
            .typeErased
    }
}
