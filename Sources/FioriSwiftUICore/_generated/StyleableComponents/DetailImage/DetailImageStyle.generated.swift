// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol DetailImageStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: DetailImageConfiguration) -> Body
}

struct AnyDetailImageStyle: DetailImageStyle {
    let content: (DetailImageConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (DetailImageConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: DetailImageConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct DetailImageConfiguration {
    public var componentIdentifier: String = "fiori_detailimage_component"
    public let detailImage: DetailImage

    public typealias DetailImage = ConfigurationViewWrapper
}

extension DetailImageConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
