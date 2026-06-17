// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol ActivityItemsStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: ActivityItemsConfiguration) -> Body
}

struct AnyActivityItemsStyle: ActivityItemsStyle {
    let content: (ActivityItemsConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (ActivityItemsConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: ActivityItemsConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct ActivityItemsConfiguration {
    public var componentIdentifier: String = "fiori_activityitems_component"
    public let activityItems: ActivityItems

    public typealias ActivityItems = ConfigurationViewWrapper
}

extension ActivityItemsConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
