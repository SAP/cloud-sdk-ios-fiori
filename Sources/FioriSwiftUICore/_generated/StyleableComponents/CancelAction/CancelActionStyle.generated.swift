// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol CancelActionStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: CancelActionConfiguration) -> Body
}

struct AnyCancelActionStyle: CancelActionStyle {
    let content: (CancelActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (CancelActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: CancelActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct CancelActionConfiguration {
    public var componentIdentifier: String = "fiori_cancelaction_component"
    public let cancelAction: CancelAction

    public typealias CancelAction = ConfigurationViewWrapper
}

extension CancelActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct CancelActionDefaultStyle: CancelActionStyle {
    nonisolated init() {}

    func makeBody(_ configuration: CancelActionConfiguration) -> some View {
        CancelAction(configuration)
            .cancelActionStyle(CancelActionBaseStyle())
    }
}
