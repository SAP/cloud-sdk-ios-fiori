// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
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
    public var componentIdentifier: String = "fiori_avatarstack_component"
    public let avatars: Avatars
    public let avatarsTitle: AvatarsTitle

    public typealias Avatars = ConfigurationViewWrapper
    public typealias AvatarsTitle = ConfigurationViewWrapper
}

public extension AvatarStackConfiguration {
    var contentIdentifier: String {
        self.componentIdentifier + "_content"
    }

    var avatarsIdentifier: String {
        self.componentIdentifier + "_avatars"
    }

    var avatarsTitleIdentifier: String {
        self.componentIdentifier + "_avatarsTitle"
    }
}

extension AvatarStackConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

public struct AvatarStackFioriStyle: AvatarStackStyle {
    public func makeBody(_ configuration: AvatarStackConfiguration) -> some View {
        AvatarStack(configuration)
            .avatarsStyle(AvatarsFioriStyle(avatarStackConfiguration: configuration))
            .avatarsTitleStyle(AvatarsTitleFioriStyle(avatarStackConfiguration: configuration))
    }
}

public struct AvatarStackNSSStyle: AvatarStackStyle {
    var isGlobal: Bool = false
    var data: NSSStyleData {
        self.isGlobal ? NSSTool.globalNSSStyle : NSSTool.mergeNSSStyle
    }

    public func makeBody(_ configuration: AvatarStackConfiguration) -> some View {
        AvatarStack(configuration)
            .avatarsStyle(AvatarsNSSStyle(avatarStackConfiguration: configuration, nssData: self.data.value(configuration.avatarsIdentifier)))
            .avatarsTitleStyle(AvatarsTitleNSSStyle(avatarStackConfiguration: configuration, nssData: self.data.value(configuration.avatarsTitleIdentifier)))
            .avatarStackStyle(ContentNSSStyle(avatarStackConfiguration: configuration, nssData: self.data.value(configuration.contentIdentifier)))
    }
}
