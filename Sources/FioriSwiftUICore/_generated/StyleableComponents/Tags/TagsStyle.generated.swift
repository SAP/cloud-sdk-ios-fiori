// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol TagsStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TagsConfiguration) -> Body
}

struct AnyTagsStyle: TagsStyle {
    let content: (TagsConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TagsConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TagsConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TagsConfiguration {
    public var componentIdentifier: String = "fiori_tags_component"
    public let tags: Tags

    public typealias Tags = ConfigurationViewWrapper
}

public extension TagsConfiguration {
    var tagsIdentifier: String {
        self.componentIdentifier + "_tags"
    }
}

extension TagsConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
