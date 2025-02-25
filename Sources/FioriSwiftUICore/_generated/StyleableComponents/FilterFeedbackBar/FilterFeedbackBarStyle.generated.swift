// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol FilterFeedbackBarStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: FilterFeedbackBarConfiguration) -> Body
}

struct AnyFilterFeedbackBarStyle: FilterFeedbackBarStyle {
    let content: (FilterFeedbackBarConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (FilterFeedbackBarConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: FilterFeedbackBarConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct FilterFeedbackBarConfiguration {
    public var componentIdentifier: String = "fiori_filterfeedbackbar_component"
    public let items: Items
    public let onUpdate: (() -> Void)?

    public typealias Items = ConfigurationViewWrapper
}

extension FilterFeedbackBarConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct FilterFeedbackBarFioriStyle: FilterFeedbackBarStyle {
    public func makeBody(_ configuration: FilterFeedbackBarConfiguration) -> some View {
        FilterFeedbackBar(configuration)
    }
}
