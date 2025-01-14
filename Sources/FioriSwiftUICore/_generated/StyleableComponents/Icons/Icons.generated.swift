// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Icons {
    let icons: any View

    @Environment(\.iconsStyle) var style

    var componentIdentifier: String = Icons.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@IconBuilder icons: () -> any View = { EmptyView() },
                componentIdentifier: String? = Icons.identifier)
    {
        self.icons = icons()
        self.componentIdentifier = componentIdentifier ?? Icons.identifier
    }
}

public extension Icons {
    static let identifier = "fiori_icons_component"
}

public extension Icons {
    init(icons: [TextOrIcon] = []) {
        self.init(icons: { IconStack(icons) })
    }
}

public extension Icons {
    init(_ configuration: IconsConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: IconsConfiguration, shouldApplyDefaultStyle: Bool) {
        self.icons = configuration.icons
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Icons: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, icons: .init(self.icons))).typeErased
                .transformEnvironment(\.iconsStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Icons {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Icons(.init(componentIdentifier: self.componentIdentifier, icons: .init(self.icons)))
            .shouldApplyDefaultStyle(false)
            .iconsStyle(.fiori)
            .typeErased
    }
}
