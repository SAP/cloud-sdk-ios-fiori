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
    public let tagsIdentifier = "FioriTags_tags"

    public let tags: Tags

    public typealias Tags = ConfigurationViewWrapper
}
