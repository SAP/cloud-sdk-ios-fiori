// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TitleWithOptionalMandatoryFieldStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TitleWithOptionalMandatoryFieldConfiguration) -> Body
}

struct AnyTitleWithOptionalMandatoryFieldStyle: TitleWithOptionalMandatoryFieldStyle {
    let content: (TitleWithOptionalMandatoryFieldConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TitleWithOptionalMandatoryFieldConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TitleWithOptionalMandatoryFieldConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TitleWithOptionalMandatoryFieldConfiguration {
    public var componentIdentifier: String = "fiori_titlewithoptionalmandatoryfield_component"
    public let title: AttributedString
    public let isRequired: Bool
    public let mandatoryField: TextOrIcon?
}

extension TitleWithOptionalMandatoryFieldConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct TitleWithOptionalMandatoryFieldFioriStyle: TitleWithOptionalMandatoryFieldStyle {
    public func makeBody(_ configuration: TitleWithOptionalMandatoryFieldConfiguration) -> some View {
        TitleWithOptionalMandatoryField(configuration)
    }
}
