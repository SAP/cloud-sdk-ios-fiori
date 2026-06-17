import Foundation
import SwiftUI

extension AvatarStack {
    @MainActor init(_ icons: [TextOrIcon]) {
        self.init(avatars: icons)
    }
}

// TODO: make TagStack accept AttributedString
public extension TagStack {
    @MainActor init(_ tags: [AttributedString]) {
        self._tags = tags.map { "\($0)" }
    }
}

extension IconStack {
    @MainActor init(_ icons: [TextOrIcon]) {
        self.init(icons: icons)
    }
}

public extension FootnoteIconStack {
    @MainActor init(_ footnoteIcons: [TextOrIcon]) {
        self._footnoteIcons = footnoteIcons
    }
}
