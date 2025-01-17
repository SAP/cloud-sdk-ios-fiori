// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

protocol TextInputInfoViewStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TextInputInfoViewConfiguration) -> Body
}

struct AnyTextInputInfoViewStyle: TextInputInfoViewStyle {
    let content: (TextInputInfoViewConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TextInputInfoViewConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

struct TextInputInfoViewConfiguration {
    public var componentIdentifier: String = "fiori_textinputinfoview_component"
    public let icon: Icon
    public let description: Description
    public let counter: Counter

    public typealias Icon = ConfigurationViewWrapper
    public typealias Description = ConfigurationViewWrapper
    public typealias Counter = ConfigurationViewWrapper
}

extension TextInputInfoViewConfiguration {
    public var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    public var iconIdentifier: String {
        self.componentIdentifier + "_icon"
    }

    public var descriptionIdentifier: String {
        self.componentIdentifier + "_description"
    }

    public var counterIdentifier: String {
        self.componentIdentifier + "_counter"
    }

    public var informationViewIdentifier: String {
        self.componentIdentifier + "_informationView"
    }
}

extension TextInputInfoViewConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct TextInputInfoViewFioriStyle: TextInputInfoViewStyle {
    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
            .iconStyle(IconFioriStyle(textInputInfoViewConfiguration: configuration))
            .descriptionStyle(DescriptionFioriStyle(textInputInfoViewConfiguration: configuration))
            .counterStyle(CounterFioriStyle(textInputInfoViewConfiguration: configuration))
            .informationViewStyle(InformationViewFioriStyle(textInputInfoViewConfiguration: configuration))
    }
}

struct TextInputInfoViewNSSStyle: TextInputInfoViewStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: TextInputInfoViewConfiguration) -> some View {
        TextInputInfoView(configuration)
            .iconStyle(IconNSSStyle(textInputInfoViewConfiguration: configuration, nssData: self.data.value(configuration.iconIdentifier)))
            .descriptionStyle(DescriptionNSSStyle(textInputInfoViewConfiguration: configuration, nssData: self.data.value(configuration.descriptionIdentifier)))
            .counterStyle(CounterNSSStyle(textInputInfoViewConfiguration: configuration, nssData: self.data.value(configuration.counterIdentifier)))
            .informationViewStyle(InformationViewNSSStyle(textInputInfoViewConfiguration: configuration, nssData: self.data.value(configuration.informationViewIdentifier)))
            .textInputInfoViewStyle(ContentNSSStyle(textInputInfoViewConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
