import FioriThemeManager
// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TitleStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TitleConfiguration) -> Body
}

struct AnyTitleStyle: TitleStyle {
    let content: (TitleConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TitleConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TitleConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TitleConfiguration {
    public let title: Title
	
    public typealias Title = ConfigurationViewWrapper
}

// MARK: SDK Developer implementations

// Base Layout style
public struct TitleBaseStyle: TitleStyle {
    public func makeBody(_ configuration: TitleConfiguration) -> some View {
        configuration.title
    }
}

// Default fiori styles
public struct TitleFioriStyle: TitleStyle {
    public func makeBody(_ configuration: TitleConfiguration) -> some View {
        Title(configuration)
            .foregroundStyle(Color.preferredColor(.primaryLabel))
            .font(.fiori(forTextStyle: .headline))
    }
}
