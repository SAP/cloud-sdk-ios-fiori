// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol NodeImageStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: NodeImageConfiguration) -> Body
}

struct AnyNodeImageStyle: NodeImageStyle {
    let content: (NodeImageConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (NodeImageConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: NodeImageConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct NodeImageConfiguration {
    public let nodeImage: NodeImage

    public typealias NodeImage = ConfigurationViewWrapper
}
