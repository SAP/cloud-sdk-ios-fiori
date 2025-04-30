// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

import FioriThemeManager

public struct Separator {
    let separator: any View

    @Environment(\.separatorStyle) var style

    var componentIdentifier: String = Separator.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder separator: () -> any View = { Color.preferredColor(.separator) },
                componentIdentifier: String? = Separator.identifier)
    {
        self.separator = separator()
        self.componentIdentifier = componentIdentifier ?? Separator.identifier
    }
}

public extension Separator {
    static let identifier = "fiori_separator_component"
}

public extension Separator {
    init(separator: Color? = Color.preferredColor(.separator)) {
        self.init(separator: { separator })
    }
}

public extension Separator {
    init(_ configuration: SeparatorConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SeparatorConfiguration, shouldApplyDefaultStyle: Bool) {
        self.separator = configuration.separator
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Separator: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, separator: .init(self.separator))).typeErased
                .transformEnvironment(\.separatorStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Separator {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Separator(.init(componentIdentifier: self.componentIdentifier, separator: .init(self.separator)))
            .shouldApplyDefaultStyle(false)
            .separatorStyle(.fiori)
            .typeErased
    }
}
