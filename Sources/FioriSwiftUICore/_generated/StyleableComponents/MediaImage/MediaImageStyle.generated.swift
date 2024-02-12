// Generated using Sourcery 2.1.3 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol MediaImageStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: MediaImageConfiguration) -> Body
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
    public let mediaImage: MediaImage

    public typealias MediaImage = ConfigurationViewWrapper
}
