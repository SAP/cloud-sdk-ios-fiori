// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import Foundation
import SwiftUI

@MainActor @preconcurrency public protocol UpVoteActionStyle: DynamicProperty {
    associatedtype Body: View

    @MainActor @ViewBuilder @preconcurrency func makeBody(_ configuration: UpVoteActionConfiguration) -> Body
}

struct AnyUpVoteActionStyle: UpVoteActionStyle {
    let content: (UpVoteActionConfiguration) -> any View

    init(@ViewBuilder _ content: @escaping (UpVoteActionConfiguration) -> any View) {
        self.content = content
    }

    public func makeBody(_ configuration: UpVoteActionConfiguration) -> some View {
        self.content(configuration).typeErased
    }
}

public struct UpVoteActionConfiguration {
    public var componentIdentifier: String = "fiori_upvoteaction_component"
    public let upVoteAction: UpVoteAction

    public typealias UpVoteAction = ConfigurationViewWrapper
}

extension UpVoteActionConfiguration {
    func isDirectChild(_ componentIdentifier: String) -> Bool {
        componentIdentifier == self.componentIdentifier
    }
}

struct UpVoteActionDefaultStyle: UpVoteActionStyle {
    nonisolated init() {}

    func makeBody(_ configuration: UpVoteActionConfiguration) -> some View {
        UpVoteAction(configuration)
            .upVoteActionStyle(UpVoteActionBaseStyle())
    }
}
