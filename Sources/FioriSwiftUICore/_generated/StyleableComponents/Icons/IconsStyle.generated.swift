// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol IconsStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: IconsConfiguration) -> Body
}

struct AnyIconsStyle: IconsStyle {
    let content: (IconsConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (IconsConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: IconsConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct IconsConfiguration {
    public var componentIdentifier: String = "fiori_icons_component"
    public let icons: Icons

    public typealias Icons = ConfigurationViewWrapper
}

public extension IconsConfiguration {
    var iconsIdentifier: String {
        self.componentIdentifier + "_icons"
    }
}

extension IconsConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
