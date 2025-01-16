// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol SelectedEntriesSectionTitleStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SelectedEntriesSectionTitleConfiguration) -> Body
}

struct AnySelectedEntriesSectionTitleStyle: SelectedEntriesSectionTitleStyle {
    let content: (SelectedEntriesSectionTitleConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SelectedEntriesSectionTitleConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SelectedEntriesSectionTitleConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SelectedEntriesSectionTitleConfiguration {
    public var componentIdentifier: String = "fiori_selectedentriessectiontitle_component"
    public let selectedEntriesSectionTitle: SelectedEntriesSectionTitle

    public typealias SelectedEntriesSectionTitle = ConfigurationViewWrapper
}

public extension SelectedEntriesSectionTitleConfiguration {
    var selectedEntriesSectionTitleIdentifier: String {
        self.componentIdentifier + "_selectedEntriesSectionTitle"
    }
}

extension SelectedEntriesSectionTitleConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
