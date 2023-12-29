import FioriMacro
import Foundation
import SwiftUI

extension IconStack {
    init(_ icons: [TextOrIcon]) {
        self.init(icons: icons)
    }
}

@BaseComponent
public struct Icons: _IconsComponent {
    @ViewBuilder
    let icons: any View
    private let _icons = (dataType: "[TextOrIcon]", viewType: "IconStack")
}
