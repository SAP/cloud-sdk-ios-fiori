// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol AvatarsStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: AvatarsConfiguration) -> Body
}

struct AnyAvatarsStyle: AvatarsStyle {
    let content: (AvatarsConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (AvatarsConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: AvatarsConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct AvatarsConfiguration {
    public var componentIdentifier: String = "fiori_avatars_component"
    public let avatars: Avatars

    public typealias Avatars = ConfigurationViewWrapper
}

extension AvatarsConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct AvatarsDefaultStyle: AvatarsStyle {
    nonisolated init() {}

    func makeBody(_ configuration: AvatarsConfiguration) -> some View {
        Avatars(configuration)
            .avatarsStyle(AvatarsBaseStyle())
    }
}
