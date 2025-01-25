// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct SectionFooter {
    let title: any View
    let attribute: any View
    /// Style determines fonts and colors. Default is `.title` style.
    let sectionFooterStyle: SectionHeaderFooterStyle
    /// Optional handler, to respond to tap events on the view.
    let didSelectHandler: (() -> Void)?

    @Environment(\.sectionFooterStyle) var style

    var componentIdentifier: String = SectionFooter.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder attribute: () -> any View = { EmptyView() },
                sectionFooterStyle: SectionHeaderFooterStyle = .title,
                didSelectHandler: (() -> Void)? = nil,
                componentIdentifier: String? = SectionFooter.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.attribute = Attribute(attribute: attribute, componentIdentifier: componentIdentifier)
        self.sectionFooterStyle = sectionFooterStyle
        self.didSelectHandler = didSelectHandler
        self.componentIdentifier = componentIdentifier ?? SectionFooter.identifier
    }
}

public extension SectionFooter {
    static let identifier = "fiori_sectionfooter_component"
}

public extension SectionFooter {
    init(title: AttributedString,
         attribute: AttributedString? = nil,
         sectionFooterStyle: SectionHeaderFooterStyle = .title,
         didSelectHandler: (() -> Void)? = nil)
    {
        self.init(title: { Text(title) }, attribute: { OptionalText(attribute) }, sectionFooterStyle: sectionFooterStyle, didSelectHandler: didSelectHandler)
    }
}

public extension SectionFooter {
    init(_ configuration: SectionFooterConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SectionFooterConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.attribute = configuration.attribute
        self.sectionFooterStyle = configuration.sectionFooterStyle
        self.didSelectHandler = configuration.didSelectHandler
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension SectionFooter: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), attribute: .init(self.attribute), sectionFooterStyle: self.sectionFooterStyle, didSelectHandler: self.didSelectHandler)).typeErased
                .transformEnvironment(\.sectionFooterStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SectionFooter {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SectionFooter(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), attribute: .init(self.attribute), sectionFooterStyle: self.sectionFooterStyle, didSelectHandler: self.didSelectHandler))
            .shouldApplyDefaultStyle(false)
            .sectionFooterStyle(SectionFooterFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
