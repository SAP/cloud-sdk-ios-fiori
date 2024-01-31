import FioriThemeManager
// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
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
    public let icons: Icons
	
    public typealias Icons = ConfigurationViewWrapper
}

// MARK: SDK Developer implementations

// Base Layout style
public struct IconsBaseStyle: IconsStyle {
    public func makeBody(_ configuration: IconsConfiguration) -> some View {
        configuration.icons
    }
}

// Default fiori styles
public struct IconsFioriStyle: IconsStyle {
    public func makeBody(_ configuration: IconsConfiguration) -> some View {
        Icons(configuration)
    }
}
