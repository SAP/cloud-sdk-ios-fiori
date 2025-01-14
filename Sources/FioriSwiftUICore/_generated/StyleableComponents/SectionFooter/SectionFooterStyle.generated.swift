// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public let contentIdentifier = "FioriSectionFooter_content"
    public let titleIdentifier = "FioriSectionFooter_title"
    public let attributeIdentifier = "FioriSectionFooter_attribute"

    public var componentIdentifier: String = "fiori_sectionfooter_component"
    public let title: Title
    public let attribute: Attribute
    public let sectionFooterStyle: SectionHeaderFooterStyle
    public let didSelectHandler: (() -> Void)?

    public typealias Title = ConfigurationViewWrapper
    public typealias Attribute = ConfigurationViewWrapper
}

extension SectionFooterConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct SectionFooterFioriStyle: SectionFooterStyle {
    public func makeBody(_ configuration: SectionFooterConfiguration) -> some View {
        SectionFooter(configuration)
            .titleStyle(TitleFioriStyle(sectionFooterConfiguration: configuration))
            .attributeStyle(AttributeFioriStyle(sectionFooterConfiguration: configuration))
    }
}

public struct SectionFooterNSSStyle: SectionFooterStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: SectionFooterConfiguration) -> some View {
        SectionFooter(configuration)
            .titleStyle(TitleNSSStyle(sectionFooterConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .attributeStyle(AttributeNSSStyle(sectionFooterConfiguration: configuration, nssData: self.data.value(configuration.attributeIdentifier)))
            .sectionFooterStyle(ContentNSSStyle(sectionFooterConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
