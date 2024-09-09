// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct AvatarStack {
    let avatars: any View
    let avatarsTitle: any View

    @Environment(\.avatarStackStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@AvatarsBuilder avatars: () -> any View = { EmptyView() },
                @ViewBuilder avatarsTitle: () -> any View = { EmptyView() })
    {
        self.avatars = Avatars { avatars() }
        self.avatarsTitle = AvatarsTitle { avatarsTitle() }
    }
}

public extension AvatarStack {
    init(avatars: [TextOrIcon] = [],
         avatarsTitle: AttributedString? = nil)
    {
        self.init(avatars: { AvatarsListStack(avatars) }, avatarsTitle: { OptionalText(avatarsTitle) })
    }
}

public extension AvatarStack {
    init(_ configuration: AvatarStackConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AvatarStackConfiguration, shouldApplyDefaultStyle: Bool) {
        self.avatars = configuration.avatars
        self.avatarsTitle = configuration.avatarsTitle
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension AvatarStack: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(avatars: .init(self.avatars), avatarsTitle: .init(self.avatarsTitle))).typeErased
                .transformEnvironment(\.avatarStackStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension AvatarStack {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }

    func defaultStyle() -> some View {
        AvatarStack(.init(avatars: .init(self.avatars), avatarsTitle: .init(self.avatarsTitle)))
            .shouldApplyDefaultStyle(false)
            .avatarStackStyle(AvatarStackFioriStyle.ContentFioriStyle())
            .typeErased
    }
}
