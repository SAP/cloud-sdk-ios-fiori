// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct FootnoteIcons {
    let footnoteIcons: any View

    @Environment(\.footnoteIconsStyle) var style

    var componentIdentifier: String = FootnoteIcons.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@FootnoteIconsBuilder footnoteIcons: () -> any View = { EmptyView() },
                componentIdentifier: String? = FootnoteIcons.identifier)
    {
        self.footnoteIcons = footnoteIcons()
        self.componentIdentifier = componentIdentifier ?? FootnoteIcons.identifier
    }
}

public extension FootnoteIcons {
    static let identifier = "fiori_footnoteicons_component"
}

public extension FootnoteIcons {
    init(footnoteIcons: [TextOrIcon] = [],
         componentIdentifier: String? = FootnoteIcons.identifier)
    {
        self.init(footnoteIcons: { FootnoteIconStack(footnoteIcons) }, componentIdentifier: componentIdentifier)
    }
}

public extension FootnoteIcons {
    init(_ configuration: FootnoteIconsConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: FootnoteIconsConfiguration, shouldApplyDefaultStyle: Bool) {
        self.footnoteIcons = configuration.footnoteIcons
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension FootnoteIcons: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, footnoteIcons: .init(self.footnoteIcons))).typeErased
                .transformEnvironment(\.footnoteIconsStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension FootnoteIcons {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        FootnoteIcons(.init(componentIdentifier: self.componentIdentifier, footnoteIcons: .init(self.footnoteIcons)))
            .shouldApplyDefaultStyle(false)
            .footnoteIconsStyle(.fiori)
            .typeErased
    }
}
