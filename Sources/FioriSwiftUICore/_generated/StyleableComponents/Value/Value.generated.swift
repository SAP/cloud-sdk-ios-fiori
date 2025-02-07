// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Value {
    let value: any View

    @Environment(\.valueStyle) var style

    var componentIdentifier: String = Value.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder value: () -> any View = { EmptyView() },
                componentIdentifier: String? = Value.identifier)
    {
        self.value = value()
        self.componentIdentifier = componentIdentifier ?? Value.identifier
    }
}

public extension Value {
    static let identifier = "fiori_value_component"
}

public extension Value {
    init(value: AttributedString? = nil) {
        self.init(value: { OptionalText(value) })
    }
}

public extension Value {
    init(_ configuration: ValueConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: ValueConfiguration, shouldApplyDefaultStyle: Bool) {
        self.value = configuration.value
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Value: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, value: .init(self.value))).typeErased
                .transformEnvironment(\.valueStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Value {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Value(.init(componentIdentifier: self.componentIdentifier, value: .init(self.value)))
            .shouldApplyDefaultStyle(false)
            .valueStyle(.fiori)
            .typeErased
    }
}
