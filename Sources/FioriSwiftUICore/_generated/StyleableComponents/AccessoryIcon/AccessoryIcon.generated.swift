// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct AccessoryIcon {
    let accessoryIcon: any View

    @Environment(\.accessoryIconStyle) var style

    var componentIdentifier: String = AccessoryIcon.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder accessoryIcon: () -> any View = { EmptyView() },
                componentIdentifier: String? = AccessoryIcon.identifier)
    {
        self.accessoryIcon = accessoryIcon()
        self.componentIdentifier = componentIdentifier ?? AccessoryIcon.identifier
    }
}

public extension AccessoryIcon {
    static let identifier = "fiori_accessoryicon_component"
}

public extension AccessoryIcon {
    init(accessoryIcon: Image? = nil,
         componentIdentifier: String? = AccessoryIcon.identifier)
    {
        self.init(accessoryIcon: { accessoryIcon }, componentIdentifier: componentIdentifier)
    }
}

public extension AccessoryIcon {
    init(_ configuration: AccessoryIconConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AccessoryIconConfiguration, shouldApplyDefaultStyle: Bool) {
        self.accessoryIcon = configuration.accessoryIcon
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AccessoryIcon: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, accessoryIcon: .init(self.accessoryIcon))).typeErased
                .transformEnvironment(\.accessoryIconStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AccessoryIcon {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AccessoryIcon(.init(componentIdentifier: self.componentIdentifier, accessoryIcon: .init(self.accessoryIcon)))
            .shouldApplyDefaultStyle(false)
            .accessoryIconStyle(.fiori)
            .typeErased
    }
}
