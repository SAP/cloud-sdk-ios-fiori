// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol PlaceholderTextFieldStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> Body
}

struct AnyPlaceholderTextFieldStyle: PlaceholderTextFieldStyle {
    let content: (PlaceholderTextFieldConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (PlaceholderTextFieldConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct PlaceholderTextFieldConfiguration {
    public var componentIdentifier: String = "fiori_placeholdertextfield_component"
    @Binding public var text: String
    public let placeholder: Placeholder

    public typealias Placeholder = ConfigurationViewWrapper
}

public extension PlaceholderTextFieldConfiguration {
    var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    var textInputFieldIdentifier: String {
        self.componentIdentifier + "_textInputField"
    }

    var placeholderIdentifier: String {
        self.componentIdentifier + "_placeholder"
    }
}

extension PlaceholderTextFieldConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct PlaceholderTextFieldFioriStyle: PlaceholderTextFieldStyle {
    public func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
        PlaceholderTextField(configuration)
            .textInputFieldStyle(TextInputFieldFioriStyle(placeholderTextFieldConfiguration: configuration))
            .placeholderStyle(PlaceholderFioriStyle(placeholderTextFieldConfiguration: configuration))
    }
}

public struct PlaceholderTextFieldNSSStyle: PlaceholderTextFieldStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: PlaceholderTextFieldConfiguration) -> some View {
        PlaceholderTextField(configuration)
            .textInputFieldStyle(TextInputFieldNSSStyle(placeholderTextFieldConfiguration: configuration, nssData: self.data.value(configuration.textInputFieldIdentifier)))
            .placeholderStyle(PlaceholderNSSStyle(placeholderTextFieldConfiguration: configuration, nssData: self.data.value(configuration.placeholderIdentifier)))
            .placeholderTextFieldStyle(ContentNSSStyle(placeholderTextFieldConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
