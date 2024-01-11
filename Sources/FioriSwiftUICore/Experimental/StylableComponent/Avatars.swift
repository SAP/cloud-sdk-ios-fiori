import FioriMacro
import Foundation
import SwiftUI

extension AvatarStack {
    init(_ icons: [TextOrIcon]) {
        self.init(avatars: icons)
    }
}

@BaseComponent
public struct Avatars: _AvatarsComponent {
    @ViewBuilder
    let avatars: any View
    private let _avatars = ["dataType": "[TextOrIcon]", "viewType": "AvatarStack"]
}
