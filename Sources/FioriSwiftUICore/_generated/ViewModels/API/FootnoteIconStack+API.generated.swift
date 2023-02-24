// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct FootnoteIconStack {
    @Environment(\.footnoteIconsModifier) private var footnoteIconsModifier
	@Environment(\.footnoteIconsMaxCount) var footnoteIconsMaxCount
	@Environment(\.isFootnoteIconsCircular) var isFootnoteIconsCircular
	@Environment(\.footnoteIconsSpacing) var footnoteIconsSpacing
	@Environment(\.footnoteIconsSize) var footnoteIconsSize

    var _footnoteIcons: [TextOrIcon]? = nil
	
    public init(model: FootnoteIconStackModel) {
        self.init(footnoteIcons: model.footnoteIcons)
    }

    public init(footnoteIcons: [TextOrIcon]? = nil) {
        self._footnoteIcons = footnoteIcons
    }
}
