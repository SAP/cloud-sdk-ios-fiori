// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Footnote {
    let footnote: any View

    @Environment(\.footnoteStyle) var style

    var componentIdentifier: String = Footnote.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder footnote: () -> any View = { EmptyView() },
                componentIdentifier: String? = Footnote.identifier)
    {
        self.footnote = footnote()
        self.componentIdentifier = componentIdentifier ?? Footnote.identifier
    }
}

public extension Footnote {
    static let identifier = "fiori_footnote_component"
}

public extension Footnote {
    init(footnote: AttributedString? = nil) {
        self.init(footnote: { OptionalText(footnote) })
    }
}

public extension Footnote {
    init(_ configuration: FootnoteConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: FootnoteConfiguration, shouldApplyDefaultStyle: Bool) {
        self.footnote = configuration.footnote
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Footnote: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, footnote: .init(self.footnote))).typeErased
                .transformEnvironment(\.footnoteStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Footnote {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Footnote(.init(componentIdentifier: self.componentIdentifier, footnote: .init(self.footnote)))
            .shouldApplyDefaultStyle(false)
            .footnoteStyle(.fiori)
            .typeErased
    }
}
