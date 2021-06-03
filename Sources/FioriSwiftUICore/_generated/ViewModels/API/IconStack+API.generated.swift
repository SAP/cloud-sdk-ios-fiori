// Generated using Sourcery 1.3.4 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct IconStack {
    @Environment(\.numberOfLines) var numberOfLines

    var _icons: [IconStackItem]? = nil
	
    public init(model: IconStackModel) {
        self.init(icons: model.icons_)
    }

    public init(icons: [IconStackItem]? = nil) {
        self._icons = icons
    }
}
