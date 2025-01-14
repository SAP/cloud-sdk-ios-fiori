// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol StatusStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: StatusConfiguration) -> Body
}

struct AnyStatusStyle: StatusStyle {
    let content: (StatusConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (StatusConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: StatusConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct StatusConfiguration {
    public let statusIdentifier = "FioriStatus_status"

    public var componentIdentifier: String = "fiori_status_component"
    public let status: Status

    public typealias Status = ConfigurationViewWrapper
}

extension StatusConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
