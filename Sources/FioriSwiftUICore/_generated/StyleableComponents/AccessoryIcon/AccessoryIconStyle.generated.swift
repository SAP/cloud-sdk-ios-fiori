// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol AccessoryIconStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AccessoryIconConfiguration) -> Body
}

struct AnyAccessoryIconStyle: AccessoryIconStyle {
    let content: (AccessoryIconConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AccessoryIconConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AccessoryIconConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AccessoryIconConfiguration {
    public let accessoryIconIdentifier = "FioriAccessoryIcon_accessoryIcon"

    public var componentIdentifier: String = "fiori_accessoryicon_component"
    public let accessoryIcon: AccessoryIcon

    public typealias AccessoryIcon = ConfigurationViewWrapper
}

extension AccessoryIconConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
