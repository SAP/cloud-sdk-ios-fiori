// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol NotNowActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: NotNowActionConfiguration) -> Body
}

struct AnyNotNowActionStyle: NotNowActionStyle {
    let content: (NotNowActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (NotNowActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: NotNowActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct NotNowActionConfiguration {
    public var componentIdentifier: String = "fiori_notnowaction_component"
    public let notNowAction: NotNowAction

    public typealias NotNowAction = ConfigurationViewWrapper
}

extension NotNowActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
