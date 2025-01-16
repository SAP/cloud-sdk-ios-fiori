// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol SectionFooterStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SectionFooterConfiguration) -> Body
}

struct AnySectionFooterStyle: SectionFooterStyle {
    let content: (SectionFooterConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SectionFooterConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SectionFooterConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SectionFooterConfiguration {
    public let title: Title
    public let attribute: Attribute
    public let sectionFooterStyle: SectionHeaderFooterStyle
    public let didSelectHandler: (() -> Void)?

    public typealias Title = ConfigurationViewWrapper
    public typealias Attribute = ConfigurationViewWrapper
}

public struct SectionFooterFioriStyle: SectionFooterStyle {
    public func makeBody(_ configuration: SectionFooterConfiguration) -> some View {
        SectionFooter(configuration)
            .titleStyle(TitleFioriStyle(sectionFooterConfiguration: configuration))
            .attributeStyle(AttributeFioriStyle(sectionFooterConfiguration: configuration))
    }
}
