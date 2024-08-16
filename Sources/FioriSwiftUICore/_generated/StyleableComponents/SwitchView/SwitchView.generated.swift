// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct SwitchView {
    let title: any View
    @Binding var isOn: Bool

    @Environment(\.switchViewStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                isOn: Binding<Bool>)
    {
        self.title = Title { title() }
        self._isOn = isOn
    }
}

public extension SwitchView {
    init(title: AttributedString,
         isOn: Binding<Bool>)
    {
        self.init(title: { Text(title) }, isOn: isOn)
    }
}

public extension SwitchView {
    init(_ configuration: SwitchViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SwitchViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self._isOn = configuration.$isOn
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension SwitchView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(title: .init(self.title), isOn: self.$isOn)).typeErased
                .transformEnvironment(\.switchViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SwitchView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SwitchView(.init(title: .init(self.title), isOn: self.$isOn))
            .shouldApplyDefaultStyle(false)
            .switchViewStyle(SwitchViewFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
