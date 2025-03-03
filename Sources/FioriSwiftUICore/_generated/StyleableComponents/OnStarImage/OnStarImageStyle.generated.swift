// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol OnStarImageStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: OnStarImageConfiguration) -> Body
}

struct AnyOnStarImageStyle: OnStarImageStyle {
    let content: (OnStarImageConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (OnStarImageConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: OnStarImageConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct OnStarImageConfiguration {
    public var componentIdentifier: String = "fiori_onstarimage_component"
    public let onStarImage: OnStarImage

    public typealias OnStarImage = ConfigurationViewWrapper
}

extension OnStarImageConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
