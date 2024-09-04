// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct MenuSelectionItem {
    let icon: any View
    let title: any View
    let action: (() -> Void)?

    @Environment(\.menuSelectionItemStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder icon: () -> any View = { EmptyView() },
                @ViewBuilder title: () -> any View,
                action: (() -> Void)? = nil)
    {
        self.icon = Icon(icon: icon)
        self.title = Title(title: title)
        self.action = action
    }
}

public extension MenuSelectionItem {
    init(icon: Image? = nil,
         title: AttributedString,
         action: (() -> Void)? = nil)
    {
        self.init(icon: { icon }, title: { Text(title) }, action: action)
    }
}

public extension MenuSelectionItem {
    init(_ configuration: MenuSelectionItemConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: MenuSelectionItemConfiguration, shouldApplyDefaultStyle: Bool) {
        self.icon = configuration.icon
        self.title = configuration.title
        self.action = configuration.action
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension MenuSelectionItem: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(icon: .init(self.icon), title: .init(self.title), action: self.action)).typeErased
                .transformEnvironment(\.menuSelectionItemStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension MenuSelectionItem {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        MenuSelectionItem(.init(icon: .init(self.icon), title: .init(self.title), action: self.action))
            .shouldApplyDefaultStyle(false)
            .menuSelectionItemStyle(MenuSelectionItemFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
