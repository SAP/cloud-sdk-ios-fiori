// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Tag {
    let tag: any View

    @Environment(\.tagStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder tag: () -> any View) {
        self.tag = tag()
    }
}

public extension Tag {
    init(tag: TextOrIcon) {
        self.init(tag: { TextOrIconView(tag) })
    }
}

public extension Tag {
    init(_ configuration: TagConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TagConfiguration, shouldApplyDefaultStyle: Bool) {
        self.tag = configuration.tag
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension Tag: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(tag: .init(self.tag))).typeErased
                .transformEnvironment(\.tagStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Tag {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Tag(.init(tag: .init(self.tag)))
            .shouldApplyDefaultStyle(false)
            .tagStyle(.fiori)
            .typeErased
    }
}
