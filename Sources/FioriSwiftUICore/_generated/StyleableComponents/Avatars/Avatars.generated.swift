// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public struct Avatars {
    let avatars: any View

    @Environment(\.avatarsStyle) var style

    fileprivate var _shouldApplyDefaultStyle = true

    public init(@AvatarsBuilder avatars: () -> any View = { EmptyView() }) {
        self.avatars = avatars()
    }
}

public extension Avatars {
    init(avatars: [TextOrIcon] = []) {
        self.init(avatars: { AvatarStack(avatars) })
    }
}

public extension Avatars {
    init(_ configuration: AvatarsConfiguration) {
        self.init(configuration, shouldApplyDefaultStyle: false)
    }

    internal init(_ configuration: AvatarsConfiguration, shouldApplyDefaultStyle: Bool) {
        self.avatars = configuration.avatars
        self._shouldApplyDefaultStyle = shouldApplyDefaultStyle
    }
}

extension Avatars: View {
    public var body: some View {
        if self._shouldApplyDefaultStyle {
            self.defaultStyle()
        } else {
            self.style.resolve(configuration: .init(avatars: .init(self.avatars))).typeErased
                .transformEnvironment(\.avatarsStyleStack) { stack in
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                }
        }
    }
}

private extension Avatars {
    func shouldApplyDefaultStyle(_ bool: Bool) -> some View {
        var s = self
        s._shouldApplyDefaultStyle = bool
        return s
    }
        
    func defaultStyle() -> some View {
        Avatars(avatars: { self.avatars })
            .shouldApplyDefaultStyle(false)
            .avatarsStyle(.fiori)
            .typeErased
    }
}
