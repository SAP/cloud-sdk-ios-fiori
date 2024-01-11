import FioriMacro
import Foundation
import SwiftUI

extension FootnoteIconStack {
    init(_ icons: [TextOrIcon]) {
        self.init(footnoteIcons: icons)
    }
}

@BaseComponent
public struct FootnoteIcons: _FootnoteIconsComponent {
    @ViewBuilder
    let footnoteIcons: any View
    private let _footnoteIcons = ["dataType": "[TextOrIcon]", "viewType": "FootnoteIconStack"]
}
