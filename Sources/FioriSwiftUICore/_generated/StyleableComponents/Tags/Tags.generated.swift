// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Tags {
    let tags: any View

    @Environment(\.tagsStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@TagBuilder tags: () -> any View = { EmptyView() }) {
        self.tags = tags()
    }
}

public extension Tags {
    init(tags: [AttributedString] = []) {
        self.init(tags: { TagStack(tags) })
    }
}

public extension Tags {
    init(_ configuration: TagsConfiguration) {
        self.tags = configuration.tags
        self._shouldApplyDefaultStyle = false
    }
}

extension Tags: View {
    public var body: some View {
        if _shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            style.resolve(configuration: .init(tags: .init(self.tags))).typeErased
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
        Tags(tags: { self.tags })
            .shouldApplyDefaultStyle(false)
            .tagsStyle(.fiori)
            .typeErased
    }
}
