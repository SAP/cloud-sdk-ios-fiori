// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol LeadingAccessoryStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: LeadingAccessoryConfiguration) -> Body
}

struct AnyLeadingAccessoryStyle: LeadingAccessoryStyle {
    let content: (LeadingAccessoryConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (LeadingAccessoryConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: LeadingAccessoryConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct LeadingAccessoryConfiguration {
    public var componentIdentifier: String = "fiori_leadingaccessory_component"
    public let leadingAccessory: LeadingAccessory

    public typealias LeadingAccessory = ConfigurationViewWrapper
}

extension LeadingAccessoryConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct LeadingAccessoryDefaultStyle: LeadingAccessoryStyle {
    nonisolated init() {}

    func makeBody(_ configuration: LeadingAccessoryConfiguration) -> some View {
        LeadingAccessory(configuration)
            .leadingAccessoryStyle(LeadingAccessoryBaseStyle())
    }
}
