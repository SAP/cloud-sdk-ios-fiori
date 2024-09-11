// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AvatarsTitleStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AvatarsTitleConfiguration) -> Body
}

struct AnyAvatarsTitleStyle: AvatarsTitleStyle {
    let content: (AvatarsTitleConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AvatarsTitleConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AvatarsTitleConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AvatarsTitleConfiguration {
    public let avatarsTitle: AvatarsTitle

    public typealias AvatarsTitle = ConfigurationViewWrapper
}
