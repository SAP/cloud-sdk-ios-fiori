// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol SubtitleStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: SubtitleConfiguration) -> Body
}

struct AnySubtitleStyle: SubtitleStyle {
    let content: (SubtitleConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (SubtitleConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: SubtitleConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct SubtitleConfiguration {
    public let subtitleIdentifier = "FioriSubtitle_subtitle"

    public let subtitle: Subtitle

    public typealias Subtitle = ConfigurationViewWrapper
}
