// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AvatarStackStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AvatarStackConfiguration) -> Body
}

struct AnyAvatarStackStyle: AvatarStackStyle {
    let content: (AvatarStackConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AvatarStackConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AvatarStackConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AvatarStackConfiguration {
    public let avatars: Avatars
    public let avatarsTitle: AvatarsTitle

    public typealias Avatars = ConfigurationViewWrapper
    public typealias AvatarsTitle = ConfigurationViewWrapper
}

public struct AvatarStackFioriStyle: AvatarStackStyle {
    public func makeBody(_ configuration: AvatarStackConfiguration) -> some View {
        AvatarStack(configuration)
            .avatarsStyle(AvatarsFioriStyle(avatarStackConfiguration: configuration))
            .avatarsTitleStyle(AvatarsTitleFioriStyle(avatarStackConfiguration: configuration))
    }
}
