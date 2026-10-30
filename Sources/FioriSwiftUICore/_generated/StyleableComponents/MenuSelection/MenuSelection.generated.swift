// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct MenuSelection {
    let action: any View
    @Binding var isExpanded: Bool
    /// A closure that returns the list of views to display as menu items. Defaults to an empty array when not provided.
    let menuItems: () -> [any View]

    @Environment(\.menuSelectionStyle) var style

    var componentIdentifier: String = MenuSelection.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder action: () -> any View = { EmptyView() },
                isExpanded: Binding<Bool>,
                menuItems: @escaping () -> [any View] = { [] },
                componentIdentifier: String? = MenuSelection.identifier)
    {
        self.action = Action(action: action, componentIdentifier: componentIdentifier)
        self._isExpanded = isExpanded
        self.menuItems = menuItems
        self.componentIdentifier = componentIdentifier ?? MenuSelection.identifier
    }
}

public extension MenuSelection {
    static let identifier = "fiori_menuselection_component"
}

public extension MenuSelection {
    init(action: FioriButton? = nil,
         isExpanded: Binding<Bool>,
         menuItems: @escaping () -> [any View] = { [] })
    {
        self.init(action: { action }, isExpanded: isExpanded, menuItems: menuItems)
    }
}

public extension MenuSelection {
    init(_ configuration: MenuSelectionConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: MenuSelectionConfiguration, shouldApplyDefaultStyle: Bool) {
        self.action = configuration.action
        self._isExpanded = configuration.$isExpanded
        self.menuItems = configuration.menuItems
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension MenuSelection: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, action: .init(self.action), isExpanded: self.$isExpanded, menuItems: self.menuItems)).typeErased
                .transformEnvironment(\.menuSelectionStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension MenuSelection {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        MenuSelection(.init(componentIdentifier: self.componentIdentifier, action: .init(self.action), isExpanded: self.$isExpanded, menuItems: self.menuItems))
            .shouldApplyDefaultStyle(false)
            .menuSelectionStyle(MenuSelectionFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
