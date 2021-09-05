// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct IconStack {
    @Environment(\.iconsModifier) private var iconsModifier
	@Environment(\.numberOfLines) var numberOfLines

    var _icons: [TextOrIcon]? = nil
	
    public init(model: IconStackModel) {
        self.init(icons: model.icons)
    }

    public init(icons: [TextOrIcon]? = nil) {
        self._icons = icons
    }
}
