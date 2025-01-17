// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol ActivityItemsStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: ActivityItemsConfiguration) -> Body
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

public extension ActivityItemsConfiguration {
    var activityItemsIdentifier: String {
        self.componentIdentifier + "_activityItems"
    }
}

extension ActivityItemsConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
