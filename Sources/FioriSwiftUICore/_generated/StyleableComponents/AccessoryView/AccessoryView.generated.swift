// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct AccessoryView {
    let accessoryType: AccessoryType

    @Environment(\.accessoryViewStyle) var style

    var componentIdentifier: String = AccessoryView.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(accessoryType: AccessoryType = .none,
                componentIdentifier: String? = AccessoryView.identifier)
    {
        self.accessoryType = accessoryType
        self.componentIdentifier = componentIdentifier ?? AccessoryView.identifier
    }
}

public extension AccessoryView {
    static let identifier = "fiori_accessoryview_component"
}

public extension AccessoryView {
    init(_ configuration: AccessoryViewConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AccessoryViewConfiguration, shouldApplyDefaultStyle: Bool) {
        self.accessoryType = configuration.accessoryType
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension AccessoryView: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, accessoryType: self.accessoryType)).typeErased
                .transformEnvironment(\.accessoryViewStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AccessoryView {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AccessoryView(.init(componentIdentifier: self.componentIdentifier, accessoryType: self.accessoryType))
            .shouldApplyDefaultStyle(false)
            .accessoryViewStyle(.fiori)
            .typeErased
    }
}
