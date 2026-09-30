// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol HeaderActionStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: HeaderActionConfiguration) -> Body
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
    public var componentIdentifier: String = "fiori_headeraction_component"
    public let headerAction: HeaderAction

    public typealias HeaderAction = ConfigurationViewWrapper
}

extension HeaderActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct HeaderActionDefaultStyle: HeaderActionStyle {
    nonisolated init() {}

    func makeBody(_ configuration: HeaderActionConfiguration) -> some View {
        HeaderAction(configuration)
            .headerActionStyle(HeaderActionBaseStyle())
    }
}
