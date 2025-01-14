// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol BodyTextStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: BodyTextConfiguration) -> Body
}

struct AnyBodyTextStyle: BodyTextStyle {
    let content: (BodyTextConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (BodyTextConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: BodyTextConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct BodyTextConfiguration {
    public let bodyTextIdentifier = "FioriBodyText_bodyText"

    public var componentIdentifier: String = "fiori_bodytext_component"
    public let bodyText: BodyText

    public typealias BodyText = ConfigurationViewWrapper
}

extension BodyTextConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
