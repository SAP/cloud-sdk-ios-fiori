// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

public protocol HeaderActionStyle: DynamicProperty {
    associatedtype Body: View

    func makeBody(_ configuration: HeaderActionConfiguration) -> Body
}

struct AnyHeaderActionStyle: HeaderActionStyle {
    let content: (HeaderActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (HeaderActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: HeaderActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct HeaderActionConfiguration {
    public let headerAction: HeaderAction

    public typealias HeaderAction = ConfigurationViewWrapper
}
