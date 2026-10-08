// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol StartSignatureActionStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: StartSignatureActionConfiguration) -> Body
}

struct AnyStartSignatureActionStyle: StartSignatureActionStyle {
    let content: (StartSignatureActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (StartSignatureActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: StartSignatureActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct StartSignatureActionConfiguration {
    public var componentIdentifier: String = "fiori_startsignatureaction_component"
    public let startSignatureAction: StartSignatureAction

    public typealias StartSignatureAction = ConfigurationViewWrapper
}

extension StartSignatureActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct StartSignatureActionDefaultStyle: StartSignatureActionStyle {
    nonisolated init() {}

    func makeBody(_ configuration: StartSignatureActionConfiguration) -> some View {
        StartSignatureAction(configuration)
            .startSignatureActionStyle(StartSignatureActionBaseStyle())
    }
}
