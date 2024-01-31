import FioriThemeManager
// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol DescriptionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: DescriptionConfiguration) -> Body
}

struct AnyDescriptionStyle: DescriptionStyle {
    let content: (DescriptionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DescriptionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DescriptionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct DescriptionConfiguration {
    public let description: Description
	
    public typealias Description = ConfigurationViewWrapper
}

// MARK: SDK Developer implementations

// Base Layout style
public struct DescriptionBaseStyle: DescriptionStyle {
    public func makeBody(_ configuration: DescriptionConfiguration) -> some View {
        configuration.description
    }
}

// Default fiori styles
public struct DescriptionFioriStyle: DescriptionStyle {
    public func makeBody(_ configuration: DescriptionConfiguration) -> some View {
        Description(configuration)
            .foregroundStyle(Color.preferredColor(.tertiaryLabel))
            .font(.fiori(forTextStyle: .subheadline))
    }
}
