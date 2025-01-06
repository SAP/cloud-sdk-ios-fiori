// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct SectionHeader {
    let title: any View
    let attribute: any View

    @Environment(\.sectionHeaderStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@ViewBuilder title: () -> any View,
                @ViewBuilder attribute: () -> any View = { EmptyView() })
    {
        self.title = Title(title: title)
        self.attribute = Attribute(attribute: attribute)
    }
}

public extension SectionHeader {
    init(title: AttributedString,
         attribute: AttributedString? = nil)
    {
        self.init(title: { Text(title) }, attribute: { OptionalText(attribute) })
    }
}

public extension SectionHeader {
    init(_ configuration: SectionHeaderConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: SectionHeaderConfiguration, shouldApplyDefaultStyle: Bool) {
        self.title = configuration.title
        self.attribute = configuration.attribute
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension SectionHeader: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(title: .init(self.title), attribute: .init(self.attribute))).typeErased
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
        SectionHeader(.init(title: .init(self.title), attribute: .init(self.attribute)))
            .shouldApplyDefaultStyle(false)
            .sectionHeaderStyle(SectionHeaderFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
