// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol SectionHeaderStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SectionHeaderConfiguration) -> Body
}

struct AnySectionHeaderStyle: SectionHeaderStyle {
    let content: (SectionHeaderConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SectionHeaderConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SectionHeaderConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SectionHeaderConfiguration {
    public let title: Title
    public let attribute: Attribute

    public typealias Title = ConfigurationViewWrapper
    public typealias Attribute = ConfigurationViewWrapper
}

public struct SectionHeaderFioriStyle: SectionHeaderStyle {
    public func makeBody(_ configuration: SectionHeaderConfiguration) -> some View {
        SectionHeader(configuration)
            .titleStyle(TitleFioriStyle(sectionHeaderConfiguration: configuration))
            .attributeStyle(AttributeFioriStyle(sectionHeaderConfiguration: configuration))
    }
}
