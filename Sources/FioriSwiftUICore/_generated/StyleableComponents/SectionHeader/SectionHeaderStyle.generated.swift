// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public let contentIdentifier = "FioriSectionHeader_content"
    public let titleIdentifier = "FioriSectionHeader_title"
    public let attributeIdentifier = "FioriSectionHeader_attribute"

    public var componentIdentifier: String = "fiori_sectionheader_component"
    public let title: Title
    public let attribute: Attribute
    public let sectionHeaderStyle: SectionHeaderFooterStyle
    public let didSelectHandler: (() -> Void)?

    public typealias Title = ConfigurationViewWrapper
    public typealias Attribute = ConfigurationViewWrapper
}

extension SectionHeaderConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct SectionHeaderFioriStyle: SectionHeaderStyle {
    public func makeBody(_ configuration: SectionHeaderConfiguration) -> some View {
        SectionHeader(configuration)
            .titleStyle(TitleFioriStyle(sectionHeaderConfiguration: configuration))
            .attributeStyle(AttributeFioriStyle(sectionHeaderConfiguration: configuration))
    }
}

public struct SectionHeaderNSSStyle: SectionHeaderStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: SectionHeaderConfiguration) -> some View {
        SectionHeader(configuration)
            .titleStyle(TitleNSSStyle(sectionHeaderConfiguration: configuration, nssData: self.data.value(configuration.titleIdentifier)))
            .attributeStyle(AttributeNSSStyle(sectionHeaderConfiguration: configuration, nssData: self.data.value(configuration.attributeIdentifier)))
            .sectionHeaderStyle(ContentNSSStyle(sectionHeaderConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
