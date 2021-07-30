// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct IconStack {
    @Environment(\.numberOfLines) var numberOfLines

    var _icons: [TextOrIcon]? = nil
	
    public init(model: IconStackModel) {
        self.init(icons: model.icons_)
    }

    public init(icons: [TextOrIcon]? = nil) {
        self._icons = icons
    }
}
