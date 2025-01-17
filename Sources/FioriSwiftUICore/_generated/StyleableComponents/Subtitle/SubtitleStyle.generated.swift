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
    public var componentIdentifier: String = "fiori_subtitle_component"
    public let subtitle: Subtitle

    public typealias Subtitle = ConfigurationViewWrapper
}

public extension SubtitleConfiguration {
    var subtitleIdentifier: String {
        self.componentIdentifier + "_subtitle"
    }
}

extension SubtitleConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
