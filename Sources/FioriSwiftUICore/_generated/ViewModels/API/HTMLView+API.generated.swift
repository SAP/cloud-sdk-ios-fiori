// Generated using Sourcery 1.1.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct HTMLView {
    @Environment(\.htmlContentModifier) private var htmlContentModifier

    var _htmlContent: NSAttributedString? = nil
	@State var contentHeight: CGFloat = .zero
    public init(model: HTMLViewModel) {
        self.init(htmlContent: model.htmlContent)
    }

    public init(htmlContent: NSAttributedString? = nil) {
        self._htmlContent = htmlContent
    }
}
