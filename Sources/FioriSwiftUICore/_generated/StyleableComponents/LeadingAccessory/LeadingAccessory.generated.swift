// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct LeadingAccessory {
    let leadingAccessory: any View

    @Environment(\.leadingAccessoryStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder leadingAccessory: () -> any View = { EmptyView() }) {
        self.leadingAccessory = leadingAccessory()
    }
}

public extension LeadingAccessory {
    init(_ configuration: LeadingAccessoryConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: LeadingAccessoryConfiguration, shouldApplyDefaultStyle: Bool) {
        self.leadingAccessory = configuration.leadingAccessory
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension LeadingAccessory: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(leadingAccessory: .init(self.leadingAccessory))).typeErased
                .transformEnvironment(\.leadingAccessoryStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension LeadingAccessory {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        LeadingAccessory(.init(leadingAccessory: .init(self.leadingAccessory)))
            .shouldApplyDefaultStyle(false)
            .leadingAccessoryStyle(.fiori)
            .typeErased
    }
}
