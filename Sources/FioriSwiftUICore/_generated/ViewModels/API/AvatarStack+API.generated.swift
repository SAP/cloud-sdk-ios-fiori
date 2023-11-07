// Generated using Sourcery 1.2.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import SwiftUI

public struct AvatarStack {
    @Environment(\.avatarsModifier) private var avatarsModifier
	@Environment(\.avatarBorderColor) var avatarBorderColor
	@Environment(\.avatarBorderWidth) var avatarBorderWidth
	@Environment(\.isAvatarCircular) var isAvatarCircular
	@Environment(\.avatarSize) var avatarSize

    var _avatars: [TextOrIcon]? = nil
	
    public init(model: AvatarStackModel) {
        self.init(avatars: model.avatars)
    }

    public init(avatars: [TextOrIcon]? = nil) {
        self._avatars = avatars
    }
}
