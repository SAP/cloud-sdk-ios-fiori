// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol MediaImageStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: MediaImageConfiguration) -> Body
}

struct AnyMediaImageStyle: MediaImageStyle {
    let content: (MediaImageConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (MediaImageConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: MediaImageConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct MediaImageConfiguration {
    public var componentIdentifier: String = "fiori_mediaimage_component"
    public let mediaImage: MediaImage

    public typealias MediaImage = ConfigurationViewWrapper
}

extension MediaImageConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}
