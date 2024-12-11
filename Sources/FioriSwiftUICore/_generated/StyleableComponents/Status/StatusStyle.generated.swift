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

    public let status: Status

    public typealias Status = ConfigurationViewWrapper
}
