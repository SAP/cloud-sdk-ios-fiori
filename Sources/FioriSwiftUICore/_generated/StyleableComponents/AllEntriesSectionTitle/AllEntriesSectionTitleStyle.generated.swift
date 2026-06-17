// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol AllEntriesSectionTitleStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: AllEntriesSectionTitleConfiguration) -> Body
}

struct AnyAllEntriesSectionTitleStyle: AllEntriesSectionTitleStyle {
    let content: (AllEntriesSectionTitleConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AllEntriesSectionTitleConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AllEntriesSectionTitleConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AllEntriesSectionTitleConfiguration {
    public var componentIdentifier: String = "fiori_allentriessectiontitle_component"
    public let allEntriesSectionTitle: AllEntriesSectionTitle

    public typealias AllEntriesSectionTitle = ConfigurationViewWrapper
}

extension AllEntriesSectionTitleConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
