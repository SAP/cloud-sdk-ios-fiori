// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TextWithMandatoryFieldIndicatorStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TextWithMandatoryFieldIndicatorConfiguration) -> Body
}

struct AnyTextWithMandatoryFieldIndicatorStyle: TextWithMandatoryFieldIndicatorStyle {
    let content: (TextWithMandatoryFieldIndicatorConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TextWithMandatoryFieldIndicatorConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TextWithMandatoryFieldIndicatorConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TextWithMandatoryFieldIndicatorConfiguration {
    public var componentIdentifier: String = "fiori_textwithmandatoryfieldindicator_component"
    public let text: AttributedString
    public let isRequired: Bool
    public let mandatoryFieldIndicator: TextOrIcon?
}

extension TextWithMandatoryFieldIndicatorConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct TextWithMandatoryFieldIndicatorFioriStyle: TextWithMandatoryFieldIndicatorStyle {
    public func makeBody(_ configuration: TextWithMandatoryFieldIndicatorConfiguration) -> some View {
        TextWithMandatoryFieldIndicator(configuration)
    }
}
