// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Switch {
    @Binding var isOn: Bool

    @Environment(\.switchStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(isOn: Binding<Bool>) {
        self._isOn = isOn
    }
}

public extension Switch {
    init(_ configuration: SwitchConfiguration) {
        self._isOn = configuration.$isOn
        self._shouldApplyDefaultStyle = false
    }
}

extension Switch: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(isOn: self.$isOn)).typeErased
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
        Switch(isOn: self.$isOn)
            .shouldApplyDefaultStyle(false)
            .switchStyle(.fiori)
            .typeErased
    }
}
