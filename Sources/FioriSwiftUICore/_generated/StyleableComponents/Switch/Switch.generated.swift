// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Switch {
    @Binding var isOn: Bool

    @Environment(\.switchStyle) var style

    var componentIdentifier: String = Switch.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(isOn: Binding<Bool>,
                componentIdentifier: String? = Switch.identifier)
    {
        self._isOn = isOn
        self.componentIdentifier = componentIdentifier ?? Switch.identifier
    }
}

public extension Switch {
    static let identifier = "fiori_switch_component"
}

public extension Switch {
    init(_ configuration: SwitchConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SwitchConfiguration, shouldApplyDefaultStyle: Bool) {
        self._isOn = configuration.$isOn
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Switch: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, isOn: self.$isOn)).typeErased
                .transformEnvironment(\.switchStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Switch {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Switch(.init(componentIdentifier: self.componentIdentifier, isOn: self.$isOn))
            .shouldApplyDefaultStyle(false)
            .switchStyle(.fiori)
            .typeErased
    }
}
