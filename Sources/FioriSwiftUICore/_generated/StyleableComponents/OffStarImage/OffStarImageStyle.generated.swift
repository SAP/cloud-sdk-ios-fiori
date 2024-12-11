// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FioriThemeManager
import Foundation
import SwiftUI

public protocol OffStarImageStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: OffStarImageConfiguration) -> Body
}

struct AnyOffStarImageStyle: OffStarImageStyle {
    let content: (OffStarImageConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (OffStarImageConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: OffStarImageConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct OffStarImageConfiguration {
    public let offStarImageIdentifier = "FioriOffStarImage_offStarImage"

    public let offStarImage: OffStarImage

    public typealias OffStarImage = ConfigurationViewWrapper
}
