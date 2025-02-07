// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol HalfStarImageStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: HalfStarImageConfiguration) -> Body
}

struct AnyHalfStarImageStyle: HalfStarImageStyle {
    let content: (HalfStarImageConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (HalfStarImageConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: HalfStarImageConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct HalfStarImageConfiguration {
    public var componentIdentifier: String = "fiori_halfstarimage_component"
    public let halfStarImage: HalfStarImage

    public typealias HalfStarImage = ConfigurationViewWrapper
}

extension HalfStarImageConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
