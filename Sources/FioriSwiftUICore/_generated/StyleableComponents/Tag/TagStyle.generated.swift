// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol TagStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: TagConfiguration) -> Body
}

struct AnyTagStyle: TagStyle {
    let content: (TagConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (TagConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: TagConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct TagConfiguration {
    public let tag: Tag

    public typealias Tag = ConfigurationViewWrapper
}
