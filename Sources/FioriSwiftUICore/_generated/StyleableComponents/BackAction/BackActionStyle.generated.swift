// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol BackActionStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: BackActionConfiguration) -> Body
}

struct AnyBackActionStyle: BackActionStyle {
    let content: (BackActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (BackActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: BackActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct BackActionConfiguration {
    public var componentIdentifier: String = "fiori_backaction_component"
    public let backAction: BackAction

    public typealias BackAction = ConfigurationViewWrapper
}

extension BackActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct BackActionDefaultStyle: BackActionStyle {
    nonisolated init() {}

    func makeBody(_ configuration: BackActionConfiguration) -> some View {
        BackAction(configuration)
            .backActionStyle(BackActionBaseStyle())
    }
}
