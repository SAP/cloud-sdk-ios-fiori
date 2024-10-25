// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AllEntriesSectionTitleStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AllEntriesSectionTitleConfiguration) -> Body
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
    public let allEntriesSectionTitle: AllEntriesSectionTitle

    public typealias AllEntriesSectionTitle = ConfigurationViewWrapper
}
