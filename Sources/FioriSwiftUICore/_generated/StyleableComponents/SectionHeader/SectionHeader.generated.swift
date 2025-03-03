// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct SectionHeader {
    let title: any View
    let attribute: any View
    /// Style determines fonts and colors. Default is `.title` style.
    let sectionHeaderStyle: SectionHeaderFooterStyle
    /// Optional handler, to respond to tap events on the view.
    let didSelectHandler: (() -> Void)?

    @Environment(\.sectionHeaderStyle) var style

    var componentIdentifier: String = SectionHeader.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder attribute: () -> any View = { EmptyView() },
                sectionHeaderStyle: SectionHeaderFooterStyle = .title,
                didSelectHandler: (() -> Void)? = nil,
                componentIdentifier: String? = SectionHeader.identifier)
    {
        self.title = Title(title: title, componentIdentifier: componentIdentifier)
        self.attribute = Attribute(attribute: attribute, componentIdentifier: componentIdentifier)
        self.sectionHeaderStyle = sectionHeaderStyle
        self.didSelectHandler = didSelectHandler
        self.componentIdentifier = componentIdentifier ?? SectionHeader.identifier
    }
}

public extension SectionHeader {
    static let identifier = "fiori_sectionheader_component"
}

public extension SectionHeader {
    init(title: AttributedString,
         attribute: AttributedString? = nil,
         sectionHeaderStyle: SectionHeaderFooterStyle = .title,
         didSelectHandler: (() -> Void)? = nil)
    {
        self.init(title: { Text(title) }, attribute: { OptionalText(attribute) }, sectionHeaderStyle: sectionHeaderStyle, didSelectHandler: didSelectHandler)
    }
}

public extension SectionHeader {
    init(_ configuration: SectionHeaderConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SectionHeaderConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.attribute = configuration.attribute
        self.sectionHeaderStyle = configuration.sectionHeaderStyle
        self.didSelectHandler = configuration.didSelectHandler
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension SectionHeader: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, title: .init(self.title), attribute: .init(self.attribute), sectionHeaderStyle: self.sectionHeaderStyle, didSelectHandler: self.didSelectHandler)).typeErased
                .transformEnvironment(\.sectionHeaderStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension SectionHeader {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        SectionHeader(.init(componentIdentifier: self.componentIdentifier, title: .init(self.title), attribute: .init(self.attribute), sectionHeaderStyle: self.sectionHeaderStyle, didSelectHandler: self.didSelectHandler))
            .shouldApplyDefaultStyle(false)
            .sectionHeaderStyle(SectionHeaderFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
