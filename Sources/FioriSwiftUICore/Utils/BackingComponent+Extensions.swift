import Foundation
import SwiftUI

extension AvatarStack {
    init(_ icons: [TextOrIcon]) {
        self.init(avatars: icons)
    }
}

// TODO: make TagStack accept AttributedString
public extension TagStack {
    init(_ tags: [AttributedString]) {
        self._tags = tags.map { "\($0)" }
    }
}

extension IconStack {
    init(_ icons: [TextOrIcon]) {
        self.init(icons: icons)
    }
}

public extension FootnoteIconStack {
    init(_ footnoteIcons: [TextOrIcon]) {
        self._footnoteIcons = footnoteIcons
    }
}
