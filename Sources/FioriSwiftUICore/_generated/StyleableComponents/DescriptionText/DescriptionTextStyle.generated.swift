// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol DescriptionTextStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: DescriptionTextConfiguration) -> Body
}

struct AnyDescriptionTextStyle: DescriptionTextStyle {
    let content: (DescriptionTextConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DescriptionTextConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DescriptionTextConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct DescriptionTextConfiguration {
    public var componentIdentifier: String = "fiori_descriptiontext_component"
    public let descriptionText: DescriptionText

    public typealias DescriptionText = ConfigurationViewWrapper
}

extension DescriptionTextConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
