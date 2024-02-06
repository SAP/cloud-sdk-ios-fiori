// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol AvatarsStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: AvatarsConfiguration) -> Body
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
    public let avatars: Avatars

    public typealias Avatars = ConfigurationViewWrapper
}
