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
    public var componentIdentifier: String = "fiori_offstarimage_component"
    public let offStarImage: OffStarImage

    public typealias OffStarImage = ConfigurationViewWrapper
}

public extension OffStarImageConfiguration {
    var offStarImageIdentifier: String {
        self.componentIdentifier + "_offStarImage"
    }
}

extension OffStarImageConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
