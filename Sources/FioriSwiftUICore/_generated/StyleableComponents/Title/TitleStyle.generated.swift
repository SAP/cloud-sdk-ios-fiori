// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol TitleStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: TitleConfiguration) -> Body
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
    public var componentIdentifier: String = "fiori_title_component"
    public let title: Title

    public typealias Title = ConfigurationViewWrapper
}

extension TitleConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct TitleDefaultStyle: TitleStyle {
    nonisolated init() {}

    func makeBody(_ configuration: TitleConfiguration) -> some View {
        Title(configuration)
            .titleStyle(TitleBaseStyle())
    }
}
