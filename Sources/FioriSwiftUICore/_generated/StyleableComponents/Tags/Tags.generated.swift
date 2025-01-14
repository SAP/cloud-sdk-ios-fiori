// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Tags {
    let tags: any View

    @Environment(\.tagsStyle) var style

    var componentIdentifier: String = Tags.identifier

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@TagBuilder tags: () -> any View = { EmptyView() },
                componentIdentifier: String? = Tags.identifier)
    {
        self.tags = tags()
        self.componentIdentifier = componentIdentifier ?? Tags.identifier
    }
}

public extension Tags {
    static let identifier = "fiori_tags_component"
}

public extension Tags {
    init(tags: [AttributedString] = []) {
        self.init(tags: { TagStack(tags) })
    }
}

public extension Tags {
    init(_ configuration: TagsConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: TagsConfiguration, shouldApplyDefaultStyle: Bool) {
        self.tags = configuration.tags
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
        self.componentIdentifier = configuration.componentIdentifier
    }
}

extension Tags: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(componentIdentifier: self.componentIdentifier, tags: .init(self.tags))).typeErased
                .transformEnvironment(\.tagsStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Tags {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        Tags(.init(componentIdentifier: self.componentIdentifier, tags: .init(self.tags)))
            .shouldApplyDefaultStyle(false)
            .tagsStyle(.fiori)
            .typeErased
    }
}
